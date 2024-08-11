


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PhoneController extends GetxController{


List<String>phoneImage=[
  'assets/images/shopCard.png',
  'assets/images/hospital.png',
  'assets/images/learnCard.png',
  'assets/images/phoneCard.png',
  'assets/images/hotelCard.png',
    "assets/images/loveCard.png",
  'assets/images/tww.png',
  "assets/images/engCard.png",
    "assets/images/govCard.png",
    "assets/images/bagCard.png"
];

checkTheme(){
  final box=GetStorage();
  bool isDarkMode = box.read('theme')??false ;
  if(isDarkMode==true){
    phoneImage=[
      'assets/images/shopDark.png',
      'assets/images/medDarkPhone.png',
      'assets/images/learnDark.png',
      'assets/images/pPhoneDark2.png',
      'assets/images/darkHotel.png',
      "assets/images/darkLove.png",
      'assets/images/pDarkPhone.png',
      "assets/images/darkEng.png",
      "assets/images/darkGov.png",
      "assets/images/bagDark.png"
    ];
  }

}

List<String>phoneName=[
  'المحلات التجارية',
  'المستشفيات والمراكز الصحية',
  'المؤسسات التعليمية',
  'شركات الاتصالات',
  'الفنادق',
    "الهيئات الخيرية",
  'أرقام الطوارئ',
  "المهندسين والخدمات الفنية",
    "الممؤسسات الحكومية",
    "أصحاب العمل الحر"
];
List<String>placesList=['صنعاء','تعز','عدن','حضر موت'];
//List<String>placesList=['صنعاء','تعز','عدن','حضر موت'];
String selcetPlace='حضر موت';


  chnagePlace(String newVal,String type){

    selcetPlace=newVal;

       update();
       getPhoneData(type);
       
  }



List<Map<String,dynamic>> phoneDataList=[];

  getPhoneData(String type)async{
 phoneDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('phones')
        .where('type',isEqualTo: type)
        .where('country',isEqualTo: selcetPlace)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
  phoneDataList=data;
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