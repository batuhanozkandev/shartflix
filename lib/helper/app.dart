import 'package:get/get.dart';
import 'package:shartflix/cache/cache.dart';

import '../controller/theme/theme.dart';

class App {
  static Future<void> init() async {
    //await dotenv.load(fileName: ".env");
    await ShartflixCache.init();
    await PreparerControllers.prepareController();
  }

  static bool hasToken() {
    var token = ShartflixCache.getValue(key: 'token');
    if(token != null && token.isNotEmpty) {
      return true;
    }
    return false;
  }
}

class PreparerControllers {
  static Future<void> prepareController() async {
    Get.put(ThemeController());
  }
}
