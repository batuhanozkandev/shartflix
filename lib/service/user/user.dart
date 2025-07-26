import 'package:get/get.dart';
import 'package:shartflix/controller/base/base.dart';

import '../../cache/cache.dart';
import '../../controller/server/api/server_controller.dart';
import '../../helper/snack_bar/snack_bar.dart';
import '../../model/user/user.dart';

class UserService extends BaseController {
  static Future<User?> getProfile() async {
    late User user;
    var response = await ServerController().get('/user/profile');
    if (response['response']['code'] == 200) {
      String message = response['response']['message'];
      user = User.fromJson(response['data']);
      Future.delayed(1.seconds, () {
        AppSnackBar.show(
          statusCode: response['response']['code'] ?? 1001,
          successMessage: message.isEmpty ? 'No Message from Server' : message,
        );
      });

      return user;
    }
    return User();
  }
}
