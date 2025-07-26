import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shartflix/controller/base/base.dart';

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

  static Future<void> uploadPhoto({
    required String photoURL,
    required File file,
  }) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      AppSnackBar.show(
        statusCode: 400,
        errorMessage: 'No image selected',
        successMessage: '',
      );
      return;
    }
    await ServerController().postMultipart(
      '/user/upload_photo',
      fields: {"photoUrl": 'bimage.png'},
      file: File(image.path),
      fileFieldName: 'file',
    );
  }
}
