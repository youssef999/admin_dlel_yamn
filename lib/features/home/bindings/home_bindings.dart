



import 'package:freelancerApp/features/auth/controllers/auth_controller.dart';
import 'package:freelancerApp/features/home/controllers/home_controller.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
       
  }
}
