import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:html/dom.dart';
import 'package:weather/weather.dart';
import 'Netcloud.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:http/http.dart' as http;
import 'Shopping List.dart';
import 'coolslides.dart';
import 'package:badges/badges.dart';
import 'judenote.dart';
import 'chatPage.dart';
import 'main.dart';
import 'cameras.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:wifi_configuration/wifi_configuration.dart';
//8bdc1a8531d47aa962c08195cda5eba4-weather Api
//http://api.openweathermap.org/data/2.5/weather?q=Nairobi&appid=8bdc1a8531d47aa962c08195cda5eba4

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}

class Dashy extends StatefulWidget {
  @override
  _DashyState createState() => _DashyState();
}

class _DashyState extends State<Dashy> {
  double temp;
  bool btn = false;
  bool btn2 = false;
  bool btn3 = false;
  bool btn4 = false;
  bool btn5 = false;
  bool btn6 = false;
  bool btn7 = false;
  bool btn8 = false;
  String stateL;
  String tokenX;
  String cam;
  String camP;
  bool eka;
  bool saul = false;
  int newL;
  String stateA;
  String stateM;
  String stateN;
  int stateD;
  String stateS;
  String stateTd;
  int Nshop;
  String xl;
  var description;
  var currently;
  var humidity;
  var windspeed;
  void getConn() async {
    var AvailableWifi = await WifiConfiguration.getWifiList();
    print(AvailableWifi.toString());
    bool isConnectedL = await WifiConfiguration.isConnectedToWifi("JudeX");
    String mylamp = 'JudeX';

    setState(() {
      aw = AvailableWifi.contains(mylamp);
    });

    ;
    print(isConnectedL);
  }

  Future getWeather() async {
    http.Response response = await http.get('http://192.168.100.20:5000/sysL');
    http.Response token =
        await http.get('http://192.168.100.20:5000/token_auth');

    http.Response responsev = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=Nairobi&units=metric&appid=8bdc1a8531d47aa962c08195cda5eba4');
    var result5 = jsonDecode(response.body);
    setState(() {
      this.tokenX = result5['stateToken'].toString();
    });
    setState(() {
      this.stateL = result5['stateL'].toString();
    });
    setState(() {
      this.cam = result5['cam'].toString();
    });
    setState(() {
      this.camP = result5['person'].toString();
    });
    setState(() async {
      this.newL = await result5['newL'];
    });
    setState(() {
      this.Nshop = result5['Nshop'];
    });
    setState(() {
      this.stateA = result5.toString();
    });
    setState(() {
      this.stateM = result5.toString();
    });
    setState(() {
      this.stateN = result5.toString();
    });
    setState(() {
      this.stateD = result5['stateD'];
    });
    setState(() {
      this.stateS = result5['stateS'].toString();
    });
    setState(() {
      this.stateTd = result5.toString();
    });
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  String _platformVersion = 'Unknown';
  String JudeX = '';

  final String urlToStreamVideo = 'http://192.168.100.20:5000/video_feed';
  final VlcPlayerController controller = VlcPlayerController();
  final int playerWidth = 600;
  final int playerHeight = 250;
  bool status = false;
  bool aw;
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    this.getWeather();
    getConn();
  }

