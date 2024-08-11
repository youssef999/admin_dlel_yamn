

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UsersController extends GetxController{



  List<Map<String,dynamic>>usersList=[];


  getAllUsers()async{
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection
      ('users').get();
    try{
      List<Map<String, dynamic>> data
      = querySnapshot.docs.map((DocumentSnapshot doc) =>
      doc.data() as Map<String, dynamic>).toList();
      usersList=data;
      update();

    }catch(e){
      // ignore: avoid_print
      print("E.......");
      // ignore: avoid_print
      print(e);
      // orderState='error';
      // ignore: avoid_print
      print("E.......");
    }
  }


}