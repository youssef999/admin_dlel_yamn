

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {


  TextEditingController searchController = TextEditingController();


  List<String>placesList=['صنعاء','تعز','عدن','حضر موت'];

  //['صنعاء','تعز','عدن','حضر موت'];
  String selcetPlace='حضر موت';

  List<Map<String,dynamic>> priceDataList=[];

  List<Map<String,dynamic>> goldDataList=[];

 List<Map<String,dynamic>> gazDataList=[];

  List<Map<String,dynamic>> currecncyDataList=[];

   List<String>currencyList=[];



  String selcetPrice='الريال اليمني';


  void launchURL(String link) async {
    String url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      await launch(url);
      throw 'Could not launch $url';
    }
  }

  chnageCurrency(String newVal){
    selcetPrice=newVal;
    getGazDataWithFilter();
    update();
  }


  chnagePlace(String newVal){
    selcetPlace=newVal;
    getPriceDataWithFilter();
    getDataDataWithFilter();
     getGazDataWithFilter();
       update();
  }


bool isLoading=false;
  
  getCurrencyData()async{
    currecncyDataList=[];
    currencyList=[];
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection
      ('currency').get();
    try{
      List<Map<String, dynamic>> data
      = querySnapshot.docs.map((DocumentSnapshot doc) =>
      doc.data() as Map<String, dynamic>).toList();
      currecncyDataList=data;
      for(int i=0;i<currecncyDataList.length;i++){
        currencyList.add(currecncyDataList[i]['name']);
      }
      selcetPrice=currencyList[0];
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

getDataDataWithFilter()async{
isLoading=true;
update();
 goldDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('goldData')
        .where('location',isEqualTo: selcetPlace)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
     goldDataList=data;
     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      Future.delayed(const Duration(seconds: 1), () {
        isLoading=false;
        update();
      });

    
  }


 getGazDataWithFilter()async{
 gazDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('gazData')
        .where('location',isEqualTo: selcetPlace).
         where('currency',isEqualTo: selcetPrice)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
     gazDataList=data;
     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      update();
    
  }

  getPriceDataWithFilter()async{

 priceDataList=[];
 
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('priceData')
        .where('location',isEqualTo: selcetPlace)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
     priceDataList=data;
     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      update();
    
  }



List<Map<String,dynamic>> newsDataList=[];

   getNewsData()async{

 newsDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('news').get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
   newsDataList=data;
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      update();
  }

  getPriceData()async{

 priceDataList=[];
 
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('priceData')  .where('location',isEqualTo: selcetPlace).get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
     priceDataList=data;
     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      update();
  }

  getGoldData()async{
     goldDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('goldData')
          .where('location',isEqualTo: selcetPlace)
          .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
     goldDataList=data;
     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      update();
  }

   getGazData()async{
     gazDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('gazData').get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
     gazDataList=data;
     
      }catch(e){
        // ignore: avoid_print
        print("E.......");
        // ignore: avoid_print
        print(e);
       // orderState='error';
        // ignore: avoid_print
        print("E.......");
      }
      update();
  }

  
  
}