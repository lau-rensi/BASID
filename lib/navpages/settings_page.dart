import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/profile_page.dart';
import 'package:basid_2022/screens/app_permissions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Color(0xFF339C84),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
           Container(
             height: 30,
             width: 200,
             alignment: Alignment.center,
             child: Text('(name of user)', style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w500),),
           ),
            SizedBox(height: 20,),
            SettingsGroup(
                title: 'GENERAL',
                children: <Widget>[
                  editProfile(context),
                  buildLogout(context),
                ]),
            SizedBox(height: 20),
            SettingsGroup(
                title: 'PERMISSIONS',
                children: <Widget>[
                  appPermission(context)
                ]),
            SizedBox(height: 20),
            SettingsGroup(
                title: 'DANGER ZONE',
                children: <Widget>[
                  deleteAccount(context),
                ])
          ],
        ),
      ),
    );
  }


  Widget buildLogout (BuildContext context) => SimpleSettingsTile(
    leading: Icon(Icons.logout, color: Colors.grey),
    title: 'Logout',
    subtitle: '',
    onTap: (){/*logout*/},
  );
  Widget deleteAccount (BuildContext context) => SimpleSettingsTile(
    leading: Icon(Icons.delete, color: Colors.red),
    title: 'Delete Account',
    subtitle: '',
    onTap: (){/*Delete Account*/},
  );
  Widget editProfile (BuildContext context) => SimpleSettingsTile(
    leading: Icon(Icons.person, color: Colors.blueAccent,),
    title: 'Edit Profile',
    subtitle: '',
    onTap: (){
      Navigator.push(
          context,
          SlideRightRoute(page: ProfilePage()));
    },
  );
  Widget appPermission(BuildContext context) => SimpleSettingsTile(
    title: 'App Permissions',
    subtitle: 'Manage permissions on location and camera',
    onTap: (){
      Navigator.push(
          context,
          SlideRightRoute(page: AppPermission()));
    },
  );
}


