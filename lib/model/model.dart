
import 'package:mini_hps/remote/dio_helper.dart';


void get (){
  DioHelper.getData(
      url:"registration/all_users",
  ).then((value) {
    print(value.data);

  }).catchError((error) {
    print(error.toString());

  });
}


