import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/SuraModel.dart';
import '../../resources/AppContents.dart';
class PrefsManager {
  static late final SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveMostRecently(List<SuraModel> mostRecently) async {
    await prefs.setStringList(
      "most_recently",
      mostRecently.map((sura) => sura.suraNameEn).toList(),
    );
  }

  static List<SuraModel> getMostRecently() {
    List<String> suraNames = prefs.getStringList("most_recently") ?? [];
    List<SuraModel> suras = [];
    for (var name in suraNames) {
      for (var sura in AppContents.SurasList) {
        if (name == sura.suraNameEn) {
          suras.add(sura);
          break;
        }
      }
    }
    return suras;
  }
}
