import 'dart:async';
import 'package:requests/requests.dart';
// import 'dart:html';
import 'dart:convert';

import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/navbar.dart';
import 'package:basid_2022/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 0;
  bool isObscure = true;


  
  final emailTextController = TextEditingController();
  
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4)
          activeIndex = 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  height: 350,
                  child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AnimatedOpacity(
                            opacity: activeIndex == 0 ? 1 : 0,
                            duration: Duration(seconds: 1,),
                            curve: Curves.linear,
                            child: Image.asset('assets/images/logo-basid-2.png', height: 400,),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AnimatedOpacity(
                            opacity: activeIndex == 1 ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.linear,
                            child: Image.asset('assets/images/login1png.png', height: 400,),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AnimatedOpacity(
                            opacity: activeIndex == 2 ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.linear,
                            child: Image.asset('assets/images/pictureit.png', height: 400,),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: AnimatedOpacity(
                            opacity: activeIndex == 3 ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.linear,
                            child: Image.asset('assets/images/action.png', height: 400,),
                          ),
                        )
                      ]
                  ),
                ),
                SizedBox(height: 40,),
                TextField(
                  controller: emailTextController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Iconsax.user, color: Color(0xFF43A838), size: 18, ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84), width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: passwordTextController,
                  obscureText: isObscure,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.black12,),
                      onPressed:(){
                        setState((){
                          isObscure = !isObscure;
                        });
                      },),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Iconsax.key, color: Color(0xFF43A838), size: 18, ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84), width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84
                      ), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Forgot Password?', style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                MaterialButton(
                    onPressed: () async {
                      // Navigator.push(
                      //   context,
                      //   SlideRightRoute(page: NavBar()),);
                      dynamic payload = {
                        'email': emailTextController.text,
                        'password': passwordTextController.text
                      };

                      print(payload);
                      var response = await Requests.post("http://192.168.1.3/basid/mobile_login", body: payload,
                      bodyEncoding: RequestBodyEncoding.FormURLEncoded);
                      if (response.statusCode == 200) {
                        dynamic result = jsonDecode(response.json());
                        print(result['message']);
                      }
                    },
                  height: 45,
                  color: Color(0xFF43A838
                  ),
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(page: RegisterPage()),);},
                      child: Text('Register', style: TextStyle(color: Colors.blue, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}