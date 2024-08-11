// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/core/widgets/new_appbar.dart';
import 'package:freelancerApp/features/football/football_controller.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../core/resources/app_styles.dart';
import '../../core/resources/colors.dart';
import '../../core/widgets/bottom_navber.dart';
import '../home/controllers/root_controller.dart';

class FootballView extends StatefulWidget {
  const FootballView({super.key});

  @override
  State<FootballView> createState() => _FootballViewState();
}

class _FootballViewState extends State<FootballView> {
  FootballController controller = Get.put(FootballController());

  @override
  void initState() {
    controller.getFootballDataToday();
    controller.getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    RootController rootController=Get.put(RootController());

    return Scaffold(
      backgroundColor:Colors.blue[100]!.withOpacity(0.2),
      bottomNavigationBar:

     Container(
       color:Colors.transparent,
       child:  buildBottomNavigationMenu(context,rootController
           ,  1 ),
     ),
      //appBar: CustomAppBar('ball', context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          //decoration: AppDecoration,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: GetBuilder<FootballController>(
              builder: (_) {
                return Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child:Image.asset(backgroundImage,
                        fit:BoxFit.fill,),
                    ),
                    ListView(
                      children: [
                        Stack(
                          children: [

                            Container(
                              height: 55,
                              width:MediaQuery.of(context).size.width,
                              color: kPrimaryColor,
                            ),
                            NewAppbar(txt:'المباريات'),
                            // Image.asset(ballAppBar,
                            //                     height: 55,
                            //                     width:MediaQuery.of(context).size.width,
                            //   fit:BoxFit.cover
                            //                     ),
                          ],
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                        SizedBox(
                          height: 60,
                          child: ToggleSwitch(
                            customTextStyles:const [TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize: 20
                            )],
                            initialLabelIndex: controller.toogleIndex,
                            totalSwitches: 2,
                            inactiveBgColor:Colors.grey,
                            activeBgColor: [
                              kBallColor,
                              kBallColor2,
                              // Color(0xffFECF3B),
                              // Color(0xffEA4335)
                          //  const Color(0xff5E34A2).withOpacity(0.6),
                           // kPrimaryColor,
                           // kPrimaryColor
                            ],
                            fontSize: 20,
                            minWidth: 200,
                          inactiveFgColor:kPrimaryColor,
                            labels: const ['مباريات اليوم ','مباريات الغد '],

                            onToggle: (index) {
                              print('switched to: $index');
                             controller.changeToogle(index!);
                            },
                          ),
                        ),
                      const  SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                           const SizedBox(width:14,),
                            Row(

                             // mainAxisAlignment:MainAxisAlignment.start,
                              children: [
                                Text(
                                  controller.dayValue,
                                  style: TextStyle(color: kTextHelperDarkColor,
                                  //kTextHelperDarkColor,
                                      fontSize: 21,
                                      fontWeight:FontWeight.bold
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                controller.constDateVal,
                                 style: TextStyle(color:kTextHelperDarkColor,fontSize: 20,
                                   fontWeight:FontWeight.bold

                                 ),
                                ),



                              ],
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 6,
                        ),

                        ListView.builder(
                            itemCount: controller.footballData.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MatchCardWidget(
                                  controller: controller,
                                  data: controller.footballData[index],
                                ),
                              );
                            })
                      ],
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}

class MatchCardWidget extends StatelessWidget {

  FootballController controller;

  Map<String,dynamic> data;
 
 MatchCardWidget({super.key,required this.controller,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.only(left:55.0),
          child: Text(data['cat'],
          style:TextStyle(
            color:kTextHelperDarkColor,
            fontSize: 12,
            fontWeight:FontWeight.bold
          ),
          ),
        ),
        Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            CircleAvatar(
              radius: 30,
              backgroundColor:kTextHelperLightColor,
                child:Image.network(data['imageA'],
                fit: BoxFit.cover,
                  width: 33,
                  height: 44,
                )
            ),

            Container(
              //color: Colors.white,
              height: 44,
              width: 200,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(12),
                color: Colors.white,
              ),

              child:Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                const SizedBox(width: 5,),
                Text(data['teamA'],style:TextStyle(
                  color:kTextHelperDarkColor,
                  fontSize: 12,fontWeight:FontWeight.bold
                ),),
                //const SizedBox(width: 5,),
                Text(data['time'].toString().replaceAll('pm', ' م ').replaceAll('am', ' ص ')
                  ,style:TextStyle(
                    color:kPrimaryColor,
                    fontSize: 12,fontWeight:FontWeight.bold
                ),),
                Text(data['teamB'],style:TextStyle(
                    color:kTextHelperDarkColor,
                    fontSize: 12,fontWeight:FontWeight.bold
                ),),
                  const SizedBox(width: 9,),




              ],),
            ),

            CircleAvatar(
                radius: 32,
                backgroundColor:kTextHelperLightColor,
                child:Image.network(data['imageB'],
                  fit: BoxFit.cover,
                  width: 33,
                  height: 44,
                )
            ),
            const SizedBox(width: 9,),
            Column(
              children: [
                Text("التعليق",
                    style: TextStyle(
                        color:kTextPrimaryColor,fontSize: 10,fontWeight:FontWeight.bold
                    )),
                Text(data['comment'],
                    style: TextStyle(
                        color:kTextHelperDarkColor,fontSize: 10,fontWeight:FontWeight.bold
                    ))
              ],
            )



            // Stack(
            //   children: [
            //     Container(
            //       height: 100,
            //       width: 350,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(18),
            //         color: Colors.white,
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.all(12.0),
            //         child: Column(
            //           children: [
            //             Row(
            //               children: [
            //                 Row(
            //                   children: [
            //                     const SizedBox(
            //                       width: 55,
            //                     ),
            //                     Text(data['teamA'], style: Styles.darkTextStyle),
            //                   ],
            //                 ),
            //                 const SizedBox(
            //                   width: 10,
            //                 ),
            //                 Text(
            //                 data['time'].toString().replaceAll('pm', ' م ')
            //                   .replaceAll('am', ' ص ')
            //                   ,
            //                   style: Styles.primaryTextStyle,
            //                 ),
            //                 const SizedBox(
            //                   width: 10,
            //                 ),
            //                 Row(
            //                   children: [
            //                     Text(data['teamB'], style: Styles.darkTextStyle),
            //                     const SizedBox(
            //                       width: 5,
            //                     ),
            //                    CircleAvatar(
            //                       backgroundImage: NetworkImage(
            //                         data['imageB'])
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //            const SizedBox(height: 10,),
            //              Row(
            //              // mainAxisAlignment:MainAxisAlignment.spaceAround,
            //       children: [
            //         const Text(
            //           "التعليق",
            //           style: const TextStyle(
            //             color:Colors.grey
            //           )
            //         ),
            //        const SizedBox(width: 5,),
            //         Text(
            //      "     :   "+  data['comment']+"  ",
            //           style: const TextStyle(
            //             color:Colors.grey
            //           )
            //         ),
            //       ],
            //     )
            //           ],
            //         ),
            //       ),
            //     ),
            //     Container(
            //     height:90,
            //       decoration:BoxDecoration(
            //         borderRadius:BorderRadius.circular(24),
            //         color:kTextHelperLightColor,
            //
            //       ),
            //       child: CircleAvatar(
            //           backgroundImage: NetworkImage(
            //               data['imageA']
            //             // 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            //           )),
            //     ),
            //   ],
            // ),

          ],
        ),
      ],
    );
  }
}
