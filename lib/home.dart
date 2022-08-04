import 'dart:convert';

import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'cubit/app_cubit.dart';
import 'gender.dart';
import 'input_field.dart';
import 'membership.dart';

class HomeNew extends StatelessWidget {
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
    List selectedList;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blueGrey, Colors.black],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: 50.0, bottom: 60.0, left: 120.0, right: 120.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            elevation: 5.0,
            child: Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 3.3,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.blueGrey,
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 50.0, left: 50.0),
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
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                            Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.black87,
                                child: Text(
                                  ">",
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 40.0, right: 70.0, left: 70.0),
                    child: Column(
                      children: <Widget>[
                        //InputField Widget from the widgets folder
                        InputField(
                            label: "Notificatiom Title", content: "exemple"),

                        SizedBox(height: 20.0),

                        //InputField Widget from the widgets folder
                        InputField(
                            label: "Notification content", content: "exemple"),
                        SizedBox(height: 20.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Select Users             '),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.7,
                             // height: MediaQuery.of(context).size.height,
                              child: CustomSearchableDropDown(
                                //  showLabelInMenu: true,
                                menuMode: true,
                                primaryColor: Colors.blueGrey,
                                items: listToSearch,
                                label: 'Select Name',
                                multiSelectTag: 'Names',
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border:
                                        Border.all(color: Colors.blueGrey)),
                                multiSelect: true,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Icon(Icons.search),
                                ),
                                dropDownMenuItems: listToSearch.map((item) {
                                      return item['name'];
                                    }).toList() ??
                                    [],
                                onChanged: (value) {
                                  if (value != null) {
                                    selectedList = jsonDecode(value);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),

                        Padding(
                          padding: const EdgeInsets.only(left: 90,top: 20),
                          child: ElevatedButton.icon(
                            onPressed: (){
                            },
                            icon: Icon(Icons.send),  //icon data for elevated button
                            label: Text("SEND"), //la
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey
                              //elevated btton background color
                            ),// bel text
                          ),
                        )

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
    );
  }
}
