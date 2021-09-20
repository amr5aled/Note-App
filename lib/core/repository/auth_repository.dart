// import 'package:injectable/injectable.dart';

// import '../utilities/index.dart';

// @Injectable()
// class AuthRepository {
//   final String _sharedPreferenceToken = "Token";
//   final String _sharedPreferenceRefrshToken = "RefrshToken";
//   final String _sharedPreferenceFirst = "First";
//   Future<String?> get accessToken => _getToken();
//   Future<String?> get refreshToken => _getRefrshToken();

//   Future<dynamic> setToken(String userToken, String refreshToken) async {
//     await AppLocalStorage.saveString(_sharedPreferenceToken, userToken);
//     await AppLocalStorage.saveString(
//         _sharedPreferenceRefrshToken, refreshToken);
//   }

//   Future<String?> _getToken() async {
//     return AppLocalStorage.getString(_sharedPreferenceToken);
//   }

//   Future<String?> _getRefrshToken() async {
//     return AppLocalStorage.getString(_sharedPreferenceRefrshToken);
//   }

//   Future<bool> isFirstTime() async {
//     return await AppLocalStorage.getBool(_sharedPreferenceToken) ?? true;
//   }

//   Future<bool?> setFirstTime(bool isFirst) async {
//     await AppLocalStorage.saveBool(_sharedPreferenceToken, isFirst);
//   }

//   // Future<AppResponseSingleResult<User>> refreshTheToken(Dio refreshTokenDio) async {
//   //   final Response<dynamic> response = await ApiService(refreshTokenDio, this).postApi(AppApiPaths.refreshToken, isRefrsh: true);
//   //   return AppResponseSingleResult<User>.fromJson(response.data as Map<String, dynamic>, User());
//   // }
// }
