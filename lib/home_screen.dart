import 'dart:convert';

import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:bootstrap_alert/bootstrap_alert.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'auth_service.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';
import 'input_field.dart';

class HomeNew extends StatelessWidget {
  final _titleController = TextEditingController();
  final _messageController = TextEditingController();
  void showalert(){
    BootstrapAlert(
      visible: true,
      status: AlertStatus.success,
      leadingIcon: AlertIcons.success,
      isDismissible: true,
      text: 'Success Alert with Icon',
    );
  }
  @override
  Widget build(BuildContext context) {
    List listToSearch = [
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
      {'name': 'Nikhil', 'class': 9},
    ];
    final user = FirebaseAuth.instance.currentUser;
    List selectedList;
    final sw = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                leading: Image.asset(
                  'images/PAYIT.png',
                ),
                backgroundColor: Colors.blueGrey,
                actions: [
                  Row(
                    children: [
                      Text("${user?.email}"),
                      PopupMenuButton(
                          // add icon, by default "3 dot" icon
                          // icon: Icon(Icons.book)
                          itemBuilder: (context) {
                        return [
                          const PopupMenuItem<int>(
                            value: 0,
                            child: Text("Logout"),
                          ),
                        ];
                      }, onSelected: (value) {
                        if (value == 0) {
                          AuthService().signOut();
                        }
                      }),
                    ],
                  ),
                ],
              ),
              body: Container(
                height: 900,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 38.0, bottom: 38.0, left: 120.0, right: 120.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    elevation: 5.0,
                    child: Container(
                      height: 900,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 3.3,
                            height: 900,
                            color: Colors.blueGrey,
                            child: Padding(
                              padding: EdgeInsets.only(right: 50.0, left: 50.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Image.asset('images/PAYIT.png'),
                                    ),
                                    const SizedBox(
                                      height: 0.0,
                                    ),
                                    Container(
                                      child: const Text(
                                        "Manage your App Notification",
                                        style: TextStyle(
                                          fontSize: 21.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child: const Text(
                                        "It should only take a couple of minutes ",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 20.0, right: 70.0, left: 70.0),
                            child: Column(
                              children: <Widget>[
                                //InputField Widget from the widgets folder
                                InputField(
                                  controller: _titleController,
                                    label: "Notificatiom Title",
                                    content: "exemple"),
                                SizedBox(height: 20.0),
                                //InputField Widget from the widgets folder
                                InputField(
                                  controller: _messageController,
                                    label: "Notification content",
                                    content: "exemple"),
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: CustomCheckBoxGroup(
                                    selectedBorderColor: Colors.grey,
                                    unSelectedBorderColor: Colors.grey,
                                    buttonTextStyle: const ButtonTextStyle(
                                      selectedColor: Colors.white,
                                      unSelectedColor: Colors.black,
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    autoWidth: false,
                                    enableButtonWrap: true,
                                    wrapAlignment: WrapAlignment.center,
                                    unSelectedColor:
                                        Theme.of(context).canvasColor,
                                    buttonLables: const [
                                      "Homme",
                                      "Femme",
                                    ],
                                    buttonValuesList: const [
                                      "Homme",
                                      "Femme",
                                    ],
                                    checkBoxButtonValues: (values) {
                                      print(values);
                                    },
                                    horizontal: false,
                                    width: 120,
                                    // hight: 50,
                                    selectedColor: Colors.blueGrey,
                                    padding: 5,
                                    enableShape: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                      Container(
                                        width:250,
                                        child: CustomSearchableDropDown(
                                          menuMode: true,
                                          primaryColor: Colors.blueGrey,
                                          items: AppCubit.get(context).users,
                                          label: 'Select Name',
                                          multiSelectTag: 'Names',
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: Colors.blueGrey)),
                                          multiSelect: true,
                                          prefixIcon: const Padding(
                                            padding: EdgeInsets.all(0.0),
                                            child: Icon(Icons.search),
                                          ),
                                          dropDownMenuItems:
                                          AppCubit.get(context).users,
                                          onChanged: (value) {
                                         //   print(jsonDecode(value));
                                            if(value!=null)
                                            {
                                              Iterable<dynamic> list = jsonDecode(value);
                                              if(list.isNotEmpty){
                                                list.toList().forEach((element) {
                                                  // print(element);
                                                  AppCubit.get(context).checked.add(element);
                                                });
                                              }
                                            }

                                            print("-----------");
                                         //   print(list);

                                              //AppCubit.get(context).checked.addAll(jsonDecode(value));
                                            //  print(AppCubit.get(context).checked);

                                          }
                                        ),
                                      ),
                                // ...

                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 95, top: 13),
                                  child: ElevatedButton.icon(
                                    onPressed: () { AppCubit.get(context).sendNotification(title: _titleController.text, message: _messageController.text);},
                                    icon: const Icon(Icons
                                        .send), //icon data for elevated button
                                    label: Text("SEND"), //la
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blueGrey
                                        //elevated btton background color
                                        ), // bel text
                                  ),
                                ),

                                //Membership Widget from the widgets fold
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
