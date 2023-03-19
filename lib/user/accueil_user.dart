import 'package:flutter/material.dart';

class AccueilUser extends StatefulWidget {
  const AccueilUser({Key? key}) : super(key: key);

  @override
  State<AccueilUser> createState() => _AccueilUserState();
}

class _AccueilUserState extends State<AccueilUser> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Accueil"),
    );
  }
}
