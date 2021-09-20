import '../../utilities/index.dart';
import 'api_response.dart';

abstract class AppResponse<T extends BaseResponse<T>> {
  AppResponse(this.message, this.code);
  late AppLogger _logger;
  AppResponse.fromJson(Map<String, dynamic> json, T object) {
    _logger.debug('fromJson ${object.runtimeType} ${json.toString()} ');
    message = json['message'] as String;
    code = json['code'] as int;
    errors = json['errors'] == null ? null : (json['errors'] as List<dynamic>).map((e) => e.toString()).toList();

    serializeResult(json['data'], object);
  }
  AppResponse.fromJsonWithoutData(Map<String, dynamic> json) {
    message = json['message'] as String;
    code = json['code'] as int;
    errors = json['errors'] == null ? null : (json['errors'] as List<dynamic>).map((e) => e.toString()).toList();
  }
  int code = 500;
  String? message;
  List<String>? errors;

  void serializeResult(dynamic json, T object);

  bool get isSuccess {
    return code == 200 || code == 201;
  }

  String? get errorMessage {
    String error = '';
    if (errors != null) {
      errors!.forEach((String element) {
        error += element + '\n';
      });
      return error;
    }
  }
}

class AppResponseSingleResult<T extends BaseResponse<T>> extends AppResponse<T> {
  AppResponseSingleResult(String message, int status) : super(message, status);
  AppResponseSingleResult.fromJson(Map<String, dynamic> json, T object) : super.fromJson(json, object);
  AppResponseSingleResult.fromJsonWithoutData(Map<String, dynamic> json) : super.fromJsonWithoutData(json);

  T? result;

  @override
  void serializeResult(dynamic dataJson, T object) {
    result = dataJson == null ? null : object.fromJson(dataJson as Map<String, dynamic>);
  }
}

class AppResponseListResult<T extends BaseResponse<T>> extends AppResponse<T> {
  AppResponseListResult(String message, int status) : super(message, status);
  AppResponseListResult.fromJson(Map<String, dynamic> json, T object) : super.fromJson(json, object);
  List<T>? results;

  @override
  void serializeResult(dynamic dataJson, T object) {
    results = (dataJson as List<dynamic>).map((dynamic e) => object.fromJson(e as Map<String, dynamic>)).toList();
  }
}
