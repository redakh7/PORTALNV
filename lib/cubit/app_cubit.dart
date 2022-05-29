import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mini_hps/cubit/app_states.dart';
import 'package:mini_hps/model/UserModel.dart';
import 'package:mini_hps/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

late UserModel userModel;
  void getUsers() {
    emit(AppListInitialStates());
    DioHelper.getData(
      url: "registration/allUsers",

    ).then((value) {

      emit(AppListSuccessStates());
      print(value.data);

    }).catchError((error) {
      print("hiiii");
      print(error.toString());
      emit(AppListErrorStates());
    });
  }


}