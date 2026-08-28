import 'package:fire_todo/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fire_todo/feature/profile/domain/models/user_model.dart';
import 'package:fire_todo/feature/profile/domain/models/delete_account_model.dart';
import 'package:fire_todo/feature/auth/domain/models/request_email_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileState Unit Tests', () {
    test('initial state has correct default values', () {
      const state = ProfileState.initial();
      expect(state, isA<ProfileState>());
      state.maybeWhen(
        initial: () => expect(true, true),
        orElse: () => fail('Expected initial state'),
      );
    });

    test('loading state has correct default values', () {
      const state = ProfileState.loading();
      expect(state, isA<ProfileState>());
      state.maybeWhen(
        loading: () => expect(true, true),
        orElse: () => fail('Expected loading state'),
      );
    });

    test('loaded state holds UserModel data', () {
      const userModel = UserModel(
        kind: 'test',
        users: [
          UserElementData(
            localId: 'uid123',
            email: 'test@example.com',
            displayName: 'Test User',
          ),
        ],
      );
      const state = ProfileState.loaded(response: userModel);

      state.maybeWhen(
        loaded: (response) {
          expect(response.kind, 'test');
          expect(response.users, isNotNull);
          expect(response.users!.first.localId, 'uid123');
          expect(response.users!.first.email, 'test@example.com');
        },
        orElse: () => fail('Expected loaded state'),
      );
    });

    test('loaded state defaults to empty UserModel', () {
      const state = ProfileState.loaded();

      state.maybeWhen(
        loaded: (response) {
          expect(response, isA<UserModel>());
          expect(response.kind, isNull);
          expect(response.users, isNull);
        },
        orElse: () => fail('Expected loaded state'),
      );
    });

    test('failed state holds error message', () {
      const state = ProfileState.failed(errorMessage: 'Something went wrong');

      state.maybeWhen(
        failed: (errorMessage) {
          expect(errorMessage, 'Something went wrong');
        },
        orElse: () => fail('Expected failed state'),
      );
    });

    test('failed state defaults to empty string', () {
      const state = ProfileState.failed();

      state.maybeWhen(
        failed: (errorMessage) {
          expect(errorMessage, '');
        },
        orElse: () => fail('Expected failed state'),
      );
    });

    test('delete state holds DeleteAccountModel', () {
      const deleteModel = DeleteAccountModel(kind: 'test');
      const state = ProfileState.delete(response: deleteModel);

      state.maybeWhen(
        delete: (response) {
          expect(response.kind, 'test');
        },
        orElse: () => fail('Expected delete state'),
      );
    });

    test('delete state defaults to empty DeleteAccountModel', () {
      const state = ProfileState.delete();

      state.maybeWhen(
        delete: (response) {
          expect(response, isA<DeleteAccountModel>());
          expect(response.kind, isNull);
        },
        orElse: () => fail('Expected delete state'),
      );
    });

    test('reset state holds RequestEmailModel', () {
      const resetModel = RequestEmailModel(
        kind: 'test',
        email: 'test@example.com',
      );
      const state = ProfileState.reset(response: resetModel);

      state.maybeWhen(
        reset: (response) {
          expect(response.kind, 'test');
          expect(response.email, 'test@example.com');
        },
        orElse: () => fail('Expected reset state'),
      );
    });

    test('reset state defaults to empty RequestEmailModel', () {
      const state = ProfileState.reset();

      state.maybeWhen(
        reset: (response) {
          expect(response, isA<RequestEmailModel>());
          expect(response.kind, isNull);
          expect(response.email, isNull);
        },
        orElse: () => fail('Expected reset state'),
      );
    });
  });
}
