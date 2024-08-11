// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/core/widgets/new_appbar.dart';
import 'package:freelancerApp/features/home/controllers/home_controller.dart';
import 'package:freelancerApp/features/home/controllers/root_controller.dart';
import 'package:get/get.dart';

import '../../core/resources/app_styles.dart';
import '../../core/widgets/bottom_navber.dart';

// ignore: must_be_immutable
class NewsView extends StatefulWidget {
  String txt;

  NewsView({super.key, required this.txt});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  HomeController homeController = Get.put(HomeController());
  @override
  void initState() {
    homeController.getNewsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    RootController rootController=Get.put(RootController());

    return Scaffold(
      bottomNavigationBar:buildBottomNavigationMenu(context,rootController
          ,  1 ),
      //appBar:CustomAppBar(widget.txt, context),
      body: Container(
        decoration: AppDecoration,
        child: GetBuilder<HomeController>(builder: (_) {
          return ListView(
            children: [
              NewAppbar(txt:'أخبار اقتصادية'),
              // Image.asset(
              //   newsAppBar,
              //   fit:BoxFit.fill,
              //   //height: 55,
              //   width: MediaQuery.of(context).size.width,
              // ),
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child:Image.asset(backgroundImage,
          fit:BoxFit.fill,),
        ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: homeController.newsDataList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: NewsCardWidget(
                              controller: homeController,
                              data: homeController.newsDataList[index],
                            ),
                          );
                        }),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

class NewsCardWidget extends StatelessWidget {
  Map<String, dynamic> data;
  HomeController controller;
  NewsCardWidget({super.key, required this.data,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
    //  height: 204,
      decoration: CardDecoration,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                data['image'],
                height: 122,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width-60,

              ),
              child:IconButton(onPressed: () {

                print("Link=="+data['link']);

                controller.launchURL(data['link']);


              }, icon: const Icon(Icons.share,
              color:Colors.black,
              size: 31
              ),),
              )
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data['txt'], style: Styles.primaryTextStyle),
          )
        ],
      ),
    );
  }
}
