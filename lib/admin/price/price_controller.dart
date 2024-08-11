

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PriceController extends GetxController{

  List<Map<String,dynamic>> priceList=[];


  getAllPriceList()async{
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection
      ('priceData').get();
    try{
      List<Map<String, dynamic>> data
      = querySnapshot.docs.map((DocumentSnapshot doc) =>
      doc.data() as Map<String, dynamic>).toList();
      priceList=data;
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