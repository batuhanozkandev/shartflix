import 'package:get/get.dart';
import 'package:shartflix/cache/cache.dart';
import 'package:shartflix/controller/base/base.dart';
import 'package:shartflix/helper/snack_bar/snack_bar.dart';
import 'package:shartflix/model/user/user.dart';
import 'package:shartflix/routes/routes.dart';

import '../../controller/server/api/server_controller.dart';

class AuthService extends BaseController {
  static Future<void> logIn({
    required String email,
    required String password,
  }) async {
    var response = await ServerController().post(
      '/user/login',
      data: {"email": email, "password": password},
    );
    if (response['response']['code'] == 200) {
      await ShartflixCache.addValue(
        key: 'token',
        value: response['data']['token'],
      );
      await ShartflixCache.addValue(key: 'email', value: email);
      String message = response['response']['message'];
      Future.delayed(1.seconds, () {
        AppSnackBar.show(
          statusCode: response['response']['code'] ?? 1001,
          successMessage: message.isEmpty ? 'No Message from Server' : message,
        );
      });
      Get.offAndToNamed(AppPages.mainScreen);
    }
  }

  static Future<void> register({
    required String email,
    required String name,
    required String password,
  }) async {
    var response = await ServerController().post(
      '/user/register',
      data: {"email": email, "name": name, "password": password},
    );
    if (response['response']['code'] == 200) {
      await ShartflixCache.addValue(key: 'token', value: response['token']);
      await ShartflixCache.addValue(key: 'email', value: email);
      String message = response['response']['message'];
      Future.delayed(1.seconds, () {
        AppSnackBar.show(
          statusCode: response['response']['code'] ?? 1001,
          successMessage: message.isEmpty ? 'No Message from Server' : message,
        );
      });
      Get.offAndToNamed(AppPages.mainScreen);
    }
  }
}
