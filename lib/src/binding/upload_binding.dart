import 'package:get/get.dart';
import 'package:instagram/src/controller/upload_controller.dart';

class UploadBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UploadController());
  }
}
