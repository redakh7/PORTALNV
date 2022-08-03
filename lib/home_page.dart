import 'dart:convert';

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
import 'package:select_form_field/select_form_field.dart';


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







class Body extends StatelessWidget {
  bool valuefirst = false;
  PageController page = PageController();
  final _formkey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List listToSearch=[

      {
        'name': 'Nikhil',
        'class': 9
      },
    ];

    var selected;
    List selectedList;
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
                SizedBox(height: 12,),
                SizedBox(height: 12,),
                Container(
                  width: 350,
                  child: CustomSearchableDropDown(
                  //  showLabelInMenu: true,
                    menuMode: true,
                    primaryColor: Colors.blueGrey,
                    items: AppCubit.get(context).users,
                    label: 'Select Name',
                    multiSelectTag: 'Names',
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: Colors.blueGrey
                        )
                    ),
                    multiSelect: true,
                    prefixIcon:  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(Icons.search),
                    ),
                    dropDownMenuItems: listToSearch.map((item) {
                      return item['name'];
                    })?.toList() ??
                        [],
                    onChanged: (value){
                      if(value!=null)
                      {
                        selectedList = jsonDecode(value);
                      }
                    },
                  ),
                ),

              ],)
        ),
      ],
    );
  }




}
