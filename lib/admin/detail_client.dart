import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';
import 'package:gestion_hotel/start/titleText.dart';
class DetailClient extends StatelessWidget {
  final id;
   const DetailClient({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TitleText(text: "Detail Client", color:Colors.white,size: 14),),
      body:FutureBuilder(
          future: getClient(id),
          builder:(context,snapshot){
            if(snapshot.data==null){
              return CircularProgressIndicator();
            }
            else{
              return Text(snapshot.data['Prenom']);
            }
          }
      ),
    );
  }
}
