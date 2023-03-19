import 'package:flutter/material.dart';

class AccueilUser extends StatefulWidget {
  const AccueilUser({Key? key}) : super(key: key);

  @override
  State<AccueilUser> createState() => _AccueilUserState();
}

class _AccueilUserState extends State<AccueilUser> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
        children: [
        Column(
        children: [
          Image.asset("assets/images/hotel_1.png",fit: BoxFit.cover),
         ],
           )
        ],
        ),
    );
  }
}
