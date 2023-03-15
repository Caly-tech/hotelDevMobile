import 'dart:convert';

import 'package:flutter/material.dart';

import '../../api/apiMethode.dart';
import '../../start/titleText.dart';
import '../../ui/custom_form.dart';
import 'package:http/http.dart' as http;

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {

  final _formKey=GlobalKey<FormState>();
  TextEditingController nameController =TextEditingController();
  TextEditingController prenomController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top:10),
      child: SingleChildScrollView(
        child:  Column(
          children: [
            Column(
              children: [
                TitleText(text:"Ajouter Catégorie", color:Colors.black, size: 15,),
                const SizedBox(height: 10),
                Form(
                    key: _formKey,
                    child:Column(
                      children: [
                        CustomForm(
                          comment:"Saisir le prenom",
                          controller:prenomController,
                          nameField:"Prenom",
                        ),
                        const SizedBox(height: 10),
                        CustomForm(
                          comment:"Saisir le nom",
                          controller:nameController,
                          nameField:"Nom",
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (){
                              _formKey.currentState!.validate();
                              addClient();
                            },
                            child:const Text("Envoyer"),
                          ),
                        ),
                      ],
                    )

                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10),
                TitleText(text: "Liste Client", color:Colors.black,size: 15,),
                const SizedBox(height: 10),
                SingleChildScrollView(
                    child: Expanded(
                      child:Container(
                          width: MediaQuery.of(context).size.width*1,
                          child:SingleChildScrollView(
                            child: Column(
                              children: [
                                FutureBuilder(
                                    future:getClients(),
                                    builder:(context,snapshot){
                                      print(snapshot.data);
                                      if(snapshot.data==null){
                                        return CircularProgressIndicator();
                                      }
                                      else{
                                        return DataTable(
                                          columns:[
                                            DataColumn(label:TitleText(text:"Prenom",color: Colors.black,size: 14,)),
                                            DataColumn(label:TitleText(text:"Nom",color: Colors.black,size: 14,)),
                                            DataColumn(label:TitleText(text:"Creer",color: Colors.black,size: 14,)),
                                          ],
                                          rows:snapshot.data.map<DataRow>((data){
                                            var name =data['Name'].toString();
                                            var prenom = data['Prenom'].toString();
                                            var crer = data['CreatedAt'].toString();
                                            return DataRow(
                                                cells:[
                                                  DataCell(TitleText(text:prenom,color: Colors.black,size:12,)),
                                                  DataCell(TitleText(text:name,color: Colors.black,size:12,)),
                                                  DataCell(TitleText(text:crer,color: Colors.black,size:12,))
                                                ]
                                            );
                                          }).toList(),
                                        );
                                      }
                                    }
                                ),],
                            )             ,
                          )

                      ),
                    )
                )
              ],
            ),

          ],
        ),
      )
    );
  }
  Future addClient() async{
    Map list={
      'name':nameController.text,
      'prenom':prenomController.text
    };
    var url ='http://192.168.1.4:8000/createClients';
    var response = await http.post(Uri.parse(url),body:list,
        headers: {'Content-type':'application/json'}
    );
    print(response);
    if(response.statusCode==200){
      var jsonResponse = jsonEncode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content:Text('Successful add Client !!!'),
            backgroundColor: Colors.green,
          )
      );
      print(jsonResponse);
    }
  }
}
