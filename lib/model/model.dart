
import 'package:mini_hps/remote/dio_helper.dart';

void post({required String title, required String message}) {

  DioHelper.postData(
    url: "notification/token",
    data: {
      'title': title,
      'message': message,
      'token' : "ej5SkcQnQm-SxhTBnPItht:APA91bEA5xQov13z-jSeFXd-FwAS5mnb2vs_Truf00nvR1KgNecc16UXNfefc3CXNuHoBP9mVjrL_-JpTlYMUgk_sfhyqGjrrS_Ub5DchD2BtTC0AGnlA8yw0XY0UByczq0A5fDJKE5S",
    },
  ).then((value) {
    print(value.data);

  }).catchError((error) {
    print(error.toString());

  });
}

void get (){
  DioHelper.getData(
      url:"registration/all_users",
  ).then((value) {
    print(value.data);

  }).catchError((error) {
    print(error.toString());

  });
}


