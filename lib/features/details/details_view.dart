import 'package:flutter/material.dart';
import 'package:freelancerApp/Core/resources/app_colors.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/app_styles.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/appbar.dart';
import 'package:freelancerApp/core/widgets/bottom_navber.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/core/widgets/new_appbar.dart';
import 'package:freelancerApp/features/home/controllers/home_controller.dart';
import 'package:freelancerApp/features/home/controllers/root_controller.dart';
import 'package:get/get.dart';
import '../data_card_widget/data_card.dart';
import '../home/views/home_view.dart';
import '../home/views/widgets/drop_down.dart';

// ignore: must_be_immutable
class DetailsView extends StatefulWidget {

  String dataKey;
  
  DetailsView({super.key,required this.dataKey});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  //'money',
  HomeController controller = Get.put(HomeController());
    String filter='';

  @override
  void initState() {
    print("key==${widget.dataKey}");
    if(widget.dataKey=='money'){
      controller.getPriceData();
      filter='money';
    }
    if(widget.dataKey=='gold'){
      controller.getGoldData();
      filter='gold';
    }
    if(widget.dataKey=='gaz'){
      controller.getGazData();
      controller.getCurrencyData();
      filter='gaz';
    }
    super.initState();
  }

 RootController rootController= Get.put(RootController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:buildBottomNavigationMenu(context,rootController
   ,  1 ),
     // appBar: CustomAppBar(widget.dataKey, context),
      body:Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
         SizedBox(
            height: 3000,
            width:MediaQuery.of(context).size.width,
            child:Image.asset(backgroundImage,
            fit:BoxFit.fill,),
          ),

            GetBuilder<HomeController>(
              builder: (_) {
                return ListView(children: [

                 if(widget.dataKey=='gaz')
                  NewAppbar(txt:'أسعار المحروقات'),

                // Image.asset(gazAppBar,
                //   fit:BoxFit.cover,
                // //height: 55,
                // width:MediaQuery.of(context).size.width,
                // ),

                  if(widget.dataKey=='money')
                    NewAppbar(txt:'أسعار العملات'),
                // Image.asset(priceAppBar,
                //   fit:BoxFit.fill,
                // //height: 55,
                // width:MediaQuery.of(context).size.width,
                // ),
                 if(widget.dataKey=='gold')
                   NewAppbar(txt:'أسعار الذهب'),

                // Image.asset(goldAppBar,
                //   fit:BoxFit.fill,
                // //height: 55,
                // width:MediaQuery.of(context).size.width,
                // ),
                 const SizedBox(height: 21),
                
                  if(widget.dataKey=='gaz')
                  Padding(
                    padding: const EdgeInsets.only(left:25.0,right:25),
                    child: Container(
                      decoration:CardDecoration,
                      child:
                      Padding(
                        padding: const EdgeInsets.only(left:18.0,right:18),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [

                                GradientText(
                                "المنطقة",
                                  gradient: LinearGradient(
                                    colors: [kBallColor, kBallColor],
                                  ),
                style: TextStyle(
                color:kPrimaryColor,
                fontSize: 20,
                fontWeight:FontWeight.bold
                )),


                                DropDownWidget(
                                            items: controller.placesList,
                                            hintText: ' المنطقة',
                                            selectedValue: controller.selcetPlace,
                                            onChanged: (String? newValue) {
                                              controller.chnagePlace(newValue!);
                                            },
                                          ),
                              ],
                            ),
                    
                             Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                GradientText(
                                     "العملة ",
                                    gradient: LinearGradient(
                                      colors: [kBallColor, kBallColor],
                                    ),
                                    style: TextStyle(
                                        color:kPrimaryColor,
                                        fontSize: 20,
                                        fontWeight:FontWeight.bold
                                    )),

                                DropDownWidget(
                                            items: controller.currencyList,
                                            hintText: ' العملة ',
                                            selectedValue: controller.selcetPrice,
                                            onChanged: (String? newValue) {
                                              controller.chnageCurrency(newValue!);
                                            },
                                          ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                

                  const SizedBox(height: 7,),

                  if(widget.dataKey=='money')
                 ListView.builder(
                          itemCount: controller.priceDataList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (controller.priceDataList.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DataCardWidget(

                                  img1: controller.priceDataList[index]
                                  ['img1'],
                                  img2: controller.priceDataList[index]
                                  ['img2'],
                                  dataType: controller.priceDataList[index]
                                  ['type'],
                                    buyPrice: controller.priceDataList[index]
                                            ['buyPrice']
                                        .toString(),
                                    image: 'assets/images/st.png',
                                    sellPrice: controller.priceDataList[index]
                                            ['sellPrice']
                                        .toString(),
                                    title: controller.priceDataList[index]
                                                ['country1']
                                            .toString() +
                                        "          مقابل     " +
                                        controller.priceDataList[index]['country2']
                                            .toString(),
                                    type: 'money',
                                    date: controller.priceDataList[index]['date'],
                                    country: controller.priceDataList[index]
                                        ['location']),
                              );
                            }
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),
                            
                            
                   if(widget.dataKey=='gold')
                 ListView.builder(
                          itemCount: controller.goldDataList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (controller.goldDataList.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DataCardWidget(
                                    buyPrice: controller.goldDataList[index]
                                            ['buyPrice']
                                        .toString(),
                                    image: 'assets/images/gold.png',
                                    dataType: controller.priceDataList[index]
                                    ['type'],
                                    type: 'gold',
                                    sellPrice: controller.goldDataList[index]
                                            ['sellPrice']
                                        .toString(),
                                    title: controller.goldDataList[index]['txt']
                                        .toString(),
                                    date: controller.goldDataList[index]['date'],
                                    country: controller.goldDataList[index]
                                        ['location']),
                              );
                            }
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),

                            
                   if(widget.dataKey=='gaz')
                 GridView.builder(
                          itemCount: controller.gazDataList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (controller.gazDataList.isEmpty) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GazCardWidget(title: controller.gazDataList[index]['name']
                                , image: controller.gazDataList[index]['image']
                                , price: controller.gazDataList[index]['price'].toString()+" "+"﷼")
                              );
                            }
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true, gridDelegate: 
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,

                          childAspectRatio: 0.86
                          ),
                        ),
                            
                ],);
              }
            ),
          ],
        ),
      ),
    );
  }
}





