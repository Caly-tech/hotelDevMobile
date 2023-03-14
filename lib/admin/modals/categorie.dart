import 'package:flutter/material.dart';

import '../../start/titleText.dart';

class Categorie extends StatefulWidget {
  const Categorie({Key? key}) : super(key: key);

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:TitleText(text: "Category", color:Colors.black)
    );
  }
}
