import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class LanguageRepository {
  static const String language = 'Language';

  Future<void> saveLang(String lang) async {
    /// write to keystore/keychain
    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    await storage.write(key:USER , value: empCode);
    await prefs.setString(language, lang);
  }

  Future<String?> hasLang() async {
    /// read from keystore/keychain
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(language);
  }
}
