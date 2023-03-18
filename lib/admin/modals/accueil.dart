import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';

import '../../start/titleText.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin:const EdgeInsets.only(top: 10),
            child: TitleText(text:"Liste Chambre", color:Colors.black,size:17),
          ),
          Column(
            children: [
              FutureBuilder(
                  future: getChambres(),
                  builder:(context,snapshot){
                    print(snapshot.data);
                    if(snapshot.data==null){
                      return CircularProgressIndicator();
                    }
                    else{
                      List chambres = snapshot.data;
                      return ListView.builder(
                      itemCount: snapshot.data.length,
                        itemBuilder: (context,i){
                          return ListTile(
                            title: Text(snapshot.data[i]['EtatChambre']),
                          );
                        }
                      );
                    }
                  }
              ),
            ],
          )
        ],
      ),
    );
  }
}
