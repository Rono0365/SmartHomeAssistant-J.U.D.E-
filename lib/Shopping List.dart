// ignore_for_file: unused_import

import 'dart:convert';

import 'main.dart';
import 'Netcloud.dart';
import "package:flutter/material.dart";
//import 'vidfeed.dart';
import 'package:http/http.dart' as http;
//import 'coolslides.dart';
import 'dart:io';
/*
import 'package:web_scraper/web_scraper.dart';
import 'viddata.dart';
import 'JudeDashboard.dart';
import 'package:badges/badges.dart';
import 'dart:ui';
import 'package:flutter_tts/flutter_tts.dart';
*/
class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<dynamic> litems = []; //here
  List<dynamic> litems2 = [];

  Color _iconColor = Colors.white;
  bool isMe;
  bool Sn = false;
  String stateL;
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
  Future getWeather() async {
    
    http.Response responsex = await http.get('http://192.168.100.20:5000/sysL');
      var result5 = jsonDecode(responsex.body);
   final response = await http.get(
                                  'http://192.168.100.20:5000/MyShope?Query=r' 
                                      );
                              
                              print(json.decode(response.body).toString());
                              //final List<String> decoded = json.decode(response.body);
                              String hrng = json.decode(response.body).toString();

                              //litems2.add(titleController.text.toString());
                              if (hrng != '' && hrng != 'r' && hrng != 'iwant' ){
                                 setState(() { 
                                litems2 = json.decode(response.body);
                                litems = litems2;
                              });

                              }else{
                                print("strechmarks kwa haga");
                              };
                             
    
    
   
    setState(() {
      this.stateS = result5['stateS'].toString();
    });
    
    var results = jsonDecode(response.body);
    
  }

  String url;
  //hapa
  String QueryText; //hapa
  final _formkey = GlobalKey<FormState>();
  var value;
  String text = "what can you do?";
  ScrollController _controller;
 

  

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

  Future<void> Home45() async {
    var Data = await ('http://192.168.100.20:5000?Query=' + text); //here
  }

  String Data = "ok";
  // final String name;
  bool _isPaused;
  final response = http.get('http://112ce0ac817f.ngrok.io/api?Query=Text');
  final titleController = TextEditingController();
  final scrollDirection = Axis.vertical;
  final ScrollController _scrollController = ScrollController();
  var judeT = DateTime.now();
  @override
  List<bool> _isChecked;
  void initState() {
    super.initState();
     this.getWeather();
    _isChecked = List<bool>.filled(text.length, false);
  }

  @override
  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget slideRightBackground() {
    return Container(
      color: Colors.green,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            Text(
              "edit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Shopping list.",
                      style: TextStyle(
                          fontSize: 43,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[900]),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: InkWell(
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.grey[900],
                                border: Border.all(),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 5,
                                    left: 0,
                                    child: Icon(
                                      Icons.done_all,
                                      color: Colors.white,
                                    )),
                                Positioned(
                                    bottom: 5,
                                    right: 25,
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        onTap: () async {
                          final response = await http.get(
                              'http://192.168.100.20:5000/MyShope?Query=reload');
                         
                        },
                      ),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Max items 0",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[900]),
              ),
            ),

            Expanded(
              child: ListView.builder(
                //controller:

                //reverse: true,

                padding: EdgeInsets.all(20),
                controller: _scrollController,

                scrollDirection: scrollDirection,

                itemCount: litems2.length,

                itemBuilder: (BuildContext context, int Index) {
                  return stateS != ""
                      ? Column(
                          children: <Widget>[
                            //ni hapa jamaa
                            Dismissible(
                                key: Key(litems2[Index]),
                                background: slideLeftBackground(),
                                child: InkWell(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        litems2[Index] == "r"  
                                            ? Container()
                                            : Container(
                                                alignment: Alignment.topCenter,
                                                child: Container(
                                                  height: 70,
                                                  width: double.infinity,
                                                  //alignment: Alignment.topRight,
                                                  constraints: BoxConstraints(
                                                      maxWidth:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8),
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green[50],
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
                                                        color: Colors.grey
                                                            .withOpacity(0),
                                                        spreadRadius: 0,
                                                        blurRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        bottom: 10,
                                                        left: 50,
                                                        child: Text(
                                                          litems2[Index],
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          bottom: 0,
                                                          left: 4,
                                                          child: Checkbox(
                                                              value: _isChecked[
                                                                  Index],
                                                              onChanged: (val) {
                                                                setState(() {
                                                                  _isChecked[
                                                                          Index] =
                                                                      val;
                                                                });

                                                                setState(
                                                                  () async {
                                                                    var Data = await GetData(
                                                                        'http://192.168.100.20:5000/api?Query=Donec  ' +
                                                                            '|  ' +
                                                                            val.toString());
                                                                  },
                                                                );
                                                              }))
                                                    ],
                                                  ),
                                                )),
                                      ]),
                                  onLongPress: () {
                                    print("deleting...index");
                                  },
                                ),
                                confirmDismiss: (direction) async {
                                  if (direction ==
                                      DismissDirection.endToStart) {
                                    final bool res = await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Text("Are you sure you want to delete ${litems[Index]}?"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop(); 
                                                },
                                              ),
                                              FlatButton(
                                                child: Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.of(context).pop();

                                                    litems
                                                        .remove(litems[Index]);
                                                  });
                                                  //litems2.removeAt(litems2[Index]);

                                                  setState(() async {
                                                    final response = http.get(
                                                        'http://192.168.100.20:5000/api?Query=' +
                                                            'remove' +
                                                            litems[Index]);
                                                  });
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                    return res;
                                  } else {
                                    // TODO: Navigate to edit page;
                                  }
                                }),
                          ],
                        )
                      : Container();
                },
              ),
            ),

            //ni hapa

            //     Widget _editTitleTextField() {if (_isEditingText)    return Center(      child: TextField(        onSubmitted: (newValue){          setState(() {            initialText = newValue;            _isEditingText =false;          });        },        autofocus: true,        controller: _editingController,      ),    );  return InkWell(    onTap: () {      setState(() {        _isEditingText = true;      });    },    child: Text(  initialText,  style: TextStyle(    color: Colors.black,    fontSize: 18.0,  ), );}
            //This is just a step to an old story.

            //here
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.edit),
          label: Text("AddtoList"),
          onPressed: () async {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("key in the product:"),
                      content: TextField(
                        controller: titleController,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        onChanged: (value) {
                          //use this instead
                        },
                        decoration: InputDecoration(hintText: "tap and write "),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Text('CANCEL'),
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        FlatButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('OK'),
                          onPressed: () async {
                            if (titleController.text.length > 0) {
                              final response = await http.get(
                                  'http://192.168.100.20:5000/MyShope?Query=' +
                                      titleController.text.toString());
                              titleController.clear();
                              print(json.decode(response.body).toString());
                              //final List<String> decoded = json.decode(response.body);

                              //litems2.add(titleController.text.toString());
                              setState(() {
                                litems2 = json.decode(response.body);
                                litems = litems2;
                              });
                              // Append Text to the list
                              // Clear the Text area

                              clearText();

                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn);

                              sleep(const Duration(milliseconds: 500));

//Data
                              // var DecodedData = jsonDecode(decoded.toString());

                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    ));
          },
        ));
    //void man() => value.toString();
  }
}
