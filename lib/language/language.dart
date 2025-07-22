import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:shartflix/language/tr_TR.dart';

import 'en_US.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en_US,
    'tr_TR': tr_TR,
  };
}
