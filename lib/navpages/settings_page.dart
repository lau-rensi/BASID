import 'package:flutter/material.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';


import 'package:basid_2022/screens/login_page.dart';

import '../animations/slide_animation.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  
  var sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: ()async{
                          
                          await SessionManager().destroy();

                          
                            Navigator.push(
                              context,
                            SlideRightRoute(page: LoginPage()));

                        },
                        height: 45,
                        color: Colors.redAccent,
                        child: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          )
      ),
    );
  }
}
