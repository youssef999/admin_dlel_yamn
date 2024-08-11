
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotiController extends GetxController {




 List<Map<String,dynamic>> notiDataList=[];
getNotifications()async{
notiDataList=[];
QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection
        ('notifications')
       
        .get();
      try{
        List<Map<String, dynamic>> data
        = querySnapshot.docs.map((DocumentSnapshot doc) =>
        doc.data() as Map<String, dynamic>).toList();

   notiDataList=data;
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