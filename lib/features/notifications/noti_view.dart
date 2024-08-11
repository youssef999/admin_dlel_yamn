


 import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_styles.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/core/widgets/new_appbar.dart';
import 'package:freelancerApp/features/notifications/noti_controller.dart';
import 'package:get/get.dart';

import '../../core/widgets/bottom_navber.dart';
import '../home/controllers/root_controller.dart';

class NotiView extends StatefulWidget {
   const NotiView({super.key});
 
   @override
   State<NotiView> createState() => _NotiViewState();
 }
 
 class _NotiViewState extends State<NotiView> {

  NotiController controller=Get.put(NotiController());
  @override
  void initState() {
    controller.getNotifications();
    super.initState();
  }

   @override
   Widget build(BuildContext context) {

     RootController rootController=Get.put(RootController());

     return Scaffold(
       bottomNavigationBar:buildBottomNavigationMenu(context,rootController
           ,  1 ),
      // appBar:CustomAppBar('الاشعارات', context),
       body:Container(
          // decoration: AppDecoration,
       // color:
        //Color(0XXFFDFEBF6),
         child: Stack(
           children: [
             SizedBox(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               child:Image.asset(backgroundImage,
                 fit:BoxFit.fill,),
             ),
             Padding(
               padding: const EdgeInsets.all(0.0),
               child: GetBuilder<NotiController>(
                 builder: (_) {
                   return ListView(children: [

                     NewAppbar(txt:'الاشعارات'),

                    // Image.asset(notiAppBar,
                    // //height: 55,
                    // width:MediaQuery.of(context).size.width,
                    //   fit:BoxFit.fill,
                    // ),
                    const SizedBox(height: 8,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: controller.notiDataList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {


                          if(controller.notiDataList.isNotEmpty){

                            return  Column(children: [


                              Image.asset(notiImage,height: 300,
                              fit:BoxFit.fill,

                              ),


                            //  Text('لا يوجد اشعارات',style: Styles.lightTextStyleBold)

                            ],);




                          }

                          else{


                            return  Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: NotiCardWidget(
                              data: controller.notiDataList[index],
                            ),
                          );

                          }


                      }),
                    )


                   ],);
                 }
               ),
             ),
           ],
         ),
       ),
     );
   }
 }

 class NotiCardWidget extends StatelessWidget {

  Map<String,dynamic>data;

  
   NotiCardWidget({super.key,required this.data});
 
   @override
   Widget build(BuildContext context) {
     return Container(
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(14),
        color: Colors.white
      ),
      child:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          const SizedBox(height: 10,),
          Row(children: [
            Text(
            data['msg'],
            style:Styles.darkTextStyle,
            )
          ],)
        
        ],),
      )
     );
   }
 }