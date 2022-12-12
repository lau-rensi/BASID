import 'dart:async';

import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/navbar.dart';
import 'package:basid_2022/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int activeIndex = 0;
  bool isObscure = true;

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
                            duration: Duration(milliseconds: 300),
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
                            duration: Duration(milliseconds: 300),
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
                            duration: Duration(milliseconds: 300),
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
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                            child: Image.asset('assets/images/action.png', height: 400,),
                          ),
                        )
                      ]
                  ),
                ),
                SizedBox(height: 40,),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Email',
                    labelStyle: GoogleFonts.robotoSerif(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 0.4
                    ),
                    prefixIcon: Icon(Iconsax.user, color: Color(0xFF43A838), size: 18, ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84), width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: GoogleFonts.robotoSerif(
                      color: Colors.black54,
                      fontSize: 16.0,
                      letterSpacing: 0.15
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
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
                    labelStyle: GoogleFonts.robotoSerif(
                      color: Colors.black54,
                      fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 0.4
                    ),
                    prefixIcon: Icon(Iconsax.key, color: Color(0xFF43A838), size: 18, ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF339C84), width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: GoogleFonts.robotoSerif(
                      color: Colors.black54,
                        fontSize: 16.0,
                        letterSpacing: 0.15
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
                      child: Text('Forgot Password?', style: GoogleFonts.robotoSerif(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        SlideRightRoute(page: NavBar()),);},
                  height: 45,
                  color: Color(0xFF43A838
                  ),
                  child: Text("LOGIN",
                    style: GoogleFonts.robotoSerif(color: Colors.white, fontSize: 16.0,letterSpacing: 0.5)),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?', style: GoogleFonts.robotoSerif(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(page: RegisterPage()),);},
                      child: Text('Register', style: GoogleFonts.robotoSerif(color: Colors.blue, fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),),
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