  Widget build(BuildContext context) {
    final myImageAndCaptionX = [
      ["images/keja.png", "Am Home"],
      ["images/exit.png", "am leaving"],
      ["images/moon.png", "Goodnight"],
      ["images/sun.png", "Goodmorning"],
      ["images/sentry_mode-removebg-preview.png", "OverWatch mode"],
      ["images/book.png", "study mode"],
    ];
    final myImageAndCaption = [
      ["images/tvicon.png", "Tv"],
      ["images/cup_coffee.png", "dispenser"],
      ["images/lightbulb2-removebg-preview.png", "lights "],
      ["images/curtainopener.png", "Curtains"]
    ];
    final myImageAndCaption2 = [
      ["images/lightbulb2-removebg-preview.png", "lights "],
      ["images/curtainopener.png", "Curtains"]
    ];
    final myImageAndCaption3 = [
      ["images/cup_coffee.png", "dispenser"],
      ["images/lightbulb2-removebg-preview.png", "lights "],
    ];
    Future ronox() {
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
                backgroundColor: Colors.transparent,
                content: Container(
                    height: 30,
                    width: 60,
                    color: Colors.transparent,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Positioned(
                          top: -255,
                          right: -50,
                          child: Chip(
                            avatar: CircleAvatar(
                                // radius: 27,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.all_out,
                                  color: Colors.orange,
                                )),
                            label: Text(
                              "Lights ON",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )));
          });
    }

    Future rono2() {
      showDialog(
          context: context,
          builder: (context) {
            /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
            return AlertDialog(
                content: Container(
                    width: 350.0,
                    height: 330.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white38,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(60.0)),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 33,
                          backgroundImage: AssetImage(
                            'images/me2X.jpeg',
                          ),
                        ),

                        Positioned(
                          top: 75,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              'Rono',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 10,
                          child: Container(
                            //color: Colors.green,
                            height: 40,
                            width: 350,
                            child: Text(
                              "Members",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: 20,
                          child: InkWell(
                            child: Icon(
                              Icons.person_add,
                              size: 32,
                            ),
                            onTap: () {
                              //add func
                            },
                          ),
                        ),
                        Positioned(
                            top: 140,
                            left: 5,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 30,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [Text("Rono (That's You)")],
                                      ))
                                ])),

                        // ),
                      ],
                    )));
          });
    }

    Future rono3() {
      showDialog(
          context: context,
          builder: (context) {
            /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
            return AlertDialog(
                content: Container(
                    width: 350.0,
                    height: 330.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white38,
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(60.0)),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          top: 75,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Text(
                              "random notification",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          left: 10,
                          child: Container(
                            //color: Colors.green,
                            height: 40,
                            width: 350,
                            child: Text(
                              "Members",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 100,
                          right: 20,
                          child: InkWell(
                            child: Icon(
                              Icons.person_add,
                              size: 32,
                            ),
                            onTap: () {
                              //add func
                            },
                          ),
                        ),
                        Positioned(
                            top: 140,
                            left: 5,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 30,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [Text("Rono (That's You)")],
                                      ))
                                ])),

                        // ),
                      ],
                    )));
          });
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                            bottom: 10,
                            right: 15,
                            child: Text(
                              "Jude Dashboard",
                              style: TextStyle(
                                color: Color.fromRGBO(38, 38, 48, 0.4),
                              ),
                            )),
                        Positioned(
                            bottom: 6,
                            right: 7,
                            child: Text(
                              ".",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 40,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
              actions: [
                InkWell(
                  child: Chip(
                    padding: EdgeInsets.all(5.0),
                    avatar: CircleAvatar(
                      // radius: 27,
                      //backgroundColor: Colors.purple,
                      backgroundImage: AssetImage('images/me2X.jpeg'),
                    ),
                    label: Text(
                      "You",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    backgroundColor: Colors.grey[50],
                  ),
                  onTap: () {
                    rono2();
                  },
                ),
                SizedBox(
                  width: 5.0,
                )
              ],
            ),
            body: Column(
              //shrinkWrap: true,
                //padding: EdgeInsets.all(15.0),
                children: [
              saul == true
                  ? Container(
                      padding: EdgeInsets.all(5.0),
                      height: 220,
                      width: 500,
                      child: Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                )
                              ],
                            ),
                            child: Column(children: [
                              Expanded(
                                child: Container(
                                  height: 250,
                                  width: 900.0,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Positioned(
                                        //bottom: 10,

                                        child: NotificationListener<
                                            OverscrollIndicatorNotification>(
                                          onNotification:
                                              (OverscrollIndicatorNotification
                                                  overscroll) {
                                            overscroll.disallowGlow();
                                            return;
                                          },
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            children: [
                                              ...myImageAndCaptionX.map(
                                                (i) => Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      child: Chip(
       
                                                        backgroundColor:
                                                            Colors.white,
                                                        label: Text(
                                                          i.last,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        //print("hey chx");
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              Future.delayed(
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(true);
                                                              });
                                                              return AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              60.0))),
                                                                  content:
                                                                      Container(
                                                                          width:
                                                                              260.0,
                                                                          height:
                                                                              230.0,
                                                                          decoration:
                                                                              new BoxDecoration(
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            color:
                                                                                Colors.white38,
                                                                            borderRadius:
                                                                                new BorderRadius.all(new Radius.circular(60.0)),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: <Widget>[
                                                                              Image.asset(
                                                                                i.first,
                                                                                height: 100,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                              Positioned(
                                                                                top: 160,
                                                                                child: Text(
                                                                                  i.last + "\n" + "Mode" + "\n" + "Activated",
                                                                                  style: TextStyle(
                                                                                    fontSize: 24,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )));
                                                            });
                                                      },
                                                    )
                                                    /* onTap: () async {
                                      //roro(["hello" "there"]);
                                      print(["hello", "there"]);
                                       Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                              builder: (context) => coolP()),
                                      );
                                      var Data = await GetData(
                                      'http://192.168.100.20:5000/api?Query=' + i.last,
                                      );*/

                                                    ,
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Positioned(child:edBox(,height: 25,),
                                      Positioned(
                                        top: 150,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      child: InkWell(
                                                        child: CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.blue[50],
                                                          child: Icon(
                                                            Icons
                                                                .add_shopping_cart_rounded,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ShoppingList(),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 5,
                                                      child: stateS == "r"
                                                          ? Container(
                                                              height: 12,
                                                              width: 12,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .white,
                                                                    spreadRadius:
                                                                        5,
                                                                    blurRadius:
                                                                        0,
                                                                  )
                                                                ],
                                                              ),
                                                              /* child: Center(
                                                                      child: Text(
                                                                        '$stateS',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                      ),
                                                                    ),*/
                                                            )
                                                          : Container(),
                                                    ),
                                                    Positioned(
                                                      bottom: -20,
                                                      left: 2,
                                                      child:
                                                          Text("Shoppinglist"),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      child: InkWell(
                                                        child: CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.cyan[50],
                                                          child: Icon(
                                                            Icons
                                                                .videocam_outlined,
                                                            color: Colors.cyan,
                                                            size: 29,
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ExampleVideo(),
                                                            ),
                                                          );
                                                          //print("hey world");
                                                        },
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 5,
                                                      child: stateS == "r"
                                                          ? Container(
                                                              height: 12,
                                                              width: 12,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .white,
                                                                    spreadRadius:
                                                                        0,
                                                                    blurRadius:
                                                                        0,
                                                                  )
                                                                ],
                                                              ),
                                                              /* child: Center(
                                                                      child: Text(
                                                                        '$stateS',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white),
                                                                      ),
                                                                    ),*/
                                                            )
                                                          : Container(),
                                                    ),
                                                    Positioned(
                                                      bottom: -20,
                                                      left: 6,
                                                      child:
                                                          Text("Surveillance"),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      child: InkWell(
                                                        child: CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors
                                                                  .grey[900],
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          /*  WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi(
        "JudeX", "123456789", "com.example.JudeAssistant");
    print("is Connected : ${connectionStatus}");*/
                                                          getConn();

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                    title: Text(
                                                                      "Scanning " +
                                                                          '\n' +
                                                                          "for new Jude devices...",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            24,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(20.0))),
                                                                    content: Container(
                                                                        width: 260.0,
                                                                        height: 230.0,
                                                                        decoration: new BoxDecoration(
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          color:
                                                                              Colors.white38,
                                                                          borderRadius:
                                                                              new BorderRadius.all(new Radius.circular(60.0)),
                                                                        ),
                                                                        child: Stack(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          children: <
                                                                              Widget>[
                                                                            aw != false
                                                                                ? InkWell(
                                                                                    child: CircleAvatar(
                                                                                        radius: 32,
                                                                                        backgroundColor: Colors.grey[50],
                                                                                        child: Icon(
                                                                                          Icons.lightbulb_outline,
                                                                                          size: 32,
                                                                                          color: Colors.grey[900],
                                                                                        )),
                                                                                    onTap: () async {
                                                                                      WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi("JudeX", "123456789", "com.example.JudeAssistant");
                                                                                      switch (connectionStatus) {
                                                                                        case WifiConnectionStatus.connected:
                                                                                          print("connected");
                                                                                          void send() async {
                                                                                            var form = <String, String>{
                                                                                              'user': 'Barko',
                                                                                              'pass': 'Kibomwek@',
                                                                                            };

                                                                                            var res = await http.post(
                                                                                              'http://192.168.4.1',
                                                                                              body: form,
                                                                                            );
                                                                                            print(res.statusCode);
                                                                                            print(res.body);
                                                                                          }
                                                                                          send();
                                                                                          break;

                                                                                        case WifiConnectionStatus.alreadyConnected:
                                                                                          print("alreadyConnected");
                                                                                          break;

                                                                                        case WifiConnectionStatus.notConnected:
                                                                                          print("notConnected");
                                                                                          break;

                                                                                        case WifiConnectionStatus.platformNotSupported:
                                                                                          print("platformNotSupported");
                                                                                          break;

                                                                                        case WifiConnectionStatus.profileAlreadyInstalled:
                                                                                          print("profileAlreadyInstalled");
                                                                                          break;

                                                                                        case WifiConnectionStatus.locationNotAllowed:
                                                                                          print("locationNotAllowed");
                                                                                          break;
                                                                                      }
                                                                                      ;

                                                                                      print("Tapping on device");
                                                                                    },
                                                                                  )
                                                                                : CircularProgressIndicator(),
                                                                            aw != false
                                                                                ? Positioned(
                                                                                    top: 150,
                                                                                    child: Text("found  lighting device"),
                                                                                  )
                                                                                : Container(),
                                                                          ],
                                                                        )));
                                                              });
                                                          /*
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShoppingList(),
                                                ),
                                              );*/
                                                        },
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: -20,
                                                      right: 25,
                                                      child: Text("add"),
                                                    ),
                                                  ]),
                                            ]),
                                      ),

                                      //here
                                      Positioned(
                                        top: 150,
                                        right: 5,
                                        child: eka == true
                                            ? Container(
                                                width: 135,
                                                height: 200,
                                                color: Colors.transparent,
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    eka == true
                                                        ? VlcPlayer(
                                                            defaultWidth:
                                                                playerWidth,
                                                            defaultHeight:
                                                                playerHeight,
                                                            url:
                                                                urlToStreamVideo,
                                                            controller:
                                                                controller,
                                                            placeholder: Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                          )
                                                        : Container(),
                                                    Positioned(
                                                        top: 1,
                                                        right: 1,
                                                        child: IconButton(
                                                          icon:
                                                              Icon(Icons.close),
                                                          onPressed: () {
                                                            setState(() {
                                                              eka = false;
                                                            });
                                                          },
                                                        )),
                                                  ],
                                                ),
                                              )
                                            : Container(),
                                      ),
                                      Positioned(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                child: CircleAvatar(
                                                  radius: 32,
                                                  backgroundColor:
                                                      Colors.grey[100],
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.grey[100],
                                                          child: Icon(
                                                            Icons
                                                                .lightbulb_outline,
                                                            size: 32,
                                                            color: stateL ==
                                                                    "on"
                                                                ? Colors
                                                                    .yellow[600]
                                                                : Colors
                                                                    .grey[900],
                                                          )),
                                                      Positioned(
                                                        right: 2,
                                                        child: stateL == "on"
                                                            ? Container(
                                                                height: 12,
                                                                width: 12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20.0),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20.0),
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .white,
                                                                      spreadRadius:
                                                                          5,
                                                                      blurRadius:
                                                                          0,
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(),
                                                      ),
                                                      Positioned(
                                                        bottom: -20,
                                                        left: 6,
                                                        child: Text(
                                                          "Lighting",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Lnote(),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: 7.5,
                                              ),
                                              InkWell(
                                                  child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.purple[50],
                                                          child: Icon(
                                                            Icons.tv,
                                                            size: 29,
                                                            color:
                                                                Colors.purple,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          right: 2,
                                                          child: stateL ==
                                                                  "firirinda"
                                                              ? Container(
                                                                  height: 12,
                                                                  width: 12,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              20.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              20.0),
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              20.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              20.0),
                                                                    ),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .white,
                                                                        spreadRadius:
                                                                            5,
                                                                        blurRadius:
                                                                            0,
                                                                      )
                                                                    ],
                                                                  ),
                                                                )
                                                              : Container(),
                                                        ),
                                                        Positioned(
                                                          bottom: -20,
                                                          left: 6,
                                                          child: Text(
                                                              "Appliances"),
                                                        ),
                                                      ]),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Anote(),
                                                      ),
                                                    );
                                                  }),
                                              SizedBox(
                                                width: 7.5,
                                              ),
                                              InkWell(
                                                  child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 32,
                                                            backgroundColor:
                                                                Colors.cyan[50],
                                                            child: Icon(
                                                              Icons.music_note,
                                                              color:
                                                                  Colors.cyan,
                                                            )),
                                                        Positioned(
                                                          bottom: -20,
                                                          right: 16,
                                                          child: Text("Music"),
                                                        ),
                                                      ]),
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Mnote(),
                                                      ),
                                                    );
                                                  }),
                                              SizedBox(
                                                width: 7.5,
                                              ),
                                              InkWell(
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 32,
                                                        backgroundColor:
                                                            Colors.red[50],
                                                        child: Icon(
                                                          Icons
                                                              .chat_bubble_outline,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 2,
                                                        child:
                                                            stateL ==
                                                                    "firirinda"
                                                                ? Container(
                                                                    height: 12,
                                                                    width: 12,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .red,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(20.0),
                                                                        topRight:
                                                                            Radius.circular(20.0),
                                                                        bottomLeft:
                                                                            Radius.circular(20.0),
                                                                        bottomRight:
                                                                            Radius.circular(20.0),
                                                                      ),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.white,
                                                                          spreadRadius:
                                                                              5,
                                                                          blurRadius:
                                                                              0,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                : Container(),
                                                      ),
                                                      Positioned(
                                                        bottom: -20,
                                                        child: Text(
                                                            "Notifications"),
                                                      ),
                                                    ]),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Nnote(),
                                                    ),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                width: 7.5,
                                              ),
                                              InkWell(
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.grey[100],
                                                          child: Icon(
                                                            Icons
                                                                .av_timer_rounded,
                                                            color: Colors
                                                                .grey[900],
                                                          )),
                                                      Positioned(
                                                        right: 2,
                                                        bottom: 10,
                                                        child: stateS == "0"
                                                            ? Container(
                                                                height: 12,
                                                                width: 12,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20.0),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20.0),
                                                                  ),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors
                                                                          .white,
                                                                      spreadRadius:
                                                                          0,
                                                                      blurRadius:
                                                                          0,
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(),
                                                      ),
                                                      Positioned(
                                                        bottom: -20,
                                                        right: 16,
                                                        child: Text("timed"),
                                                      ),
                                                    ]),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Dnote(),
                                                    ),
                                                  );
                                                  //print("hey world");
                                                },
                                              ),
                                            ]),
                                      ),

                                      /*InkWell(
                                                        child: Chip(
                                                          avatar: CircleAvatar(
                                                            // radius: 27,
                                                            //backgroundColor: Colors.purple,
                                                            child: Icon(Icons.add),
                                                          ),
                                                          label: Text(
                                                            "lights on",
                                                            style: TextStyle(
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () {

                                                        },
                                                      ),*/
                                    ],
                                  ),
                                ),
                              ),
                            ])),
                      ))
                  : Container(
                      padding: EdgeInsets.all(10.0),
                      child: Expanded(
                          child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(
                                      Icons.light,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Colors.grey[200],
                                  ),
                                  onTap: () {
                                   
                                    print("computer rganization");
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  //left: 6,
                                  child: Text("   Lighting."+'\n'+""),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.coffee_maker_rounded ,
                                        color: Colors.purple),
                                    backgroundColor: Colors.purple[50],
                                  ),
                                  onTap: () {
                                     
                                    print("Statistics");
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  //left: 6,
                                  child: Text(
                                      "Appliances." +'\n'+""),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(
                                      Icons.camera_outdoor,
                                      color: Colors.cyan,
                                    ),
                                    backgroundColor: Colors.cyan[50],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ExampleVideo(),
                                                            ),
                                                          );
                                    //print("database");
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  left: -5,
                                  child: Text(
                                      "Surveillance."+'\n'+" "),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(
                                      Icons.apps,
                                      color: Colors.blueGrey,
                                    ),
                                    backgroundColor: Colors.blueGrey[50],
                                  ),
                                  onTap: () {
                                     
                                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => coolS(),
                        ),
                      );
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  //left: -2,
                                  child:
                                      Text("      Panel." +'\n' + " "),
                                ),
                              ],
                            ),
                          ],
                        ), //first row in the home page app
                        SizedBox(height: 45),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(
                                      Icons.mic,
                                      color: Colors.green,
                                    ),
                                    backgroundColor: Colors.green[50],
                                  ),
                                  onTap: () {
                                   
                                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>SpeechScreen(),
                        ),
                      );
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  //left: 6,
                                  child: Text("    Voice"+'\n'+"Assistant."),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.message_outlined,
                                        color: Colors.blue),
                                    backgroundColor: Colors.blue[50],
                                  ),
                                  onTap: () {
                                     
                        
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  //left: 6,
                                  child: Text(
                                      "Chat" +'\n'+" Assistant. ",textAlign: TextAlign.center,)
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.grey,
                                    ),
                                    backgroundColor: Colors.blueGrey[50],
                                  ),
                                  onTap: () {
                                    
                                    print("database");
                                  },
                                ),
                                Positioned(
                                  bottom: -35,
                                  left: -5,
                                  child: Text(
                                      "    Settings."+'\n'+" "),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Container(
                                                      child: InkWell(
                                                        child: CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.green[100],
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors
                                                                  .green,
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          /*  WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi(
        "JudeX", "123456789", "com.example.JudeAssistant");
    print("is Connected : ${connectionStatus}");*/
                                                          getConn();

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                    title: Text(
                                                                      "Scanning " +
                                                                          '\n' +
                                                                          "for new Jude devices...",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            24,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(20.0))),
                                                                    content: Container(
                                                                        width: 260.0,
                                                                        height: 230.0,
                                                                        decoration: new BoxDecoration(
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          color:
                                                                              Colors.white38,
                                                                          borderRadius:
                                                                              new BorderRadius.all(new Radius.circular(60.0)),
                                                                        ),
                                                                        child: Stack(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          children: <
                                                                              Widget>[
                                                                            aw != false
                                                                                ? InkWell(
                                                                                    child: CircleAvatar(
                                                                                        radius: 32,
                                                                                        backgroundColor: Colors.grey[50],
                                                                                        child: Icon(
                                                                                          Icons.lightbulb_outline,
                                                                                          size: 32,
                                                                                          color: Colors.grey[900],
                                                                                        )),
                                                                                    onTap: () async {
                                                                                      WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi("JudeX", "123456789", "com.example.JudeAssistant");
                                                                                      switch (connectionStatus) {
                                                                                        case WifiConnectionStatus.connected:
                                                                                          print("connected");
                                                                                          void send() async {
                                                                                            var form = <String, String>{
                                                                                              'user': 'Barko',
                                                                                              'pass': 'Kibomwek@',
                                                                                            };

                                                                                            var res = await http.post(
                                                                                              'http://192.168.4.1',
                                                                                              body: form,
                                                                                            );
                                                                                            print(res.statusCode);
                                                                                            print(res.body);
                                                                                          }
                                                                                          send();
                                                                                          break;

                                                                                        case WifiConnectionStatus.alreadyConnected:
                                                                                          print("alreadyConnected");
                                                                                          break;

                                                                                        case WifiConnectionStatus.notConnected:
                                                                                          print("notConnected");
                                                                                          break;

                                                                                        case WifiConnectionStatus.platformNotSupported:
                                                                                          print("platformNotSupported");
                                                                                          break;

                                                                                        case WifiConnectionStatus.profileAlreadyInstalled:
                                                                                          print("profileAlreadyInstalled");
                                                                                          break;

                                                                                        case WifiConnectionStatus.locationNotAllowed:
                                                                                          print("locationNotAllowed");
                                                                                          break;
                                                                                      }
                                                                                      ;

                                                                                      print("Tapping on device");
                                                                                    },
                                                                                  )
                                                                                : CircularProgressIndicator(),
                                                                            aw != false
                                                                                ? Positioned(
                                                                                    top: 150,
                                                                                    child: Text("found  lighting device"),
                                                                                  )
                                                                                : Container(),
                                                                          ],
                                                                        )));
                                                              });
                                                          /*
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShoppingList(),
                                                ),
                                              );*/
                                                        },
                                                      ),
                                                    ),
                            
                          ],
                        ),

                         //past the icon buttons
                        //heX
                        /*Container(
                                                      child: InkWell(
                                                        child: CircleAvatar(
                                                          radius: 32,
                                                          backgroundColor:
                                                              Colors.grey[300],
                                                          child: CircleAvatar(
                                                            radius: 30,
                                                            backgroundColor:
                                                                Colors.white,
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors
                                                                  .grey[900],
                                                            ),
                                                          ),
                                                        ),
                                                        onTap: () async {
                                                          /*  WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi(
        "JudeX", "123456789", "com.example.JudeAssistant");
    print("is Connected : ${connectionStatus}");*/
                                                          getConn();

                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return AlertDialog(
                                                                    title: Text(
                                                                      "Scanning " +
                                                                          '\n' +
                                                                          "for new Jude devices...",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            24,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(20.0))),
                                                                    content: Container(
                                                                        width: 260.0,
                                                                        height: 230.0,
                                                                        decoration: new BoxDecoration(
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                          color:
                                                                              Colors.white38,
                                                                          borderRadius:
                                                                              new BorderRadius.all(new Radius.circular(60.0)),
                                                                        ),
                                                                        child: Stack(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          children: <
                                                                              Widget>[
                                                                            aw != false
                                                                                ? InkWell(
                                                                                    child: CircleAvatar(
                                                                                        radius: 32,
                                                                                        backgroundColor: Colors.grey[50],
                                                                                        child: Icon(
                                                                                          Icons.lightbulb_outline,
                                                                                          size: 32,
                                                                                          color: Colors.grey[900],
                                                                                        )),
                                                                                    onTap: () async {
                                                                                      WifiConnectionStatus connectionStatus = await WifiConfiguration.connectToWifi("JudeX", "123456789", "com.example.JudeAssistant");
                                                                                      switch (connectionStatus) {
                                                                                        case WifiConnectionStatus.connected:
                                                                                          print("connected");
                                                                                          void send() async {
                                                                                            var form = <String, String>{
                                                                                              'user': 'Barko',
                                                                                              'pass': 'Kibomwek@',
                                                                                            };

                                                                                            var res = await http.post(
                                                                                              'http://192.168.4.1',
                                                                                              body: form,
                                                                                            );
                                                                                            print(res.statusCode);
                                                                                            print(res.body);
                                                                                          }
                                                                                          send();
                                                                                          break;

                                                                                        case WifiConnectionStatus.alreadyConnected:
                                                                                          print("alreadyConnected");
                                                                                          break;

                                                                                        case WifiConnectionStatus.notConnected:
                                                                                          print("notConnected");
                                                                                          break;

                                                                                        case WifiConnectionStatus.platformNotSupported:
                                                                                          print("platformNotSupported");
                                                                                          break;

                                                                                        case WifiConnectionStatus.profileAlreadyInstalled:
                                                                                          print("profileAlreadyInstalled");
                                                                                          break;

                                                                                        case WifiConnectionStatus.locationNotAllowed:
                                                                                          print("locationNotAllowed");
                                                                                          break;
                                                                                      }
                                                                                      ;

                                                                                      print("Tapping on device");
                                                                                    },
                                                                                  )
                                                                                : CircularProgressIndicator(),
                                                                            aw != false
                                                                                ? Positioned(
                                                                                    top: 150,
                                                                                    child: Text("found  lighting device"),
                                                                                  )
                                                                                : Container(),
                                                                          ],
                                                                        )));
                                                              });
                                                          /*
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ShoppingList(),
                                                ),
                                              );*/
                                                        },
                                                      ),
                                                    ),*/

                        
                        SizedBox(
                          height: 30,
                        ),
                      ]))),
              const SizedBox(width: 102),
              //Row(children: []),
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        //indicatorColor: Colors.transparent,

                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: Colors.transparent,
                        tabs: [
                          Container(),
                          Container(),
                          ],
                      ),
                    ),
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5)),
                      ),
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowGlow();
                          return;
                        },
                        child: RotatedBox(
                          quarterTurns: 45,
                          child: TabBarView(children: <Widget>[
                            
                            RotatedBox(
                              quarterTurns: -45,
                              child: Scaffold(
                                backgroundColor: Colors.white,
                                appBar: AppBar(
                                  centerTitle: true,
                                  backgroundColor: Colors.white,
                                  elevation: 0.0,
                                  title: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child:Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    children: [
                                      
                                       ...myImageAndCaptionX.map(
                                                (i) =>
 Row(children:[ SizedBox(width: 10,),InkWell( child:Chip(
   backgroundColor: Colors.white,
   //here carl
                                                    shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.green[100], width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
   label: Text(i.last)),onTap: (){showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              Future.delayed(
                                                                  Duration(
                                                                      seconds:
                                                                          1),
                                                                  () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(true);
                                                              });
                                                              return AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              60.0))),
                                                                  content:
                                                                      Container(
                                                                          width:
                                                                              260.0,
                                                                          height:
                                                                              230.0,
                                                                          decoration:
                                                                              new BoxDecoration(
                                                                            shape:
                                                                                BoxShape.rectangle,
                                                                            color:
                                                                                Colors.white38,
                                                                            borderRadius:
                                                                                new BorderRadius.all(new Radius.circular(60.0)),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            alignment:
                                                                                Alignment.center,
                                                                            children: <Widget>[
                                                                              Image.asset(
                                                                                i.first,
                                                                                height: 100,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                              Positioned(
                                                                                top: 160,
                                                                                child: Text(
                                                                                  i.last + "\n" + "Mode" + "\n" + "Activated",
                                                                                  style: TextStyle(
                                                                                    fontSize: 24,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )));
                                                            });})],),),

                                  ],)),
                                  /*actions: [
                                    saul == true
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                saul = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ))
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                saul = true;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.arrow_drop_up,
                                              color: Colors.black,
                                            ))
                                  ],*/
                                ),
                                body: GridView.count(
                                  padding: EdgeInsets.all(16.0),
                                  crossAxisCount: 2,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Material(
                                            color: btn != true
                                                ? Colors.grey.shade200
                                                    .withOpacity(0.5)
                                                : Colors.greenAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40.0),
                                                topRight: Radius.circular(40.0),
                                                bottomLeft:
                                                    Radius.circular(40.0),
                                                bottomRight:
                                                    Radius.circular(40.0),
                                              ),
                                            ),
                                            child: Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.topLeft,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 135,
                                                    width: 150,
                                                  ),
                                                  Positioned(
                                                    top: 60,
                                                    right: 20,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/curtainopener.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 15,
                                                    left:30,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                          //her#
                                                      child: Image.asset(
                                                        "images/cup_coffee.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 60,
                                                    left: 30,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/lightbulb2-removebg-preview.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 15,
                                                    right: 20,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/tvicon.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: 50,
                                                      left: 1,
                                                      child: Container(
                                                          height: 135,
                                                          width: 150,
                                                          child: Center(
                                                            child: Text(
                                                              "Living Room" + ".",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ))),
                                                 /* Positioned(
                                                    bottom: 95,
                                                    right: 20,
                                                    child: btn != true
                                                        ? Text(
                                                            "off",
                                                            style: TextStyle(
                                                              fontSize: 23,
                                                              color: Colors.red,
                                                            ),
                                                          )
                                                        : Text(
                                                            "on",
                                                            style: TextStyle(
                                                              fontSize: 23,
                                                              color: Colors
                                                                  .green[900],
                                                            ),
                                                          ),
                                                  ),*/
                                                  
                                                ]),
                                          ),
                                          onTap: () async {
                                            Future roon() async {
                                              setState(() async {
                                                var Data = await GetData(
                                                    'http://192.168.100.20:5000/api?Query=Tv');
                                              });
                                            }

                                            setState(() {
                                              if (btn == false) {
                                                btn = true;
                                                roon();
                                              } else {
                                                btn = false;
                                              }

                                              //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Material(
                                            color: btn2 != true
                                                ? Colors.grey.shade200
                                                    .withOpacity(0.5)
                                                : Colors.greenAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40.0),
                                                topRight: Radius.circular(40.0),
                                                bottomLeft:
                                                    Radius.circular(40.0),
                                                bottomRight:
                                                    Radius.circular(40.0),
                                              ),
                                            ),
                                            child: Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.topLeft,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 135,
                                                    width: 150,
                                                  ),
                                                  Positioned(
                                                    top: 15,
                                                    left:30,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/curtainopener.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 15,
                                                    right: 20,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/lightbulb2-removebg-preview.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  
                                                  
                                                  
                                                  Positioned(
                                                      top: 50,
                                                      left: 1,
                                                      child: Container(
                                                          height: 135,
                                                          width: 150,
                                                          child: Center(
                                                            child: Text(
                                                              "Bedroom1" + ".",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ))),
                                                ]),
                                          ),
                                          onTap: () async {
                                            Future roon() async {
                                              setState(() async {
                                                var Data = await GetData(
                                                    'http://192.168.100.20:5000/api?Query=Dispenser');
                                              });
                                            }

                                            setState(() {
                                              if (btn2 == false) {
                                                btn2 = true;
                                                roon();
                                              } else {
                                                btn2 = false;
                                              }
                                              //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                                            });
                                          },
                                        ),
                                      ],
                                    ),Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Material(
                                            color: btn2 != true
                                                ? Colors.grey.shade200
                                                    .withOpacity(0.5)
                                                : Colors.greenAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(40.0),
                                                topRight: Radius.circular(40.0),
                                                bottomLeft:
                                                    Radius.circular(40.0),
                                                bottomRight:
                                                    Radius.circular(40.0),
                                              ),
                                            ),
                                            child: Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.topLeft,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 135,
                                                    width: 150,
                                                  ),
                                                  Positioned(
                                                    top: 15,
                                                    left: 30,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/curtainopener.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: 15,
                                                    right: 20,
                                                    child: CircleAvatar(
                                                      radius: 22,
                                                      backgroundColor:
                                                          Colors.grey.shade200,
                                                      child: Image.asset(
                                                        "images/lightbulb2-removebg-preview.png",
                                                        fit: BoxFit.scaleDown,
                                                        height: 135,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ),
                                                  
                                                  
                                                  
                                                  Positioned(
                                                      top: 50,
                                                      left: 1,
                                                      child: Container(
                                                          height: 135,
                                                          width: 150,
                                                          child: Center(
                                                            child: Text(
                                                              "Kitchen" + ".",
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15.0,
                                                              ),
                                                            ),
                                                          ))),
                                                ]),
                                          ),
                                          onTap: () async {
                                            Future roon() async {
                                              setState(() async {
                                                var Data = await GetData(
                                                    'http://192.168.100.20:5000/api?Query=Dispenser');
                                              });
                                            }

                                            setState(() {
                                              if (btn2 == false) {
                                                btn2 = true;
                                                roon();
                                              } else {
                                                btn2 = false;
                                              }
                                              //bool selected = myImageAndCaption.indexOf(i) == selectedIndex;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    
                                    
                                  ],
                                ),
                              ),
                            ),

                            RotatedBox(
                              quarterTurns: -45,
                              child: Column(children: [
                                Stack(clipBehavior: Clip.none, children: [
                                  Material(
                                    child: Container(
                                      child: Draggable<String>(
                                        data: urlToStreamVideo,
                                        feedback: Opacity(
                                          opacity: 0.2,
                                          child: Container(
                                            width: 350,
                                            height: 250,
                                            child: Stack(
                                              //clipBehavior: Clip.none,
                                              children: [
                                                VlcPlayer(
                                                  defaultWidth: playerWidth,
                                                  defaultHeight: playerHeight,
                                                  url: urlToStreamVideo,
                                                  controller: controller,
                                                  placeholder: Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                                ),
                                                Positioned(
                                                  left: 2,
                                                  top: 2,
                                                  child: Container(
                                                    height: 40,
                                                    width: 160,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade200
                                                            .withOpacity(0.5),
                                                        //border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                            top: 10,
                                                            left: 5,
                                                            child: Center(
                                                              child: Text(
                                                                "House Entrance",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        25,
                                                                    color: Colors
                                                                            .grey[
                                                                        900]),
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 2,
                                                  top: 32,
                                                  child: Container(
                                                    height: 40,
                                                    width: 70,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        //border: Border.all(),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Stack(
                                                      children: [
                                                        camP != null
                                                            ? Positioned(
                                                                top: 13,
                                                                left: 5,
                                                                child: BlinkWidget(
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            12,
                                                                        width:
                                                                            12,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.green,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(20.0),
                                                                            topRight:
                                                                                Radius.circular(20.0),
                                                                            bottomLeft:
                                                                                Radius.circular(20.0),
                                                                            bottomRight:
                                                                                Radius.circular(20.0),
                                                                          ),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: Colors.grey.withOpacity(0),
                                                                              spreadRadius: 0,
                                                                              blurRadius: 0,
                                                                            )
                                                                          ],
                                                                        ),
                                                                        /* child: Center(
                                                                                  child: Text(
                                                                                    '$stateS',
                                                                                    style: TextStyle(
                                                                                        color: Colors
                                                                                            .white),
                                                                                  ),
                                                                                ),*/
                                                                      ),
                                                                      Container(),
                                                                    ]))
                                                            : Container(),
                                                        camP != null
                                                            ? Positioned(
                                                                top: 13,
                                                                left: 20,
                                                                child: Center(
                                                                  child: Text(
                                                                    "LIVE",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                ))
                                                            : Container(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 16,
                                                    left: 20,
                                                    child: Center(
                                                      child: Text(
                                                        "LIVE",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.red),
                                                      ),
                                                    )),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: Chip(
                                                    backgroundColor:
                                                        Colors.blueGrey[900],
                                                    avatar: CircleAvatar(
                                                      // radius: 27,
                                                      backgroundColor:
                                                          Colors.blueGrey[900],
                                                      child: Icon(
                                                        Icons.person_outline,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    label: Text(
                                                      '$camP',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey[50],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        child: Container(
                                          width: 350,
                                          height: 250,

                                          //mainbruh
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              VlcPlayer(
                                                defaultWidth: playerWidth,
                                                defaultHeight: playerHeight,
                                                url: urlToStreamVideo,
                                                controller: controller,
                                                placeholder: Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                              ),
                                              Positioned(
                                                bottom: 5,
                                                right: 5,
                                                child: CircleAvatar(
                                                  // radius: 27,
                                                  backgroundColor:
                                                      Colors.blueGrey[900],
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.arrow_upward,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          eka = true;
                                                        });
                                                      }),
                                                ),
                                              ),
                                              Positioned(
                                                left: 2,
                                                top: 2,
                                                child: Container(
                                                  height: 40,
                                                  width: 160,
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .grey.shade200
                                                          .withOpacity(0.5),
                                                      //border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                          top: 10,
                                                          left: 5,
                                                          child: Center(
                                                            child: Text(
                                                              "House Entrance",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                          .grey[
                                                                      900]),
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 2,
                                                top: 32,
                                                child: Container(
                                                  height: 40,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      //border: Border.all(),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20))),
                                                  child: Stack(
                                                    children: [
                                                      camP != ""
                                                          ? Positioned(
                                                              top: 13,
                                                              left: 5,
                                                              child: BlinkWidget(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          12,
                                                                      width: 12,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          topLeft:
                                                                              Radius.circular(20.0),
                                                                          topRight:
                                                                              Radius.circular(20.0),
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                        ),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.grey.withOpacity(0),
                                                                            spreadRadius:
                                                                                0,
                                                                            blurRadius:
                                                                                0,
                                                                          )
                                                                        ],
                                                                      ),
                                                                      /* child: Center(
                                                                                  child: Text(
                                                                                    '$stateS',
                                                                                    style: TextStyle(
                                                                                        color: Colors
                                                                                            .white),
                                                                                  ),
                                                                                ),*/
                                                                    ),
                                                                    Container(),
                                                                  ]))
                                                          : Container(),
                                                      camP != ""
                                                          ? Positioned(
                                                              top: 13,
                                                              left: 20,
                                                              child: Center(
                                                                child: Text(
                                                                  "LIVE",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: Colors
                                                                          .red),
                                                                ),
                                                              ))
                                                          : Container(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                right: 5,
                                                child: Chip(
                                                  backgroundColor:
                                                      Colors.blueGrey[900],
                                                  avatar: CircleAvatar(
                                                    // radius: 27,
                                                    backgroundColor:
                                                        Colors.blueGrey[900],
                                                    child: Icon(
                                                      Icons.person_outline,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  //rono was here
                                                  label: Text(
                                                    '$camP',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey[50],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                              ]),
                            ),
                            // Text("Still configuring the cameras")
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
                
                )
                
                
                );
  }
}
