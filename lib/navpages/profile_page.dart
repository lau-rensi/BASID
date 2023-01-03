import 'package:basid_2022/widgets/AppLargeText.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  
  int activeIndex = 0;
  List<String> items = ['Male', 'Female'];
  String? selectedItem = 'Male';
  final myController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  
  var sessionManager = SessionManager();

  @override
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _asyncMethod();
    });
          
  }

  _asyncMethod() async {
    firstNameController.text = await sessionManager.get('first_name');
    lastNameController.text = await sessionManager.get('last_name');
    var age = await sessionManager.get('age');
    ageController.text = age.toString();
    emailController.text = await sessionManager.get('email');
    var newSelectedItem = await sessionManager.get('gender');
    setState(() {
      selectedItem = newSelectedItem;
    });
  }




  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF339C84),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 80,),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/register.png'),
                ),
                SizedBox(height: 20,),
                AppLargeText(text: "Edit Profile"),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: firstNameController,
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
                      controller: lastNameController,
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
                //mobile number
                SizedBox(height: 20,),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: (){
                          print("successfully cancelled!");
                        },
                        height: 45,
                        color: Colors.redAccent,
                        child: Text("Cancel", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      SizedBox(width: 20),
                      MaterialButton(
                        onPressed: (){
                          print("successfully saved!");
                        },
                        height: 45,
                        color: Color(0xFF43A838
                        ),
                        child: Text("Save", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}