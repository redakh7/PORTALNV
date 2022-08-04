

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_hps/confirmation.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'Flutter Login Web',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: const BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blueGrey, Colors.black],),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Body()
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height > 770 ? 64 : size.height > 670 ? 32 : 16),
      child: Container(
        child: Center(
          child: Card(
            elevation: 14,
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(55),
              ),
            ),
            child: AnimatedContainer(

              duration: Duration(milliseconds: 200),
              height: size.height * (size.height > 470 ? 0.7 : size.height > 470 ? 0.8 : 0.9),
              width: 500,
              color: Colors.white,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          Container(

                            width: 30,
                            child: const Divider(
                              color:  Colors.blueGrey,
                              thickness: 2,
                            ),
                          ),

                          const SizedBox(
                            height: 32,
                          ),

                          TextField(
                            decoration: InputDecoration(
                              focusColor: Colors.blueGrey,
                              hoverColor: Colors.blueGrey,
                              hintText: 'Email',
                              labelText: 'Email',
                              suffixIcon: Icon(
                                Icons.mail_outline,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 32,
                          ),

                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              suffixIcon: Icon(
                                Icons.lock_outline,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 64,
                          ),



                          const SizedBox(
                            height: 32,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const Text(
                                "You do not have an account?",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),

                              SizedBox(
                                width: 8,
                              ),

                              GestureDetector(

                                child: Row(
                                  children: const [

                                    Text(
                                      "Siqn In",
                                      style: TextStyle(
                                        color:  Colors.green,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 8,
                                    ),

                                    Icon(
                                      Icons.arrow_forward,
                                      color:  Colors.blueGrey,
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }




}
