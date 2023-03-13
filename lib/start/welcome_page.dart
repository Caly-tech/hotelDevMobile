import 'package:flutter/material.dart';
import 'package:gestion_hotel/main.dart';
import 'package:gestion_hotel/start/subtitleText.dart';
import 'package:gestion_hotel/start/titleText.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  List title=[
    "Chambre",
    "Hotel",
    "Profil"
  ];
  List subtitle=[
    "Trouvé les chambres en quelque click",
    "Reservé chambre bar facilement",
    "Gerer vos données de maniere efficace"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: PageView.builder(
         itemCount: images.length,
         scrollDirection: Axis.vertical,
           itemBuilder: (context,index){
           return Container(
             width:double.infinity,
             height: double.infinity,
             decoration: BoxDecoration(
               image:DecorationImage(
                   image:AssetImage("assets/images/"+images[index]),
             ),
             ),
             child: Container(
               margin: EdgeInsets.only(top:100,left: 20,right: 20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TitleText(text:title[index], color:Colors.black),
                       //SizedBox(height: 20),
                       Container(
                         width: 250,
                         child: SubTitleText(text:subtitle[index], color: Colors.pink,),
                       ),
                       ElevatedButton(onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                       }, child:SubTitleText(text:"Get Started",
                           color:Colors.white
                       )
                       ),
                     ],
                   ),
                   Column(
                     children:List.generate(3, (indexList){
                       return Container(
                         margin: EdgeInsets.only(bottom: 2),
                         width: 8,
                         height:index==indexList?25:8,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color: index==indexList?Colors.pink:Colors.pink.withOpacity(0.3)
                         ),
                       );
                     })
                   )

                 ],
               ),
             ),
           );
           }
       ),
    );
  }
}
