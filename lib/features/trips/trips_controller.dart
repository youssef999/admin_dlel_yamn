

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


 class TripsController extends GetxController{


  List<Map<String,dynamic>> tripsList=[];
  List<String>placesList=['صنعاء','تعز','عدن','حضر موت'];

  List<String>typeList=['سيارات','باصات','الطيران'];

  String selcetPlace='حضر موت';
  String selcetType='الطيران';

  getAllTrips()async{
     tripsList =[];
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('trips').get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
        tripsList=data;
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

  chnageType(String newVal){
    selcetType=newVal;
    update();
    getFilterTrips();
  }

  chnagePlace(String newVal){
    selcetPlace=newVal;
    update();
    getFilterTrips();
  }

  getFilterTrips()async{
    tripsList =[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection
      ('trips')
        .where('country',isEqualTo: selcetPlace)
        .where('type',isEqualTo: selcetType)
        .get();
    try{
      List<Map<String, dynamic>> data
      = querySnapshot.docs.map((DocumentSnapshot doc) =>
      doc.data() as Map<String, dynamic>).toList();
      tripsList=data;
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