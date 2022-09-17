
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller to = Controller();
  var count = 0;
  RxBool lottistatus = false.obs;
  RxInt versionCode = 1.obs;
  RxBool isAdShow = false.obs;
  RxBool isRewardAdsShow= false.obs;
  RxBool isIntraAdsShow= false.obs;
}
