import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:mini_hps/cubit/app_cubit.dart';
import 'package:mini_hps/cubit/app_states.dart';
import 'package:mini_hps/model/model.dart';
import 'package:mini_hps/loginpage.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';


class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valuefirst = false;
  PageController page = PageController();
  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>( listener: (context, state) {}
    ,builder: (context,state)=>Scaffold(

          body: Column(

            children: [

              Container(
                color: Colors.deepPurple,
                child: Padding(

                  padding: const EdgeInsets.only(left: 10),
                  child: Menu(),
                ),
              ),
              Body(),
            ],
          ),
        ));
  }
}


class Body1 extends StatelessWidget {
   Body1({Key? key}) : super(key: key);
  bool valuefirst = false;
  PageController page = PageController();
  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(child: SideMenu(
          controller: page,
          onDisplayModeChanged: (mode) {
            print(mode);
          },
          style: SideMenuStyle(
            displayMode: SideMenuDisplayMode.auto,
            hoverColor: Colors.blue[100],
            selectedColor: Colors.lightBlue,
            selectedTitleTextStyle: const TextStyle(color: Colors.white),
            selectedIconColor: Colors.white,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(10)),
            // ),
            // backgroundColor: Colors.blueGrey[700]
          ),
          title: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 150,
                  maxWidth: 150,
                ),
                child:    Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Image.asset(
                    'images/hps.png',
                    width: 300,
                  ),
                ),
              ),
              const Divider(
                indent: 8.0,
                endIndent: 8.0,
              ),
            ],
          ),
          footer: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Portail',
              style: TextStyle(fontSize: 15),
            ),
          ),
          items: [
            SideMenuItem(
              priority: 0,
              title: 'Dashboard',
              onTap: () {
                page.jumpToPage(0);
              },
              icon: const Icon(Icons.home),
              badgeContent:  Text(
                "0",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SideMenuItem(
              priority: 1,
              title: 'Users',
              onTap: () {
                page.jumpToPage(1);
              },
              icon: const Icon(Icons.supervisor_account),
            ),
            SideMenuItem(
              priority: 2,
              title: 'Files',
              onTap: () {
                page.jumpToPage(2);
              },
              icon: const Icon(Icons.file_copy_rounded),
            ),
            SideMenuItem(
              priority: 3,
              title: 'Download',
              onTap: () {
                page.jumpToPage(3);
              },
              icon: const Icon(Icons.download),
            ),
            SideMenuItem(
              priority: 4,
              title: 'Settings',
              onTap: () {
                page.jumpToPage(4);
              },
              icon: const Icon(Icons.settings),
            ),
            SideMenuItem(
              priority: 6,
              title: 'Exit',
              onTap: () async {},
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),),
        Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const   SizedBox(height: 30,),
                Container(
                  width: 400,
                  child: Padding(
                    padding:const EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "the message must not be empty";
                        }
                      },
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'message',


                        filled: true,
                        fillColor: Colors.blueGrey.shade50,
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  child: Padding(
                    padding:const EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "the title must not be empty";
                        }
                      },
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'title',

                        filled: true,
                        fillColor: Colors.blueGrey.shade50,
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.deepPurple,
                        blurRadius: 10,

                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    child: Container(
                        width: 100,
                        height: 50,
                        child: Center(child: Text("SEND"))),
                    onPressed: (){


                      if (_formkey.currentState!.validate()) {
                        print(_titleController.text);
                        print(_messageController.text);
                        Navigator.of(context).pushNamed('/home');
                        AppCubit.get(context).sendNotification(title: _titleController.text, message: _messageController.text);
                      }


                    } ,

                    style: ElevatedButton.styleFrom(

                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),


                /* RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Send'),
                        onPressed: (){
                          if (_formkey.currentState!.validate())
                           print(_titleController.text);
                          print(_messageController.text);
                          post(title: _titleController.text, message: _messageController.text);},

                      )*/
              ],
            ),
          ),
        ),
      ],
    );
  }
}




class Body extends StatelessWidget {
  bool valuefirst = false;
  PageController page = PageController();
  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Expanded(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const   SizedBox(height: 30,),
                Container(
                  width: 400,
                  child: Padding(
                    padding:const EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "the message must not be empty";
                        }
                      },
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'message',


                        filled: true,
                        fillColor: Colors.blueGrey.shade50,
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  child: Padding(
                    padding:const EdgeInsets.all(15),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "the title must not be empty";
                        }
                      },
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'title',

                        filled: true,
                        fillColor: Colors.blueGrey.shade50,
                        labelStyle: TextStyle(fontSize: 12),
                        contentPadding: EdgeInsets.only(left: 30),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey.shade50),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.deepPurple,
                        blurRadius: 10,

                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    child: Container(
                        width: 100,
                        height: 50,
                        child: Center(child: Text("SEND"))),
                    onPressed: (){


                      if (_formkey.currentState!.validate()) {
                        print(_titleController.text);
                        print(_messageController.text);
                        Navigator.of(context).pushNamed('/home');
                        AppCubit.get(context).sendNotification(title: _titleController.text, message: _messageController.text);
                      }


                    } ,

                    style: ElevatedButton.styleFrom(

                      primary: Colors.deepPurple,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),


                /* RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Send'),
                        onPressed: (){
                          if (_formkey.currentState!.validate())
                           print(_titleController.text);
                          print(_messageController.text);
                          post(title: _titleController.text, message: _messageController.text);},

                      )*/
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                const   SizedBox(height: 10,),
                const Text(
                  'Choose Users',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const  SizedBox(height: 20,),

                SingleChildScrollView(
                  child: Container(
                    width: 390,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: CheckboxGroup(
                        labels: AppCubit.get(context).users,
                        onSelected: (List<String> checked) {
                          AppCubit.get(context).checked = checked;
                          print(AppCubit.get(context).checked);
                        }
                    ),
                  ),
                ),




              ],)

        ),





      ],
    );
  }

  Widget _formLogin(context) {
    final _formkey = GlobalKey<FormState>();
    var _userEmailController = TextEditingController();
    var _userPasswordController = TextEditingController();
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "the email/Phone number must not be empty";
              }
            },
            controller: _userEmailController,
            decoration: InputDecoration(
              hintText: 'Enter email or Phone number',
              filled: true,
              fillColor: Colors.blueGrey.shade50,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "the password must not be empty";
              }
            },
            controller: _userPasswordController,
            decoration: InputDecoration(
              hintText: 'Password',
              counterText: 'Forgot password?',
              suffixIcon: Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: Colors.blueGrey.shade50,
              labelStyle: TextStyle(fontSize: 12),
              contentPadding: EdgeInsets.only(left: 30),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey.shade50),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  spreadRadius: 10,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(child: Text("Sign In"))),
              onPressed: (){
                if (_formkey.currentState!.validate()) {
                  print(_userEmailController.text);
                  print(_userPasswordController.text);
                  Navigator.of(context).pushNamed('/home');
                }


              } ,
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }


}
