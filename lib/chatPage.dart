import 'dart:convert';

import 'main.dart';
import 'Netcloud.dart';
import "package:flutter/material.dart";
import 'vidfeed.dart';
import 'package:http/http.dart' as http;
import 'coolslides.dart';
import 'dart:io';
import 'package:web_scraper/web_scraper.dart';
import 'viddata.dart';
import 'JudeDashboard.dart';
import 'package:badges/badges.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class Chatscreen extends StatefulWidget {
  @override
  _ChatscreenState createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  bool isMe;
  String url;
  String Data = "ok";
  //hapa
  String QueryText; //hapa
  final _formkey = GlobalKey<FormState>();
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  var value;
  String text = "what can you do?";
  ScrollController _controller;
  FlutterTts flutterTts = FlutterTts();

  Future _speak(String k) async {
    flutterTts.setVoice("en-AU");
    flutterTts.setSpeechRate(0.9);
    flutterTts.setPitch(0.8);
    var result = await flutterTts.speak(k);

    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    //if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  //await flutterTts.awaitSpeakCompletion(true);
  void moveUp() {
    _controller.jumpTo(150);
  }

  Future<void> texx() async {
    final validation = _formkey.currentState.validate();
    if (!validation) {
      return;
    }
    _formkey.currentState.save();
  }

  final TextEditingController eCtrl = new TextEditingController();
  void _setText() {
    setState(() {
      text = titleController.text;
    });
  }

//clear the data in the textfield
  void clearText() {
    titleController.clear();
  }

  List<String> litems = []; //here
  List<String> litems2 = [];

  // final String name;
  bool _isPaused;
  final response = http.get('http://112ce0ac817f.ngrok.io/api?Query=Text');
  final titleController = TextEditingController();
  final scrollDirection = Axis.vertical;
  final ScrollController _scrollController = ScrollController();
  var judeT = DateTime.now();
  //myImageAnd caption list should ne a random change list derived from the jude api
  final myImageAndCaptionX = [
    ["images/keja.png", "what's on my fridge"],
    ["images/sun.png", "who's home"],
    ["images/sun.png", "what's on my shopping list"],
    ["images/moon.png", "commands?"],
    ["images/moon.png", "show me the front door"],
    ["images/keja.png", "which appliances are running"],
    ["images/exit.png", "which lights are on?"],

    ["images/sentry_mode-removebg-preview.png", "what's on my fridge"],
    //["images/book.png", ""],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          elevation: 0.0,
          //brightness: Brightness.light,

          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          title: Container(
            decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                   
             boxShadow: [
                                        BoxShadow(
                                          color: Colors.transparent,
                                          //spreadRadius: 5,
                                          blurRadius: 2,
                                        )
                                      ],),
            margin: EdgeInsets.all(20.0),
            child: Column(
              //height:80,
              children: <Widget>[
                CircleAvatar(
                  radius: 18,
                  child: Text("J"),
                  backgroundColor: Colors.green[50],
                  //backgroundImage: AssetImage('images/online.png'),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Stack(
                      children: [
                        Positioned(
                            child: Text(
                          "Jude Home",
                          style: TextStyle(
                              color: Colors.grey[900], fontWeight: FontWeight.w600),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
          
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.builder(
                  //controller:

                  //reverse: true,
                  
                  padding: EdgeInsets.all(20),
                  controller: _scrollController,

                  scrollDirection: scrollDirection,

                  itemCount: litems.length,

                  itemBuilder: (BuildContext context, int Index) {
                    return Column(
                      children: <Widget>[
                        //ni hapa jamaa
                        InkWell(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      //alignment: Alignment.topRight,
                                      constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.60,
                                      ),
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey[900],
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                          )
                                        ],
                                      ),
                                      child: Text(
                                        litems[Index],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  verticalDirection: VerticalDirection.down,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      constraints: BoxConstraints(
                                        maxHeight: double.infinity,
                                      ),
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            spreadRadius: 0,
                                            //blurRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        radius: 7,
                                        backgroundImage:
                                            AssetImage('images/me.png'),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                          onTap: () async {
                            var Data = await GetData(
                                'http://192.168.100.20:5000/api?Query=' +
                                    litems[Index]);
                          },
                        ),
                        litems2[Index] == "ok"
                            ? Container(
                                color: Colors.transparent,
                              )
                            : Container(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width * 0.80,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green,
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                      )
                                    ],
                                  ),
                                  //final webScraper = WebScraper('https://webscraper.io');
                                  //if(await webScraper.loadWebPage('/test-sites/e-commerce/allinone')){
                                  //  List<Map<String, dynamic>> elements = webScraper.getElement('h3.title > a.caption', ['href']);
                                  //print(elements);
                                  //}
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: <Widget>[
                                      Positioned(
                                          //  left:0,
                                          child: litems2[Index] == "ok"
                                              ? Container(
                                                  color: Colors.transparent)
                                              : Text(
                                                  litems2[Index],
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.green[500]),
                                                )),
                                    ],
                                  ),
                                ),
                              ),
                               
                      ],
                      
                    );
                    SizedBox(
                      height: 50,
                    );
                  },
                ),
              ),
               

              //ni hapa

              //     Widget _editTitleTextField() {if (_isEditingText)    return Center(      child: TextField(        onSubmitted: (newValue){          setState(() {            initialText = newValue;            _isEditingText =false;          });        },        autofocus: true,        controller: _editingController,      ),    );  return InkWell(    onTap: () {      setState(() {        _isEditingText = true;      });    },    child: Text(  initialText,  style: TextStyle(    color: Colors.black,    fontSize: 18.0,  ), );}
                   //This is just a step to an old story.
       Theme(
                data: Theme.of(context).copyWith(
                  cardColor: Colors.transparent,
                ),
                child: Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 900.0,
                          color: Colors.transparent,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                // top: 10,

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
                                                
                                                label: Text(
                                                  i.last,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              onTap: () async {
                                                litems.add(i.last.toString());
                                                _scrollController.animateTo(
                                                    _scrollController
                                                        .position.maxScrollExtent,
                                                    duration: Duration(
                                                        milliseconds: 60),
                                                    curve: Curves.fastOutSlowIn);
                                                                                                 _scrollController.animateTo(
                                                    _scrollController
                                                        .position.maxScrollExtent,
                                                    duration: Duration(
                                                        milliseconds: 60),
                                                    curve: Curves.fastOutSlowIn);
                                                                                                 _scrollController.animateTo(
                                                    _scrollController
                                                        .position.maxScrollExtent,
                                                    duration: Duration(
                                                        milliseconds: 60),
                                                    curve: Curves.fastOutSlowIn);
                                                     _scrollController.animateTo(
                                                    _scrollController
                                                        .position.maxScrollExtent,
                                                    duration: Duration(
                                                        milliseconds: 60),
                                                    curve: Curves.fastOutSlowIn);
                                                final response = await http.get(
                                                    'http://192.168.100.20:5000/api?Query=' +
                                                        i.last.toString());
                                                if (response.statusCode == 200) {
                                                  Data = await GetData(
                                                      'http://192.168.100.20:5000/api?Query=' +
                                                          i.last.toString());
                                                  litems2.add(json.decode(Data));
                                                  // Append Text to the list
                                                  //ItemScrollController _scrollController = ItemScrollController();
                                                  //       _scrollController.jumpTo(pos);

                                                  // Clear the Text area
                                                  setState(() {});
                                                  clearText();

                                                  sleep(const Duration(
                                                      milliseconds: 500));

                                                  final decoded =
                                                      json.decode(response.body)
                                                          as Map<String, dynamic>;
                                                  return litems2;
                                                } else {
                                                  litems.add(i.last.toString());
                                                  litems2.add(
                                                      "Am offline at the moment");
                                                  _scrollController.animateTo(
                                                      _scrollController.position
                                                          .maxScrollExtent,
                                                      duration: Duration(
                                                          milliseconds: 60),
                                                      curve:
                                                          Curves.fastOutSlowIn);
                                                  clearText();
 
                                                  sleep(const Duration(
                                                      milliseconds: 500));
                                                }
                                                ;
                                              })
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
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                        Row(children: <Widget>[
                          Container(
                            width: 250,
                            child: Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  enabled:
                                  false;
                                },

                                //void man => value.toString();

                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    hintText: 'write a command',
                                    hintStyle: TextStyle(color: Colors.grey[900]),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                controller: titleController,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          GestureDetector(
                            // Redraw the Stateful Widget

                            onTap: () async {
                              if (titleController.text.length > 0) {
                                litems.add(titleController.text.toString());
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent,
                                    duration: Duration(milliseconds: 60),
                                    curve: Curves.fastOutSlowIn);
                                
                                if (titleController.text.length > 0) {
                                  Data = await GetData(
                                      'http://192.168.100.20:5000/api?Query=' +
                                          titleController.text.toString());
                                  litems2.add(json.decode(Data));
                                  // Append Text to the list
                                  //ItemScrollController _scrollController = ItemScrollController();
                                  //       _scrollController.jumpTo(pos);

                                  titleController.clear();
                                  // Clear the Text area
                                  setState(() {});
                                  clearText();

                                  sleep(const Duration(milliseconds: 500));

                                  
                                  return litems2;
                                } else {
                                  try {
                                    if (titleController.text.length > 0) {
                                      litems2.add("Am Offline for the moment");
                                    }
                                  } catch (e) {
                                    titleController.clear();
                                  }

                                  ;
                                }
                              }
                            },

                            child: CircleAvatar(
                              child: Icon(Icons.send),
                            ),
                            onLongPress: () {},
                          ),
                          SizedBox(width: 5),
                        ]),
                      ]),
                ),

                //here
              ),
            ],
          ),
        ));
    //void man() => value.toString();
  }
}
