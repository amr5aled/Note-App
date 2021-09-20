// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';

// import '../repository/index.dart';

// @Injectable()
// class ApiService {
//   ApiService(@Named('Dio') this._dio, this._authRepository);
//   static const String urlencodedType = 'application/x-www-form-urlencoded';
//   static const String jsonType = 'application/json';
//   static const String multiPart = "multipart/form-data";
//   static const int unauthorizedCode = 401;
//   static const int internalServerErrorCode = 500;
//   static const String authorizationParameter = 'Authorization';
//   static const String bearer = 'Bearer';
//   final Dio _dio;
  

//   /// Post api
//   Future<Response<T>> postApi<T>(
//     String path, {
//     Map<String, dynamic> body = const {},
//     bool isJson = true,
//     bool isAuth = true,
//     bool isRefrsh = false,
//   }) async {
//     //call api
//     if (isAuth) {
//       await authorize(isRefrsh: isRefrsh);
//     }

//     final Response<T> response = await _dio.post(path,
//         data: body,
//         options: Options(
//             contentType: isJson ? jsonType : urlencodedType,
//             validateStatus: (int? status) {
//               // if (status == 401) return false;
//               return true;
//             }));

//     return response;
//   }

//   Future<Response<T>> getApi<T>(String path) async {
//     // authorize the api
//     await authorize();

//     final Response<T> response = await _dio.get(path, options: Options(validateStatus: (int? status) {
//       return status! < internalServerErrorCode;
//     }));

//     return response;
//   }

//   Future<Response<T>> upload<T>(
//     String path, {
//     required String typeValue,
//     required File file,
//     bool isJson = true,
//     bool isAuth = true,
//     bool hasUserId = false,
//   }) async {
//     // dio init

//     // ignore: always_specify_types
//     final Map<String, dynamic> map = {
//       'type': typeValue,
//       'media': await MultipartFile.fromFile(
//         file.path,
//         filename: file.path.split('/').last,
//         // contentType: MediaType.parse(lookupMimeType(file.path)!),
//       )
//     };
//     final FormData formData = FormData.fromMap(map);

//     //call api
//     if (isAuth) {
//       authorize();
//     }

//     final Response<T> response = await _dio.post(path,
//         data: formData,
//         options: Options(
//             validateStatus: (int? status) {
//               return true;
//             },
//             contentType: multiPart));

//     return response;
//   }

//   Future<void> authorize({bool isRefrsh = false}) async {
//     final String? token = isRefrsh ? await _authRepository.refreshToken : await _authRepository.accessToken;
//     _dio.options.headers[authorizationParameter] = '$bearer $token';
//   }

//   Future<Response<T>> putApi<T>(
//     String path, {
//     Map<String, dynamic> body = const {},
//     bool isJson = true,
//     bool isAuth = true,
//     bool isRefrsh = false,
//   }) async {
//     //call api
//     if (isAuth) {
//       await authorize(isRefrsh: isRefrsh);
//     }

//     final Response<T> response = await _dio.put(path,
//         data: body,
//         options: Options(
//             contentType: isJson ? jsonType : urlencodedType,
//             validateStatus: (int? status) {
//               // if (status == 401) return false;
//               return true;
//             }));

//     return response;
//   }
// }
