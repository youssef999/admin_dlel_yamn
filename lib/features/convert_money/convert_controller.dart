


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConvertController extends GetxController{

  List <String>currencyList=[
    'USD',
    'EUR',
    'GBP',
    'JPY',
  ];


  List<Map<String,dynamic>>dataList=[];


  List<String> currencyList2=[
   'دولار',
 'الريال  السعودي',
    'JPY',
  ];


  String selectCurrency= 'الريال  السعودي';
  String selectCurrency2= 'الريال  السعودي';


  getAllCurrency()async {
     currencyList=[];
     currencyList2=[];

      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('currency')
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
        dataList=data;


        for(int i=0;i<dataList.length;i++){
          currencyList.add(dataList[i]['name']);
          currencyList2.add(dataList[i]['name']);
        }
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

   TextEditingController priceController=TextEditingController();

  changeCurrency(String value){
    selectCurrency=value;
    update();
  }
  changeCurrency2(String value){
    selectCurrency2=value;
    update();
  }


 List<Map<String,dynamic>>currencyDataList=[];


 num amount=0;
 
  num amount2=0;

  String op='';

 getCurrencyData()async{
   print(selectCurrency);
   print(selectCurrency2);
//convertMoney
   QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('convertMoney')
          .where('currency1',isEqualTo: selectCurrency)
      .where('currency2',isEqualTo: selectCurrency2)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();

         currencyDataList=data;
         print("currencyDataList==="+currencyDataList.toString());
        amount=currencyDataList[0]['amount'];
        print("AMOUNT=="+amount.toString());
        op=currencyDataList[0]['op'];
      // amount2=currencyDataList[0]['amount2'];
      }

      catch(e){   
        print("E.......");
        print(e);
        print("E.......");
      }
      update();

 }


num changeAmount=0;

 convertAmount(){

   getCurrencyData();
   Future.delayed(const Duration(seconds: 1), () {
     if(op=='*'){
       changeAmount=amount*double.parse(priceController.text);
     }else{
       changeAmount=double.parse(priceController.text)/amount;
     }

     print("AMOUNT==="+changeAmount.toString());
     update();
   });


 }









}