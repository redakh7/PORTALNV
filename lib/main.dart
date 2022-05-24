import 'package:flutter/material.dart';
import 'package:mini_hps/model/model.dart';
import 'package:mini_hps/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {

  const SignUpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SendMessage(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}

class SendMessage extends StatelessWidget {

  const SendMessage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          height: 200,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notification sent!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isButtonActive =true;
  final _formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formkey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Send Notification', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "the Title must not be empty";
                }
              },
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "the Message must not be empty";
                }
              },
              controller: _messageController,
              decoration: const InputDecoration(hintText: 'Message'),
            ),
          ),

          TextButton(
            onPressed: () {
              post(title: _titleController.text, message: _messageController.text);
              Navigator.of(context).pushNamed('/welcome');
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()),(route) => false );
            },
            child: const Text('send'),
          ),
        ],
      ),
    );
  }
}




