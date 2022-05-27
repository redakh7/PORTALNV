import 'package:flutter/material.dart';
import 'package:grouped_buttons_ns/grouped_buttons_ns.dart';
import 'package:mini_hps/model/model.dart';
import 'package:mini_hps/model/model.dart';
import 'package:mini_hps/remote/dio_helper.dart';
import 'package:mini_hps/widget/checkBox.dart';


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
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Portail"),
        ),

        body: Row(
          children: [
            Expanded(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the Title must not be empty";
                          }
                        },
                        controller: _titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                          hintText: 'Enter Title Her',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "the Title must not be empty";
                          }
                        },
                        controller: _messageController,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Message',
                          hintText: 'Enter Message Her',
                        ),
                      ),
                    ),


                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Send'),
                      onPressed: (){
                        if (_formkey.currentState!.validate())
                          print(_titleController.text);
                        print(_messageController.text);
                        post(title: _titleController.text, message: _messageController.text);},

                    )
                  ],
                ),
              ),
            ),
            Expanded(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    'Choose Users',
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                SizedBox(height: 20,),
                Expanded(

                  child: SingleChildScrollView(
                    child: Container(
                      width: 390,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Colors.grey),
                        borderRadius: BorderRadius.circular(5.0),
    ),
                      child: CheckboxGroup(
                          labels: const [
                            "oubadaalkahf",
                            "redakhoudri",
                            "oubadaoubada",
                            "med oubadaalkahf",
                            "redaaredaaaa",
                            "saadsaaad",
                            "hpsswitch1",
                            "hpsswitch2",
                            "hpsswitch3",


                          ],
                          onSelected: (List<String> checked) => print(checked.toString())
                      ),
                    ),
                  ),
                ),


                Expanded(
                  child:Container(),
                ),

              ],)

            ),




          ],
        ),
    );
  }
}


