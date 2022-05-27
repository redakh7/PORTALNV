import 'package:flutter/material.dart';
import 'package:mini_hps/home_page.dart';
import 'package:mini_hps/model/model.dart';
import 'package:mini_hps/remote/dio_helper.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"HPS portail",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),

    );
  }
}