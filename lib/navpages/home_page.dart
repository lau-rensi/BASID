import 'package:basid_2022/animations/slide_animation.dart';
import 'package:basid_2022/pages/about_basid.dart';
import 'package:basid_2022/widgets/AppLargeText.dart';
import 'package:basid_2022/widgets/AppSmallText.dart';
import 'package:flutter/material.dart';


import 'package:flutter_session_manager/flutter_session_manager.dart';

//kulang ani kay informations, like the details
//logo sa upper right, wala pa. Pause muna kay nag proceed pa sa profile page



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  var sessionManager = SessionManager();

  
  var images ={
    "Garbage.jpg":"Garbage",
    "ashes_residues.jpg":"Ashes & Residues",
    "logo-basid-2.png":"Combustible &\nNon-combustible",
    "bulky_waste.jpg":"Bulky Wastes",
    "ustplogo.png":"Street Wastes",
    "logo.png":"Dead Animals",
    "register.png":"Construction &\nDemolition Wastes",
    "clenrologo.png":"Hazardous Wastes",
    "action.png":"Sewage Wastes",
  };
  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    var message = '';
    var imageName = '';
    if (hour < 12){
      message = 'Good Morning';
      imageName = 'morning.jpg';
    } else if(hour > 12){
      message = 'Good Afternoon';
      imageName = 'afternoon.jpg';
    } else if((hour > 16)&&(hour < 20)){
      message = 'Good Evening';
      imageName = 'eve.jpg';
    }else{
      message = 'Good night';
      imageName = 'night.jpg';
    }
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset("assets/images/$imageName", height: 95,width: double.infinity,fit: BoxFit.cover, color: Colors.grey.withOpacity(0.9), colorBlendMode: BlendMode.modulate,),
              Positioned(
                bottom: 12,
                left: 10,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(message,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28, color: Colors.white,
                ),
              )
                ))],
          ),
          /*Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child:
            /*Column(
              children: [
                Text(message,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF339C84)),),
                Container(child: ,
                height: 13,),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image:AssetImage(
                      "assets/images/logo-basid-2.png"
                    ),
                    ),
                  ),
                )

              ],
            ),*/
          ),*/
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child:
            AppLargeText(text: "Discover"),
          ),
          SizedBox(height: 10),
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left:20, right: 0),
                controller: _tabController,
                labelColor: Color(0xFF339C84),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(color: Color(0xFF339C84), radius: 3),
                tabs: [
                  Tab(text: "About BASID"),
                  Tab(text: "History of Reports"),
                  Tab(text: "Status of Reports")
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 250,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount:1,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      GestureDetector(
                        onTap: ()async{
                          
                          dynamic id = await SessionManager().get("test");

                          print(id);
                          
                          Navigator.push(
                              context,
                          SlideRightRoute(page: AboutBasid()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 20, top: 10,left: 20),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                    image: AssetImage(
                    "assets/images/aboutbasid.jpg"
                    ),
                    fit: BoxFit.cover,
                    )
                    )
                    ),
                      );
                  },
                ),
                Text("hello"),
                Text("hey"),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                AppLargeText(text: "Different Types of Solid Waste", size: 22)
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: AppSmallText(
                text: "These are the types of solid wastes which are characterized on the basis of what it contains",
              size: 14,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index){
              return Container(
                margin: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                //margin: const EdgeInsets.only(right: 50),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                    image: AssetImage(
                    "assets/images/"+images.keys.elementAt(index)
                    ),
                    fit: BoxFit.cover,
                    )
                    )
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: AppSmallText(
                        text: images.values.elementAt(index),
                        color: Color(0xFF339C84),

                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color, radius: radius);
  }
  
}

class _CirclePainter extends BoxPainter{
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias=true;
    final Offset circleOffset = Offset(configuration.size!.width/2 -radius/2, configuration.size!.height-radius);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }
  
}

