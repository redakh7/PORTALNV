import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hps/cubit/app_cubit.dart';
import 'package:mini_hps/cubit/bloc_observer.dart';
import 'package:mini_hps/home.dart';
import 'package:mini_hps/home_page.dart';
import 'package:mini_hps/model/model.dart';
import 'package:mini_hps/remote/dio_helper.dart';
import 'package:mini_hps/loginpage.dart';

void main() {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create: (context)=>AppCubit()..getUsers())
    ], child: MaterialApp(
      initialRoute: '/login',
      routes: {

        '/home': (context) => HomeNew(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      title:"HPS portail",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: HomePage(),

    ));
  }

}