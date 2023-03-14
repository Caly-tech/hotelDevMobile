import 'package:flutter/material.dart';

import '../../start/titleText.dart';

class Chambre extends StatefulWidget {
  const Chambre({Key? key}) : super(key: key);

  @override
  State<Chambre> createState() => _ChambreState();
}

class _ChambreState extends State<Chambre> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:TitleText(text: "Chambre", color:Colors.black)
    );
  }
}
