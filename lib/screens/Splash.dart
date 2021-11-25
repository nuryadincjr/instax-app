import 'package:flutter/material.dart';
import 'package:instax/screens/Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _navigatonHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/fujifilm.png',
            width: 200),
      ),
      persistentFooterButtons: [
        Container(
          width: 900,
          child: const Text(
            'Made With ❤ | © 2021',
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  _navigatonHome()async{
    await Future.delayed(const Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=> MyHomePage()));
  }
}