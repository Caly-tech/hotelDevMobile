import 'package:flutter/material.dart';

import '../../start/titleText.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:TitleText(text: "Accueil", color:Colors.black)
    );
  }
}
