import 'package:flutter/material.dart';
import 'package:gestion_hotel/start/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sen HOTEL',
      theme: ThemeData(primarySwatch: Colors.pink),
      home:const WelcomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Sen HOTEL",style: TextStyle(fontFamily: 'Poppins'),),centerTitle: true, ),
      body:Column(
        children: [
          Center(
            child: Text("Welcome to Sen HOTEL",style: TextStyle(fontFamily: 'Poppins'),),
          ),
        ],
      )

    );
  }
}

