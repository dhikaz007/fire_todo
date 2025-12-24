part of 'services.dart';

class TodoServices with BaseServices implements TodoRepository {
  final HiveRepository hiveRepository;
  TodoServices({required this.hiveRepository});

  final String _baseUrl = UrlApp.collectionUrl;

  String _buildTodoPath([String? docId]) {
    final user = hiveRepository.getProfileValue();
    if (user?.localId == null) {
      throw Exception('User tidak ditemukan, tidak dapat mengakses data.');
    }
    final basePath = '$_baseUrl/${user!.localId}/todos';
    return docId != null ? '$basePath/$docId' : basePath;
  }

  @override
  Future<ResponseAPI<ListTodoModel>> fetchListTodo() async {
    try {
      final http = await dio(ApiType.firestore);
      Response response = await http.get(_buildTodoPath());

      final data = response.data;
      if (response.statusCode == 200) {
        final datas = ListTodoModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(datas);
      }

      final error = ErrorResponseModel.fromJson(Map.from(data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DocumentModel>> postTodo(
    String? title,
    String? description,
    DateTime? createdAt,
    bool? isDone,
  ) async {
    try {
      final http = await dio(ApiType.firestore);
      final fields = FieldsModel(
        title: DescriptionValueModel(stringValue: title),
        description: DescriptionValueModel(stringValue: description),
        dueDate: DueDateValueModel(timestampValue: createdAt),
        isDone: IsDoneValueModel(booleanValue: isDone),
      );

      Response response = await http.post(_buildTodoPath(), data: {
        "fields": fields.toJson(),
      });

      final data = response.data;
      if (response.statusCode == 200) {
        final doc = DocumentModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(doc);
      }

      final error = ErrorResponseModel.fromJson(Map.from(data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DocumentModel>> patchTodo(
    String id,
    String title,
    String description,
    bool? isDone,
    DateTime? dueDate,
  ) async {
    try {
      final http = await dio(ApiType.firestore);
      final Map<String, dynamic> fields = {};

      if (title.isNotEmpty) fields['title'] = {"stringValue": title};
      if (description.isNotEmpty) {
        fields['description'] = {"stringValue": description};
      }
      if (dueDate != null) {
        fields['dueDate'] = {
          "timestampValue": dueDate.toUtc().toIso8601String()
        };
      }
      if (isDone != null) fields['isDone'] = {"booleanValue": isDone};

      final body = {"fields": fields};

      Response response = await http.patch(
        _buildTodoPath(id),
        data: body,
        queryParameters: {"updateMask.fieldPaths": fields.keys.toList()},
      );

      final data = response.data;
      if (response.statusCode == 200) {
        final doc = DocumentModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(doc);
      }

      final error = ErrorResponseModel.fromJson(Map.from(data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<String>> deleteTodo(String id) async {
    try {
      final http = await dio(ApiType.firestore);
      Response response = await http.delete(_buildTodoPath(id));

      if (response.statusCode == 200) {
        return ResponseAPI.fromValue(
            response.statusMessage ?? 'Todo berhasil dihapus.');
      }

      final error = ErrorResponseModel.fromJson(Map.from(response.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<DocumentModel>> fetchTodoDetail(String id) async {
    try {
      final http = await dio(ApiType.firestore);
      Response response = await http.get(_buildTodoPath(id));

      final data = response.data;
      if (response.statusCode == 200) {
        final doc = DocumentModel.fromJson(Map.from(data));
        return ResponseAPI.fromValue(doc);
      }

      final error = ErrorResponseModel.fromJson(Map.from(data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }

  @override
  Future<ResponseAPI<String>> deleteAllTodosInUser() async {
    try {
      final http = await dio(ApiType.firestore);

      final getListResponse = await http.get(_buildTodoPath());
      if (getListResponse.statusCode != 200) {
        final error =
            ErrorResponseModel.fromJson(Map.from(getListResponse.data));
        throw ResponseAPI.fromValue(error);
      }
      final listTodoModel =
          ListTodoModel.fromJson(Map.from(getListResponse.data));

      if (listTodoModel.documents == null || listTodoModel.documents!.isEmpty) {
        return ResponseAPI.fromValue('Tidak ada dokumen todo untuk dihapus.');
      }

      final List<Map<String, dynamic>> writes = [];
      for (final doc in listTodoModel.documents!) {
        // 'name' adalah path lengkap dokumen, contoh: projects/.../documents/users/ID/todos/ID_TODO
        writes.add({"delete": doc.name});
      }

      final batchUrl =
          '/${UrlApp.projectId}/databases/(default)/documents:commit';
      final batchResponse = await http.post(batchUrl, data: {"writes": writes});

      if (batchResponse.statusCode == 200) {
        return ResponseAPI.fromValue(
            'Semua todo berhasil dihapus dalam satu operasi batch.');
      }

      final error = ErrorResponseModel.fromJson(Map.from(batchResponse.data));
      throw ResponseAPI.fromValue(error);
    } on DioException catch (e) {
      throw ApiException(e.errorMessageCustom(), e);
    }
  }
}

// class TodoServices with BaseServices implements TodoRepository {
//   // final user = Modular.get<HiveController>().profile;

//   @override
//   Future<ResponseAPI<ListTodoModel>> fetchListTodo() async {
//     try {
//       Dio http = await dio(ApiType.firestore);

//       ProfileHive? user = Modular.get<HiveController>().profile;

//       Response response =
//           await http.get('/${UrlApp.collectionUrl}/${user?.localId}/todos');

//       final data = response.data;
//       if (response.statusCode == 200) {
//         final datas = ListTodoModel.fromJson(Map.from(data));
//         return ResponseAPI.fromValue(datas);
//       }

//       final error = ErrorResponseModel.fromJson(Map.from(data));
//       throw ResponseAPI.fromValue(error);
//     } on DioException catch (e) {
//       throw ApiException(e.errorMessageCustom(), e);
//     }
//   }

//   @override
//   Future<ResponseAPI<Document>> postTodo(
//     String? title,
//     String? description,
//     DateTime? createdAt,
//     bool? isDone,
//   ) async {
//     try {
//       Dio http = await dio(ApiType.firestore);

//       final fields = Fields(
//         title: Description(stringValue: title),
//         description: Description(stringValue: description),
//         dueDate: DueDate(timestampValue: createdAt),
//         isDone: IsDone(booleanValue: isDone),
//       );

//       ProfileHive? user = Modular.get<HiveController>().profile;

//       Response response = await http
//           .post('/${UrlApp.collectionUrl}/${user?.localId}/todos', data: {
//         "fields": fields.toJSON(),
//       });

//       final data = response.data;
//       if (response.statusCode == 200) {
//         final doc = Document.fromJson(Map.from(data));
//         return ResponseAPI.fromValue(doc);
//       }

//       final error = ErrorResponseModel.fromJson(Map.from(data));
//       throw ResponseAPI.fromValue(error);
//     } on DioException catch (e) {
//       throw ApiException(e.errorMessageCustom(), e);
//     }
//   }

//   @override
//   Future<ResponseAPI<Document>> patchTodo(
//     String id,
//     String title,
//     String description,
//     bool? isDone,
//     DateTime? dueDate,
//   ) async {
//     try {
//       Dio http = await dio(ApiType.firestore);

//       final Map<String, dynamic> fields = {};

//       if (title.isNotEmpty) {
//         fields['title'] = {"stringValue": title};
//       }
//       if (description.isNotEmpty) {
//         fields['description'] = {"stringValue": description};
//       }
//       if (dueDate != null) {
//         fields['dueDate'] = {
//           "timestampValue": dueDate.toUtc().toIso8601String()
//         };
//       }

//       if (isDone != null) {
//         fields['isDone'] = {"booleanValue": isDone};
//       }

//       final body = {"fields": fields};

//       ProfileHive? user = Modular.get<HiveController>().profile;

//       Response response = await http.patch(
//         '/${UrlApp.collectionUrl}/${user?.localId}/todos/$id',
//         data: body,
//         queryParameters: {"updateMask.fieldPaths": fields.keys.toList()},
//       );

//       final data = response.data;
//       if (response.statusCode == 200) {
//         final doc = Document.fromJson(Map.from(data));
//         return ResponseAPI.fromValue(doc);
//       }

//       final error = ErrorResponseModel.fromJson(Map.from(data));
//       throw ResponseAPI.fromValue(error);
//     } on DioException catch (e) {
//       throw ApiException(e.errorMessageCustom(), e);
//     }
//   }

//   @override
//   Future<dynamic> deleteTodo(String id) async {
//     try {
//       Dio http = await dio(ApiType.firestore);

//       ProfileHive? user = Modular.get<HiveController>().profile;

//       Response response = await http
//           .delete('/${UrlApp.collectionUrl}/${user?.localId}/todos/$id');

//       final data = response.data;

//       if (response.statusCode == 200) {
//         return response.statusMessage;
//       }

//       throw data['error'];
//     } on DioException catch (e) {
//       throw e.errorMessageCustom();
//     }
//   }

//   @override
//   Future<ResponseAPI<Document>> fetchTodoDetail(String id) async {
//     try {
//       Dio http = await dio(ApiType.firestore);

//       ProfileHive? user = Modular.get<HiveController>().profile;

//       Response response =
//           await http.get('/${UrlApp.collectionUrl}/${user?.localId}/todos/$id');

//       final data = response.data;
//       if (response.statusCode == 200) {
//         final doc = Document.fromJson(Map.from(data));
//         return ResponseAPI.fromValue(doc);
//       }

//       final error = ErrorResponseModel.fromJson(Map.from(data));
//       throw ResponseAPI.fromValue(error);
//     } on DioException catch (e) {
//       throw ApiException(e.errorMessageCustom(), e);
//     }
//   }

//   @override
//   Future<ResponseAPI<String>> deleteAllTodosInUser() async {
//     try {
//       Dio http = await dio(ApiType.firestore);

//       ProfileHive? user = Modular.get<HiveController>().profile;
//       final getList = await http.get('/documents/users/${user?.localId}/todos');

//       final getListData = getList.data;
//       if (getList.statusCode != 200) {
//         final error = ErrorResponseModel.fromJson(Map.from(getListData));
//         throw ResponseAPI.fromValue(error);
//       }

//       final listTodoModel = ListTodoModel.fromJson(Map.from(getListData));

//       if (listTodoModel.documents == null || listTodoModel.documents!.isEmpty) {
//         return ResponseAPI.fromValue('Tidak ada dokumen todo untuk dihapus.');
//       }

//       // LANGKAH 2: Lakukan perulangan untuk menghapus setiap dokumen
//       for (final todoDoc in listTodoModel.documents!) {
//         // Firestore memberikan path lengkap dokumen di field 'name'
//         // Contoh: projects/.../databases/(default)/documents/users/.../todos/DOCUMENT_ID
//         final docPath = todoDoc.name;

//         // Lakukan DELETE pada path lengkap dokumen tersebut
//         await http.delete('/$docPath');
//       }

//       return ResponseAPI.fromValue('Semua dokumen todo berhasil dihapus.');
//     } on DioException catch (e) {
//       throw ApiException(e.errorMessageCustom(), e);
//     }
//   }
// }
