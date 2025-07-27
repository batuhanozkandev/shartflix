import 'package:get/get.dart';
import 'package:shartflix/widget/offer/offer.dart';

class AppBottomSheet{
  static void openOfferBottomSheet(){
    Get.bottomSheet(
        isScrollControlled: true,
        Offer());
  }
}