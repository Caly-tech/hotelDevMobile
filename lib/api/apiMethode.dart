import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future setCategory(nomCategorie,tarif) async{
Map list={
  'nom_categorie':nomCategorie,
  'tarifs':tarif
};
  var url ='http://192.168.1.1/createCategories';
  var response = await http.post(Uri.parse(url),body:list, headers: {
    'Content-type':'application-json',
  });
  if(response.statusCode==200){
    var jsonResponse = jsonDecode(response.body);
  }
}

Future getCategory() async{
  var url='htt://192.168.1.1/viewCategories';
  var response = await http.get(Uri.parse(url),headers: {
    'Content-type':'application-json',
  });
  var jsonResponse;
  if(response.statusCode==200){
     jsonResponse =jsonDecode(response.body);
  }
  return jsonResponse['categorie'];
}