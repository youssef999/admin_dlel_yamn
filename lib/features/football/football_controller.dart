

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FootballController extends GetxController{


List<Map<String,dynamic>>footballData=[];



String date='';


int toogleIndex=0;

changeToogle(int val){
toogleIndex=val;

if(val==0){
  getFootballDataToday();
}else{
  getFootballDataTomorrow();
}
update();
}


String constDateVal='';

String dayValue='';

getDate(){

   DateTime now = DateTime.now();
   constDateVal=now.day.toString()+'-'+now.month.toString()+'-'+now.year.toString();
   String dayOfWeek = getDayOfWeek(now);
   dayValue=dayOfWeek;
   print("DAY==="+dayOfWeek);
   update();


}

String getDayOfWeek(DateTime date) {
  List<String> days = [
    "الاثنين",
    "الثلاثاء",
    "الاربعاء",
    "الخميس",
    "الجمعة",
    "السبت",
    "الاحد"
  ];
  // DateTime.weekday returns 1 for Monday, 7 for Sunday
  return days[date.weekday - 1];
}


getFootballDataTomorrow()async{
  DateTime now = DateTime.now();
  DateTime tomorrow = now.add(const Duration(days: 1));
  date=tomorrow.day.toString()+'-'+tomorrow.month.toString()+'-'+tomorrow.year.toString();
   footballData=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('football')
        .where('date',isEqualTo:date)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
        footballData=data;
     
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


getFootballDataToday()async {
  DateTime now=DateTime.now();
  date=now.day.toString()+'-'+now.month.toString()+'-'+now.year.toString();



   footballData=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('football')
        .where('date',isEqualTo:date)
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();
        footballData=data;
     
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