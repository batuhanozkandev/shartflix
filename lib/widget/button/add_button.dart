import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/core/constant/padding.dart';
import 'package:shartflix/core/constant/radius.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shartflix/core/extention/numX.dart';
import 'package:shartflix/service/user/user.dart';

import '../../helper/snack_bar/snack_bar.dart';

class ShartComponentAddButton extends StatelessWidget {
  const ShartComponentAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );
        if (image == null) {
          AppSnackBar.show(
            statusCode: 400,
            errorMessage: 'No image selected',
            successMessage: '',
          );
          return;
        }
        UserService.uploadPhoto(
          photoURL: 'batu-image.png',
          file: File(image.path),
        );
      },
      child: Container(
        padding: ShartflixPadding.buttonTextPadding,
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: ColorConstants.buttonBackground,
          borderRadius: BorderRadius.circular(ShartflixRadius.buttonRadius),
          border: Border.all(color: ColorConstants.borderColor, width: 1.0),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/ic_plus.svg',
            colorFilter: ColorFilter.mode(
              ColorConstants.socialIconColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
