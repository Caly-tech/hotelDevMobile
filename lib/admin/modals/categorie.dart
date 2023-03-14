import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestion_hotel/api/apiMethode.dart';
import 'package:gestion_hotel/ui/custom_form.dart';
import 'package:http/http.dart' as http;

import '../../start/titleText.dart';

class Categorie extends StatefulWidget {
  const Categorie({Key? key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController nomCategorie = TextEditingController();
  TextEditingController tarif =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
      children: [
        Column(
          children: [
          TitleText(text:"Ajouter Catégorie", color:Colors.black, size: 15,),
          SizedBox(height: 20),
          Form(
              key: _formKey,
                child:Column(
                  children: [
                    CustomForm(
                      comment:"Saisir le nom de la categorie",
                      controller:nomCategorie,
                      nameField:"Nom Categorie",
                      ),
                      const SizedBox(height: 20),
                      CustomForm(
                        comment:"Saisir le montant du tarif",
                        controller:tarif,
                        nameField:"Tarif",
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){

                              setCategory(nomCategorie.text, tarif.text);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content:Text('Successful add Category !!!'),
                                    backgroundColor: Colors.green,
                                  )
                              );
                            }
                          },
                          child:const Text("Envoyer"),
                        ),
                      ),
            ],
          )

      ),
      ],
        ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child:Column(
              children: [
                TitleText(text: "Liste Catégorie", color:Colors.black,size: 15,),
               SizedBox(height: 12),
               Container(
                 width: MediaQuery.of(context).size.width*1,
                 child: FutureBuilder(
                     future: getCategory(),
                     builder:(context,snapshot){
                       if(snapshot.data==null){
                         return CircularProgressIndicator();
                       }
                       else{
                            return DataTable(
                                columns:[
                                      DataColumn(label:TitleText(text:"Nom Categorie",color: Colors.black,size: 14,)),
                                      DataColumn(label:TitleText(text:"Tarif",color: Colors.black,size: 14,)),
                                ],
                                rows:snapshot.data.map<DataRow>((data){
                                  var name =data['nom_categorie'].toString();
                                  var tarif = data['tarifs'].toString();

                                  return DataRow(
                                      cells:[
                                              DataCell(TitleText(text:name,color: Colors.black,size:12,)),
                                              DataCell(TitleText(text:tarif,color: Colors.black,size:12,))
                                      ]
                                  );
                                }


                                ),
                            );
                       }
                     }
                 ),
               )
              ],
            ),
          )
      ],
    ),
    );
  }
}


