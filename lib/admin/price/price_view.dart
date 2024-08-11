


 import 'package:flutter/material.dart';
import 'package:freelancerApp/admin/price/price_details.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/new_appbar.dart';
import 'package:get/get.dart';

class PriceView extends StatelessWidget {
   const PriceView({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body:Stack(
         children: [
           SizedBox(
             height: 3000,
             width: MediaQuery.of(context).size.width,
             child:Image.asset(backgroundImage,
               fit:BoxFit.fill,),
           ),
           ListView(children: [
             NewAppbar(txt: 'أسعار العملات'),
             const SizedBox(height: 21,),
             Row(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [

               InkWell(
                 child: Container(
                   height: 90,
                   decoration:BoxDecoration(
                     borderRadius:BorderRadius.circular(12),
                     color:kAdminCardColor
                   ),
                   child:Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                       child: Text('اضافة العملات ',style:TextStyle(
                         color: kBallColor,fontSize: 20,fontWeight:FontWeight.w800
                       )),
                     ),
                   ),
                 ),
                 onTap:(){
                   Get.to(const PriceDetails());
                 },
               ),
               const  SizedBox(width: 22,),
                 Container(
                   height: 90,
                   decoration:BoxDecoration(
                       borderRadius:BorderRadius.circular(12),
                       color:kAdminCardColor
                   ),
                   child:Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Center(
                       child: Text(''' إضافة أسعار
العملات ''',style:TextStyle(
                           color: kBallColor,fontSize: 20,fontWeight:FontWeight.w800
                       )),
                     ),
                   ),
                 ),

             ],)

           ],),
         ],
       ),
       
     );
   }
 }
