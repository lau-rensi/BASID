import 'dart:async';
import 'package:basid_2022/animations/leftSlide_animation.dart';
import 'package:basid_2022/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:requests/requests.dart';

import 'dart:convert';


class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int activeIndex = 0;
  bool isObscure = true;
  bool _isObscure = true;
  List<String> items = ['Male', 'Female'];
  String? selectedItem = 'Male';

  List<String> itemsBrgy = ['Carmen', 'Balulang', 'Patag', 'Lapasan'];
  String? selectedBrgy = 'Carmen';
  List<String> itemsCity = ['Cagayan De Oro'];
  String? selectedCity = 'Cagayan De Oro';


  final myController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  
  final baseUrl = "http://192.168.1.3";

  Future<void> _showDialog(title, message ) async {
    final messageBox = Text(message); 
    final titleBox = Text(title);
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: titleBox,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                messageBox,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Try again'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;

        if (activeIndex == 4) {
          activeIndex = 0;
        }
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
                  height: 50,
                  child: Text('REGISTRATION', style: TextStyle(color: Color(0xFF43A838), fontSize: 30, fontWeight: FontWeight.w500, fontFamily: 'lora',letterSpacing: 1.5),),
                ),
                SizedBox(height: 20,),
                Row(children: [
                  Expanded(
                      flex: 4,
                      child: TextField(
                        controller: firstNameController, //your value container for textbox
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Iconsax.card1, color: Color(0xFF339C84), size: 18, ),
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
                  ),
                  SizedBox(width: 7,),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: lastNameController, //your value container for textbox
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(Iconsax.card1, color: Color(0xFF339C84), size: 18, ),
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
                  )
                ],),// first name and last name
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'Gender',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Iconsax.profile_2user, color: Color(0xFF339C84), size: 18, ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                          value: selectedItem,
                          items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 14.0)),
                          ))
                          .toList(),
                          onChanged: (item)=> setState(() => selectedItem = item),
                      ),
                    ),
                    SizedBox(width: 7,),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        controller: ageController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'Age',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Iconsax.tag1, color: Color(0xFF339C84), size: 18, ),
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
                    )
                  ],
                ),
                SizedBox(height: 10,),//gender and  age
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'Baranggay',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Iconsax.profile_2user, color: Color(0xFF339C84), size: 18, ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                          value: selectedBrgy,
                          items: itemsBrgy
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 14.0)),
                          ))
                          .toList(),
                          onChanged: (item)=> setState(() => selectedBrgy = item),
                      ),
                    ),
                    SizedBox(width: 7,),
                    Expanded(
                      flex: 4,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          labelText: 'City',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Icon(Iconsax.profile_2user, color: Color(0xFF339C84), size: 18, ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF339C84), width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                          value: selectedCity,
                          items: itemsCity
                          .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item, style: TextStyle(fontSize: 14.0)),
                          ))
                          .toList(),
                          onChanged: (item)=> setState(() => selectedCity = item),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),//gender and  age
                TextField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Iconsax.user, color: Color(0xFF339C84), size: 18, ),
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
                ),//username
                SizedBox(height: 10,),
                TextField(
                  controller: passwordController,
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
                    prefixIcon: Icon(Iconsax.key, color: Color(0xFF339C84), size: 18, ),
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
                ), //password
                SizedBox(height: 10,),
                TextField(
                  controller: password2Controller,
                  obscureText: _isObscure,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.black12,),
                      onPressed:(){
                        setState((){
                          _isObscure = !_isObscure;
                        });
                      },),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Iconsax.key, color: Color(0xFF339C84), size: 18, ),
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
                ), //confirm password
                //address
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: () async{
                    dynamic firstName = firstNameController.text;
                    dynamic lastName = lastNameController.text;
                    dynamic gender = selectedItem;
                    dynamic age = ageController.text;
                    dynamic baranggay = selectedBrgy;
                    dynamic city = selectedCity;
                    String email = emailController.text;
                    dynamic pass1 = passwordController.text;
                    dynamic pass2 = password2Controller.text;

                    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); //regular expressions for email

                    if (!emailRegex.hasMatch(email)){ //if email is not valid
                      _showDialog('Error!', 'Please enter a valid email'); //throw dialog
                    } else if (pass1 != pass2) { //if password and password2 does not match
                      _showDialog('Error!','Password does not match!'); //throw dialog
                    } else {
                      print('First Name : $firstName');
                      print('Last Name : $lastName');
                      print('Gender : $gender');
                      print('Age : $age');
                      print('Baranggay : $baranggay');
                      print('City : $city');
                      print('Email : $email');
                      print('Password : $pass1');
                      print('Password Confirmation : $pass2');


                      dynamic payload = {
                        "email" : email, 
                        "password" : pass1, 
                        "first_name" : firstName, 
                        "last_name" : lastName, 
                        "baranggay" : baranggay, 
                        "city" : city, 
                        "gender" : gender, 
                        "age" : age
                      };

                      print(payload);
                      var response = await Requests.post("$baseUrl/basid/mobile_register", body: payload,
                          bodyEncoding: RequestBodyEncoding.FormURLEncoded);
                      if (response.statusCode == 200) {
                        dynamic result = jsonDecode(response.json());
                        print(result['message']);
                      }
                    }



                  },
                  height: 45,
                  color: Color(0xFF43A838
                  ),
                  child: Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Color(0xFF339C84),
                      ),
                    ),
                    const SizedBox(width: 12,),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Color(0xFF339C84),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlideLeftRoute(page: LoginPage()),);},
                      child: Text('Login here', style: TextStyle(color: Colors.blue, fontSize: 14.0, fontWeight: FontWeight.w400),),
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