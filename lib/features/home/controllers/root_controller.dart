
// ignore_for_file: unused_local_variable, unused_import, avoid_print

import 'package:freelancerApp/features/home/views/home_view.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';


class RootController extends GetxController {
  
  RxInt selectedIndex = 0.obs;

String roleId='';

  List page = [
     const HomeView(),
      const HomeView(),
       const HomeView(),
        const HomeView(),
    
  ];

  @override
  void onInit() {
    super.onInit();
     final box=GetStorage();
  String roleId =  box.read('roleId')??'1';

 print("ROLEID==========$roleId");


 

  print('ROLEIDD=====$roleId');

  }



  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}
