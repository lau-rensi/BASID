import 'dart:convert';
import 'dart:io';
import 'package:basid_2022/pages/type_waste.dart';
import 'package:basid_2022/widgets/AppLargeText.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';


import 'package:requests/requests.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/navpages/navbar.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}
class _CameraPageState extends State<CameraPage> {

  var sessionManager = SessionManager();

  dynamic _long, _lat, _addr;

  @override
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _asyncMethod();
    });
          
  }

  var firstName, lastName, age, email,gender ,userID;

  _asyncMethod() async {
    firstName = await sessionManager.get('first_name');
    lastName = await sessionManager.get('last_name');
    var ageS = await sessionManager.get('age');
    age = ageS.toString();
    email = await sessionManager.get('email');
    gender = await sessionManager.get('gender');
    userID = await sessionManager.get('userID');
  }

  
  // final baseUrl = "http://10.10.50.14";
  final baseUrl = "http://192.168.1.3";


  var images ={
    "Garbage.jpg":"Garbage",
    "login1png.png":"Ashes & Residues",
    "logo-basid-2.png":"Combustible & non-combustible",
    "pictureit.png":"Bulky Wastes"
  };
  //list of Waste
  //====================================================================

  List<WasteType> waste = [
    WasteType("Garbage", "This type of waste is a garbage...", false),
    WasteType("Ashes & Residues", "This type of waste is a garbage", false),
    WasteType("Combustuble & Non-combustible", "This type of waste is a garbage", false),
    WasteType("Bulky Waste", "This type of waste is a garbage", false),
  ];
  List<WasteType> selectedWaste = [];
  //end
  //====================================================================
  //geolocation
  //====================================================================
  String location ='';
  String address = '';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address = '${place.street}\n ${place.locality}, ${place.subAdministrativeArea} \n${place.country}';
    _addr = address;
    setState(()  {
    });
  }
  //=====================================================================
  //Image picker
  //====================================================================
  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) {
       Navigator.push(
        context,
        SlideRightRoute(page: NavBar()));
    }
    final imageTemporary = File(image!.path);

    print(imageTemporary.path);
    setState((){
      this._image = imageTemporary;
    });
// var response = await Requests.post("$baseUrl/basid/mobile_login", body: payload,
                                    // bodyEncoding: RequestBodyEncoding.FormURLEncoded);

    // final uri = Uri.parse("$baseUrl/basid_image_uploader/image_upload.php");
    final uri = Uri.parse("$baseUrl/basid/mobile_upload");

    print(uri);

    var request = http.MultipartRequest('POST',uri);
    request.fields['name'] = 'test_jay_image';
    var pic = await http.MultipartFile.fromPath("image", imageTemporary.path);
    
    request.files.add(pic);
    print(request);
    var response = await request.send();

    print(response);

    if (response.statusCode == 200) {
      print(response.stream.bytesToString());
      print('Image Uploaded');
    } else {
      print(response.stream.bytesToString());
      print('Image not Uploaded!');
    }



  }
  /*Cant store image nor image path provider*/
  //===================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.only(left: 20.0,right: 20.0),
                  width: 500,
                  height: 200,
                  child: _image != null ? Image.file(_image!,width: 400,height: 200, fit: BoxFit.contain) : Image.asset('assets/images/addphoto.png')
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                        child: AppLargeText(text: 'COORDINATE POINTS', size: 14,)),
                    Expanded(
                      flex: 1,
                        child: AppLargeText(text: 'ADDRESS', size: 14,)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 170,
                      height: 55,
                      margin: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Color(0xFF339C84), width: 1.0),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(location,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 55,
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Color(0xFF339C84), width: 1.0),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(' $address',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                ElevatedButton(onPressed: () async{
                  print("Taking a photo");
                  getImage(ImageSource.camera);
                  Position position = await _getGeoLocationPosition();
                  location ='Lat: ${position.latitude} \nLong: ${position.longitude}';
                  _long = position.longitude;
                  _lat = position.latitude;
                  GetAddressFromLatLong(position);
                }, child: Text('Take A Photo', style: TextStyle(fontSize: 18),),
                  style: ElevatedButton.styleFrom(minimumSize: Size(290, 40,),
                  primary: Color(0xFF43A838),
                      onPrimary: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                AppLargeText(text: "Select Type of Waste"),
                SizedBox(height: 10),
                Container(
                  height: 0,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey)
                  )
                ),
                Container(
                  height: 600,
                  child: Column(
                      children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 350,
                        width: 500,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: waste.length,
                          itemBuilder: (BuildContext context, int index) {
                            // return item

                            return WasteItem(
                              waste[index].name,
                              waste[index].details,
                              waste[index].isSelected,
                              index
                            );
                          }, separatorBuilder: (BuildContext context, int index)=> const Divider(
                        color: Color(0xFF339C84),
                        height: 5,
                        thickness: 3,
                      )),

                      )],
                  ),
                        selectedWaste.length > 0 ? Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                          child: SizedBox(
                            width: double.infinity,
                            child: MaterialButton(
                              color: Color(0xFF43A838),
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () async {
                                var combinedWaste = '';
                                for (var i = 0 ; i != waste.length ; i++) {
                                  if (waste[i].isSelected){
                                    combinedWaste +=  '${waste[i].name},';
                                  }
                                }
                                combinedWaste = combinedWaste.substring(0, combinedWaste.length - 1);
                                print('Combined waste = $combinedWaste');
                                print('image uploadd = ${_image!.path.split('/')[_image!.path.split('/').length - 1]} ');
                                print('userID = $userID');
                                print('long = $_long');
                                print('lat = $_lat');
                                print('addr = $_addr');


                                dynamic payload = {
                                  "waste_type" : combinedWaste,
                                  "image_uploaded" : _image!.path.split('/')[_image!.path.split('/').length - 1],
                                  "reporter_id" : userID,
                                  "longitude" : _long,
                                  "latitude" : _lat,
                                  "addr" : _addr
                                };

                                print(payload);
                                var response = await Requests.post("$baseUrl/basid/mobile_report", body: payload,
                                    bodyEncoding: RequestBodyEncoding.FormURLEncoded);
                                if (response.statusCode == 200) {
                                  dynamic result = jsonDecode(response.json());
                                  print(result['message']);
                                }
                              }
                              
                              ,
                            ),
                          ),
                        ):Container(),
                ]
                  ),
                )
              ],
            ),
          ),
        ),
    );

  }
  Widget WasteItem(
      String name, String details, bool isSelected, int index) {

    return ListTile(
      leading: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/"+images.keys.elementAt(index),
                ),
              fit: BoxFit.cover,
            ),
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(details),
      trailing: isSelected
          ? Icon(
        Icons.check_circle,
        color: Colors.green[700],
      )
          : Icon(
        Icons.check_circle_outline,
        color: Colors.grey,
      ),
      onTap: () {
        setState(() {
          waste[index].isSelected = !waste[index].isSelected;
          if (waste[index].isSelected == true) {
            selectedWaste.add(WasteType(name, details, true));
          } else if (waste[index].isSelected == false) {
            selectedWaste
                .removeWhere((element) => element.name == waste[index].name);
          }
        });
      },
    );
  }
}
