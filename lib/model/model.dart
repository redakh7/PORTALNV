
import 'package:mini_hps/remote/dio_helper.dart';

void post({required String title, required String message}) {

  DioHelper.postData(
    url: "notification/token",
    data: {
      'title': title,
      'message': message,
      'token' : "cJA56PENSPCFMfdgLGOP4E:APA91bEC7EDJNhF239vKQwTFZUJmaeXBMfFKW4agUAzkmrHciwuocoj2cT23uVSG8BCyD9lvNC1LThglz0awdtZicHKC3c6GGy8XrH9Rb3uv2BYqpmdkOfFt6qMaAvPW7TKJc-Ydbkvh",
    },
  ).then((value) {
    print(value.data);

  }).catchError((error) {
    print(error.toString());

  });
}


