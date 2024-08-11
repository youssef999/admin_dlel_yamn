

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelancerApp/Core/const/app_message.dart';
import 'package:freelancerApp/features/home/views/home_view.dart';
import 'package:get/get.dart';

class ContactController extends GetxController{


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();


  bool isLoading=false;

  sendMessageToAdmin() async{

  isLoading=true;
  update();


    if(nameController.text.isEmpty || emailController.text.isEmpty || subjectController.text.isEmpty || messageController.text.isEmpty){
      appMessage(text: 'يرجى ملء جميع الحقول', fail: true);
    }else{
      const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)*&1!';
      Random random = Random();
      String result = '';
      for (int i = 0; i < 12; i++) {
        result += chars[random.nextInt(chars.length)];
      }



      try{
        await FirebaseFirestore.instance.collection('contact')
            .doc(result)
            .set({

          'name': nameController.text,
          'email': emailController.text,
          'subject': subjectController.text,
          'message': messageController.text,
        }).then((value) {

          appMessage(text: 'تم ارسال رسالتك', fail: false);
          Get.offAll(const HomeView());
        });
      }catch(e){


        // ignore: avoid_print
        print(e);
      }
      isLoading=false;
      update();

    }




  }
}