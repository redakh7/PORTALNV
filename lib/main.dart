import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_hps/cubit/app_cubit.dart';
import 'package:mini_hps/remote/dio_helper.dart';

import 'auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Firebase.initializeApp(

    options: const FirebaseOptions(
      apiKey: "AIzaSyDDjzEAPEX3ymmSysS1n-ARzCh7p8Ex1X4", // Your apiKey
      appId: "1:551265740180:web:4966af8bd71abc9d4d5b81", // Your appId
      messagingSenderId: "551265740180", // Your messagingSenderId
      projectId: "portalpayit", // Your projectId
    ),
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create:(context) => AppCubit()..getUsers())
    ], child: MaterialApp(
        debugShowCheckedModeBanner: false, home: AuthService().handleAuth()));
  }
}
