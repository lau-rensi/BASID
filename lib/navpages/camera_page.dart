import 'dart:io';
import 'package:basid_2022/pages/type_waste.dart';
import 'package:basid_2022/widgets/AppLargeText.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}
class _CameraPageState extends State<CameraPage> {
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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }
  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address = '${place.locality}, ${place.street}, ${place.country}';
    setState(()  {
    });
  }
  //=====================================================================
  //Image picker
  //====================================================================
  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if(image == null) return;
    final imageTemporary = File(image.path);
    setState((){
      this._image = imageTemporary;
    });
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
                        child: AppLargeText(text: 'COORDINATE POINTS', size: 12,)),
                    Expanded(
                      flex: 1,
                        child: AppLargeText(text: 'ADDRESS', size: 12,)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 170,
                      height: 50,
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
                              fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),),
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 50,
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Color(0xFF339C84), width: 1.0),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(' $address',
                          style: GoogleFonts.robotoSerif(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                ElevatedButton(onPressed: () async{
                  getImage(ImageSource.camera);
                  Position position = await _getGeoLocationPosition();
                  location ='Lat: ${position.latitude} \nLong: ${position.longitude}';
                  GetAddressFromLatLong(position);
                }, child: Text('Take A Photo', style: GoogleFonts.robotoSerif(fontSize: 18),),
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
                                style: GoogleFonts.robotoSerif(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: (){
                                print("Image ${_image},"
                                    "\n"
                                    "Address ${address},"
                                    "\n"
                                    "Selected Waste:",); //walay selected waste na data
                              },
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
        style: GoogleFonts.robotoSerif(
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
