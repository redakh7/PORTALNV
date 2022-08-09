

  import 'package:bloc/bloc.dart';

  import 'package:flutter_bloc/flutter_bloc.dart';

  import 'package:mini_hps/cubit/app_states.dart';
  import 'package:mini_hps/model/UserModel.dart';
  import 'package:mini_hps/remote/dio_helper.dart';

    class AppCubit extends Cubit<AppStates>{
    AppCubit() : super(AppInitialStates());

    static AppCubit get(context) => BlocProvider.of(context);

    late UserModel userModel;
    List<String> users = [];
    void getUsers() {
    emit(AppListInitialStates());
    DioHelper.getData(
      url: "HPS-SWITCH/users",
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print("this is hiiiiiiiiiiii");
      print(userModel);
      userModel.data.forEach((element) {
        users.add(element.firstName);

        print(users);
        emit(AppListSuccessStates());
      }
      );
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
      userModel.data.forEach((fullUserElement) {
        if(userElement.compareTo(fullUserElement.firstName)==0)
        {
          usersNotification.add(fullUserElement.fcmToken);
        }
      });
      usersNotification.forEach((element) {
      print(element.toString());
      });
    });
    print("hii");
print(usersNotification);
    print("hiiiii");
    DioHelper.postData(
      url: "HPS-SWITCH/notification",
      data: {
        'title': title,
        'message': message,
        'token' : usersNotification
      },
    ).then((value) {
print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }
}