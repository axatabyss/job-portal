


import 'package:get/get.dart';
import 'package:job_portal/features/auth/controller/login_controller.dart';



class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