// ignore: must_be_immutable
class GazCardWidget extends StatelessWidget {

  String title;
  String image;
  String price;


GazCardWidget({super.key,

   required this.title,required this.image,required this.price
  });

  @override
  Widget build(BuildContext context) {

       return Padding(
         padding: const EdgeInsets.all(12.0),
         child: Container(
          decoration:CardDecoration,

          //      BoxDecoration(
          // borderRadius:BorderRadius.circular(12),
          // color:Colors.transparent.withOpacity(0.07),
          // // const Color(0xE5C0D9F0).withOpacity(0.5),
          //
          //  border: Border.all(color:Colors.white,
          //  width: 1.2
          //  ),
          //      ),
               child:Column(children: [
          Container(
            decoration:BoxDecoration(
             // color:Colors.white,
            
              borderRadius:BorderRadius.circular(12)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:

              GradientText(
                  title,
                  gradient: LinearGradient(
                    colors: [kBallColor, kBallColor],
                  ),
                  style: TextStyle(
                      color:kPrimaryColor,
                      fontSize: 20,
                      fontWeight:FontWeight.bold
                  )),


            ),
          ),
          const SizedBox(height: 4,),
         
          Image.network(image,fit:BoxFit.fill,
          height: 100,
          width: MediaQuery.of(context).size.width,
          
          ),
         
          const SizedBox(height: 5,),
                 GradientText(
                     price,
                     gradient: LinearGradient(
                       colors: [kBallColor, kBallColor],
                     ),
                     style: TextStyle(
                         color:kPrimaryColor,
                         fontSize: 20,fontWeight:FontWeight.w700
                     )),

    
               
         
         
         
         
               ],),
             ),
       );

   
   
  }}