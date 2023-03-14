import 'package:flutter/material.dart';

import '../../start/titleText.dart';

class Client extends StatefulWidget {
  const Client({Key? key}) : super(key: key);

  @override
  State<Client> createState() => _ClientState();
}

class _ClientState extends State<Client> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child:TitleText(text: "Client", color:Colors.black)
    );
  }
}
