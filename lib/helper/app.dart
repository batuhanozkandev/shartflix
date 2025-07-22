import 'package:get/get.dart';

class App {
  static Future<void> init() async {
    //await dotenv.load(fileName: ".env");
    //await Hive.init();
  }

  static bool hasToken() {
    // var token = Hive.getValue(key: 'token');
    // if(token != null && token.isNotEmpty) {
    //   return true;
    // }
    return false;
  }
}