import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_hps/cubit/app_states.dart';
import 'package:mini_hps/model/UserModel.dart';
import 'package:mini_hps/remote/dio_helper.dart';
import 'package:mini_hps/remote/end_points.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

UserModel? userModel;

List<String> users = [];

  void getUsers() {


    emit(AppListInitialStates());
    DioHelper.getData(
      url: "/$HPS_LOGIN/registration/allUsers",

    ).then((value) {

      emit(AppListSuccessStates());
      userModel = UserModel.fromJson(value.data);
      userModel?.data?.forEach((element) {
        users.add(element.username);
      });

    }).catchError((error) {
      print("hiiii");
      print(error.toString());
      emit(AppListErrorStates());
    });
  }
 List<String> checked = [];
  void sendNotification({required String title,required String message}){
    List<String> usersNotification = [];

      checked.forEach((userElement) {
       userModel?.data?.forEach((fullUserElement) {
         if(userElement.compareTo(fullUserElement.username)==0)
           {
             usersNotification.add(fullUserElement.fcmToken);
           }
       });
       usersNotification.forEach((element) {

       });





      });


    DioHelper.postData(
      url: "/$NOTIFICATION_SENDER/notification/tokens",
      data: {
        'title': title,
        'message': message,
        'token' : usersNotification
      },
    ).then((value) {


    }).catchError((error) {
      print(error.toString());

    });
  }




}