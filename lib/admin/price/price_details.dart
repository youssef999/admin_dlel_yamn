



 import 'package:flutter/material.dart';
import 'package:freelancerApp/admin/price/add_price.dart';
import 'package:freelancerApp/admin/price/price_controller.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:get/get.dart';

class PriceDetails extends StatefulWidget {
  const PriceDetails({super.key});

  @override
  State<PriceDetails> createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<PriceDetails> {

  PriceController controller=Get.put(PriceController());
  @override
  void initState() {
    controller.getAllPriceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBallColor2,
      bottomSheet:  Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          color:Colors.blue[100]!.withOpacity( 0.4),
          child: Row(
            children: [
              const SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 30),
                child: CircleAvatar(
                    backgroundColor:kBallColor,
                    child: const Icon(Icons.add,size: 40,
                        color: Colors.white
                    ) ),
              ),
            ],
          ),
        ),
      ),

      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            SizedBox(
              height: 3000,
              width: MediaQuery.of(context).size.width,
              child:Image.asset(backgroundImage,
                fit:BoxFit.fill,),
            ),
            ListView(children: [
             const SizedBox(height: 44,),
              Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               const   SizedBox(width:90 ,),
                Text("إضافة العملات",
                style:TextStyle(
                  color:kBallColor,fontSize: 26,fontWeight:FontWeight.w700
                ),
                ),
                const  SizedBox(width:90 ,),

                Image.asset('assets/images/backIcon.png',height: 50,width: 50,),
              ],),
              Padding(
                padding: const EdgeInsets.only(left:24.0,right: 24,top:24),
                child: Container(
                  height: 51,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(11),
                      color:Colors.grey[200],
                      border:Border.all(color:Colors.white)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      children: [
                        Text("ID",
                          style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),

                        Text("العملة",
                          style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),

                        Text("العلم",
                          style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),

                        Text("الاكشن",
                          style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),




                      ],),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount:controller.priceList.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PriceCardWidget(index:index,user:controller.priceList[index]),
                );
              })



            ],),
          ],
        ),
      ),
    );
  }
}
 class PriceCardWidget extends StatelessWidget {
   int index;
   Map<String,dynamic>user;

   PriceCardWidget({super.key,required this.index,required this.user});

   @override
   Widget build(BuildContext context) {
     return Container(
       child: Column(
         children: [
           Row(
             //mainAxisAlignment:MainAxisAlignment.spaceAround,
             children: [
               const SizedBox(width: 36,),
               Row(
                 children: [
                   Text(index.toString(),style: const TextStyle(color:Colors.black,
                       fontSize: 17
                   ),),
                   const SizedBox(width: 30,),

                   Text(user['country1'],
                     style:const TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),
                 ],
               ),
              const SizedBox(width: 23,),
               Image.asset('assets/images/img2.png',
               width: 44,
               ),
               const SizedBox(width: 23,),
               IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,
                 color:kPrimaryColor,
               )),
               IconButton(onPressed: (){}, icon: Icon(Icons.edit,
                 color:kPrimaryColor,
               )),

             //   Text(user['name'],
             //     style:const TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),
             // const  SizedBox(width: 10,),
             //   const Text('متصل',
             //     style:TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),
             //   const SizedBox(width: 10,),
             //   Text(user['email'],
             //     style:const TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),







             ],),
           // Row(
           //   mainAxisAlignment:MainAxisAlignment.center,
           //   children: [
           //
           //
           //   ],
           // ),
           // Divider(color: Colors.grey[400],),
         ],
       ),
     );
   }
 }