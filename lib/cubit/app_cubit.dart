

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
    print("dkhlat");
    DioHelper.getData(
      url: "HPS-SWITCH/users",
    ).then((value) {
      print(value.data);
      userModel = UserModel.fromJson(value.data);
      print("this is hiiiiiiiiiiii");
      print(userModel);
      userModel.data.forEach((element) {
        users.add(element.firstName+(' ')+element.lastName+(': ')+element.phoneNumber);

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
  List<String> hommeList = [];
  List<String> femmeList = [];
    void getuserbygender(String gender){
      DioHelper.getData(
        url: "wallet/registration/userbygender?gender=$gender",
      ).then((value) {
        print(value.data);
userModel= UserModel.fromJson(value.data);
        if(gender.contains("Homme")){
        userModel.data.forEach((element) {
          hommeList.add(element.firstName);
        });
        }else
          if(gender.contains("Femme")){
            userModel.data.forEach((element) {
              femmeList.add(element.firstName);
            });
          }
      }).catchError((error) {
        print(error.toString());
      });
    }

  void sendNotification({required String title,required String message}){
    List<String> usersNotification = [];

    checked.forEach((userElement) {
      print("-----------------");
      print(checked);
      print("-----------------");
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
checked.clear();
    }).catchError((error) {
      print(error.toString());
    });
  }
}