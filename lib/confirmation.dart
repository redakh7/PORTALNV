import 'package:flutter/material.dart';

class Confirmation extends StatefulWidget {
  const Confirmation({Key? key}) : super(key: key);

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SafeArea(
          child:Scaffold(
            body: Center(child: Text('NOTIFICATION HAS BEEN SENT')),
            ),

          ),

        );
  }
}
