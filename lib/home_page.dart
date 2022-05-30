import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:mini_hps/cubit/app_cubit.dart';
import 'package:mini_hps/cubit/app_states.dart';
import 'package:mini_hps/loginpage.dart';
import 'package:mini_hps/model/model.dart';



class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool valuefirst = false;

  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>( listener: (context, state) {}

    ,builder: (context,state)=>Scaffold(
          backgroundColor: Color(0xFFf5f5f5),

          body:  ListView(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 8),
            children: [
              Menu(),
              // MediaQuery.of(context).size.width >= 980
              //     ? Menu()
              //     : SizedBox(), // Responsive
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 320,
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const   SizedBox(height: 30,),
                    Padding(
                      padding:const EdgeInsets.all(15),
                      child:Container(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "the Title must not be empty";
                            }
                          },
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Enter Title Her',
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
                    Padding(
                      padding:const EdgeInsets.all(15),
                      child: Container(
                        width: 350,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "the Message must not be empty";
                            }

                          },
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Enter Message Her',
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

                    Center(
                      child: ElevatedButton(
                        child: Container(
                          width: 90,
                            height:40 ,

                            child: Center(child: Text(" SEND"))),
                        onPressed: (){
                          if (_formkey.currentState!.validate())
                            print(_titleController.text);
                          print(_messageController.text);
                          AppCubit.get(context).sendNotification(title: _titleController.text, message: _messageController.text);
                        //  post(title: _titleController.text, message: _messageController.text);
    }
                        ,
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
              ),
              ),
            Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const   SizedBox(height: 10,),
                    const Text(
                      'Choose Users',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const  SizedBox(height: 20,),
                    Container(

                      child: SingleChildScrollView(
                        child: Container(
                          width: 390,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.blueGrey.shade50),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: CheckboxGroup(
                              labels: AppCubit.get(context).users,
                              onSelected: (List<String> checked) => print(checked.toString())
                          ),
                        ),
                      ),
                    ),


                    Container(
                      child:Container(),
                    ),

                  ],)

            ),
  ]),




          ],

          )),
          );

  }
  Widget _menuItem({String title = 'Title Menu', isActive = false}) {
    return Padding(
      padding: const EdgeInsets.only(right: 75),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Column(
          children: [
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.deepPurple : Colors.grey,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            isActive
                ? Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(30),
              ),
            )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}







