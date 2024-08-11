


 import 'package:flutter/material.dart';
import 'package:freelancerApp/admin/users/users_controller.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:get/get.dart';
import '../../core/widgets/new_appbar.dart';

class UsersView extends StatefulWidget {
   const UsersView({super.key});

   @override
   State<UsersView> createState() => _UsersViewState();
 }

 class _UsersViewState extends State<UsersView> {

  UsersController controller=Get.put(UsersController());
  @override
  void initState() {
    controller.getAllUsers();
    super.initState();
  }
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
             NewAppbar(txt:'المستخدمين'),


            const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.only(left:24.0,right: 24,top:17),
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

                     Text("اسم المستخدم",
                     style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),

                   Text("الحالة",
                     style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),

                      Text("البريد الالكتروني",
                     style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),

                   Text("الاكشن",
                     style:TextStyle(color:kPrimaryColor,fontWeight:FontWeight.w600),),




                   ],),
                 ),
               ),
             ),

             Padding(
               padding: const EdgeInsets.only(left:18.0,right: 18,top:10),
               child: ListView.builder(
                 shrinkWrap: true,
                   itemCount: controller.usersList.length,
                   itemBuilder: (context,index){
                     return UserCardWidget(index: index, user: controller.usersList[index],
                     );

               }),
             )




           ],),
         ],
       )
     );
   }
 }

 class UserCardWidget extends StatelessWidget {
  int index;
  Map<String,dynamic>user;

  UserCardWidget({super.key,required this.index,required this.user});

   @override
   Widget build(BuildContext context) {
     return Container(
       child: Column(
         children: [
           Row(
             //mainAxisAlignment:MainAxisAlignment.spaceAround,
             children: [
              const SizedBox(width: 4,),
             Row(
               children: [
                 Text(index.toString(),style: const TextStyle(color:Colors.black,
                 fontSize: 17
                 ),),
                 const SizedBox(width: 6,),

                  CircleAvatar(
                    backgroundImage: NetworkImage(user['image']),
                  )
               ],
             ),
               SizedBox(width: 10,),

             Text(user['name'],
             style:const TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),
               SizedBox(width: 10,),
              const Text('متصل',
             style:TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),
               SizedBox(width: 10,),
             Text(user['email'],
               style:const TextStyle(color: Colors.black,fontWeight:FontWeight.w600),),







           ],),
           Row(
             mainAxisAlignment:MainAxisAlignment.center,
             children: [
               IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_outlined,
                 color:kPrimaryColor,
               )),
               IconButton(onPressed: (){}, icon: Icon(Icons.edit,
                 color:kPrimaryColor,
               )),
               IconButton(onPressed: (){}, icon: Icon(Icons.visibility_outlined,
                 color:kPrimaryColor,
               )),
             ],
           ),
           Divider(color: Colors.grey[400],),
         ],
       ),
     );
   }
 }

