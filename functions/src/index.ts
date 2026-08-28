import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

const db = admin.firestore();
const messaging = admin.messaging();

/**
 * Cloud Function: sendTodoNotification
 * Triggers when a new todo is created under users/{userId}/todos/{todoId}
 * Sends FCM push notification to the user
 */
export const sendTodoNotification = functions.firestore
  .document("users/{userId}/todos/{todoId}")
  .onCreate(async (snap, context) => {
    const todoData = snap.data();
    const userId = context.params.userId;
    const todoId = context.params.todoId;

    functions.logger.info(
      `New todo created: ${todoId} by user: ${userId}`,
      { structuredData: true }
    );

    try {
      // Get user document to find FCM token
      const userDoc = await db.collection("users").doc(userId).get();

      if (!userDoc.exists) {
        functions.logger.warn(`User document not found: ${userId}`);
        return null;
      }

      const userData = userDoc.data();
      const fcmToken = userData?.fcmToken;

      if (!fcmToken) {
        functions.logger.warn(
          `No FCM token found for user: ${userId}. User needs to open the app to register token.`
        );
        return null;
      }

      // Extract todo fields
      const title = todoData?.fields?.title?.stringValue || "Untitled Todo";
      const description =
        todoData?.fields?.description?.stringValue || "No description";
      const isDone =
        todoData?.fields?.isDone?.booleanValue === true ? "✅" : "📝";

      // Create notification payload
      const notification: admin.messaging.Notification = {
        title: `${isDone} Todo Baru Dibuat!`,
        body: `"${title}" telah ditambahkan ke daftar todo.`,
      };

      const data: { [key: string]: string } = {
        todoId: todoId,
        userId: userId,
        title: title,
        click_action: "FLUTTER_NOTIFICATION_CLICK",
      };

      const message: admin.messaging.Message = {
        token: fcmToken,
        notification: notification,
        data: data,
        android: {
          priority: "high",
          notification: {
            channelId: "todo_channel",
            clickAction: "FLUTTER_NOTIFICATION_CLICK",
          },
        },
        apns: {
          payload: {
            aps: {
              alert: {
                title: notification.title,
                body: notification.body,
              },
              sound: "default",
              badge: 1,
            },
          },
        },
      };

      // Send notification
      const response = await messaging.send(message);
      functions.logger.info(`Notification sent successfully: ${response}`);

      return { success: true, messageId: response };
    } catch (error) {
      functions.logger.error("Error sending notification:", error);
      throw error;
    }
  });

/**
 * Cloud Function: sendTodoUpdateNotification
 * Triggers when a todo is updated
 */
export const sendTodoUpdateNotification = functions.firestore
  .document("users/{userId}/todos/{todoId}")
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();
    const userId = context.params.userId;
    const todoId = context.params.todoId;

    // Check if isDone changed
    const wasDone = before?.fields?.isDone?.booleanValue === true;
    const isNowDone = after?.fields?.isDone?.booleanValue === true;

    if (wasDone === isNowDone) {
      return null; // No status change, skip
    }

    try {
      const userDoc = await db.collection("users").doc(userId).get();
      const fcmToken = userDoc.data()?.fcmToken;

      if (!fcmToken) return null;

      const title = after?.fields?.title?.stringValue || "Todo";
      const statusEmoji = isNowDone ? "✅" : "📝";
      const statusText = isNowDone ? "selesai" : "dibuka kembali";

      const message: admin.messaging.Message = {
        token: fcmToken,
        notification: {
          title: `${statusEmoji} Todo Diupdate`,
          body: `"${title}" telah ${statusText}.`,
        },
        data: {
          todoId: todoId,
          userId: userId,
          click_action: "FLUTTER_NOTIFICATION_CLICK",
        },
        android: {
          priority: "high",
          notification: {
            channelId: "todo_channel",
            clickAction: "FLUTTER_NOTIFICATION_CLICK",
          },
        },
      };

      const response = await messaging.send(message);
      functions.logger.info(`Update notification sent: ${response}`);
      return { success: true, messageId: response };
    } catch (error) {
      functions.logger.error("Error sending update notification:", error);
      throw error;
    }
  });
