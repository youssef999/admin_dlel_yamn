


 import 'package:flutter/material.dart';
import 'package:freelancerApp/admin/price/price_view.dart';
import 'package:freelancerApp/admin/users/users_view.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_drawer.dart';
import 'admin_controller.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  AdminController controller=Get.put(AdminController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: CustomDrawer(),
      body:GetBuilder<AdminController>(
        builder: (_) {
          return Stack(children: [
            SizedBox(
              height: 3000,
              width: MediaQuery.of(context).size.width,
              child:Image.asset(backgroundImage,
                fit:BoxFit.fill,),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12,top:20),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        logo,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 60,
                      ),
                      InkWell(
                        child: SizedBox(
                          height: 31,
                          child: Image.asset(
                            menuIcon,
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                    ],
                  ),
                 const SizedBox(height: 10,),

                  Container(
                    height: 90,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(12),
                      color: kAdminCardColor
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        children: [
                        Column(
                          children: [
                            Text("عدد مستخدمي ",
                            style:TextStyle(
                              color: kBallColor,fontSize: 18,fontWeight:FontWeight.bold
                            ),
                            ),
                            Text("التطبيق ",
                              style:TextStyle(
                                color: kBallColor,fontSize: 18,
                                  fontWeight:FontWeight.bold
                              ),
                            )
                          ],
                        ),

                        Column(
                          children: [
                            Image.asset('assets/images/greenSt.png',
                            width: 120,height: 46,
                            ),
                            const Text("1,3345,56",
                            style:TextStyle(
                              color: Colors.black,fontWeight:FontWeight.bold
                            ),
                            )
                          ],
                        )



                      ],),
                    ),
                  ),
                  const SizedBox(height: 11,),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                      itemCount: controller.images.length,

                      itemBuilder: (context,index){

                        return AdminCardStyle1(image:
                            controller.images[index]
                            , txt: controller.txtList[index],
                              index: index,
                        );

                  }, gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.44
                  ),),

                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.images2.length,
                    itemBuilder: (context,index){

                      return AdminCardStyle2(
                        index: index,
                        image:
                      controller.images2[index]
                          , txt: controller.txtList2[index],


                      );

                    }, gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.44
                  ),)

                ],
              ),
            ),
          ],);
        }
      )

    );
  }
}

class AdminCardStyle1 extends StatelessWidget {
  String image;
  String txt;
  int index;


  AdminCardStyle1({super.key,required this.image,required this.txt,required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: 40,
          decoration:BoxDecoration(
            borderRadius:BorderRadius.circular(9),
              color: kAdminCardColor,
            boxShadow: [
              BoxShadow(
                color: kShadowColor.withOpacity(0.2), // لون الظل مع ضبط الشفافية
                spreadRadius: 2, // مدى انتشار الظل
                blurRadius: 5, // مدى ضبابية الظل
                offset: const Offset(1, 3), // إزاحة الظل
              ),
            ],


          ),
          child:Column(children: [
           const SizedBox(height: 15,),

            Image.asset(image,
            height: 40,width: 40,
            ),
            const SizedBox(height: 10,),
            Text(txt,
            style:TextStyle(
              color: kBallColor,
              fontWeight:FontWeight.bold
            ),
            ),




          ],),
        ),
        onTap:(){

          if(index==0){
            Get.to(const UsersView());
          }

        },

      ),
    );
  }
}

 class AdminCardStyle2 extends StatelessWidget {
   String image;
   String txt;
   int index;
   AdminCardStyle2({super.key,required this.image,required this.txt,required this.index});

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: InkWell(
         child: Container(
           height: 40,
           decoration:BoxDecoration(
               borderRadius:BorderRadius.circular(9),
               color: kAdminCardColor,
             boxShadow: [
               BoxShadow(
                 color: kShadowColor.withOpacity(0.2), // لون الظل مع ضبط الشفافية
                 spreadRadius: 2, // مدى انتشار الظل
                 blurRadius: 5, // مدى ضبابية الظل
                 offset: const Offset(1, 3), // إزاحة الظل
               ),
             ],
           ),
           child:Row(children: [
          const   SizedBox(width: 10,),
             Text(txt,
               style:TextStyle(
                   color: kBallColor,
                   fontWeight:FontWeight.bold
               ),
             ),

             const SizedBox(width: 10,),

             Image.asset(image,
               height: 40,width: 40,
             ),
             const SizedBox(height: 10,),





           ],),
         ),
         onTap:(){

           if(index==0){
             Get.to(const PriceView());
           }

         },
       ),
     );
   }
 }

