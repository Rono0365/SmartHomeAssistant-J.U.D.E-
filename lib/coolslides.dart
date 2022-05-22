import 'dart:io';

import 'package:flutter/material.dart';
import 'Netcloud.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'vidfeed.dart';
import 'chatPage.dart';
import 'main.dart';
import 'JudeDashboard.dart';
import 'coolslides.dart';
import 'package:intl/intl.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:shake/shake.dart';
import 'package:http/http.dart' as http;
import 'ScanProduct.dart';
import 'Groceries.dart';
import 'Shopping List.dart';
import 'Todos.dart';
import 'Settings.dart';
import 'MyFridge.dart';

class coolS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    List myImageAndCaption = [
      ['images/scan-removebg-preview (1).png',ScanProduct(), "ScanProduct"],
      
      ["images/grolist.png", ShoppingList(),"ShoppingList"],
      ["images/calendar-removebg-preview.png",Todos(), "Todos"],
      ["images/settings_icon-removebg-preview.png", Settings(),"Settings"],
      ["images/fridge-removebg-preview.png",MyFridge(), "MyFridge"],
      ["images/rent_key.png",Rentout(), "Rent out"],
      //images/rent_key.png
    ]; //images/notefic.png
    final myImageAndcaption2 = [
      ["images/notefi.png", "Jude Home"],
      ["images/notefi.png", "light in livingroom is on"],
      ["images/notefi.png", "dispenser is on "],
      ["images/notefi.png", "curtains are open"],
      ["images/notefi.png", "tv is on"],
    ];
    Function roro(List<String> k) {
      myImageAndcaption2.add(k);
    }

    //final c = coolS()..roro(["hello", "world"]);
    //coolS(roro(["hey","kill it"]));

    ;
    final myImageAndCaption3 = [
      ["images/livingroom01-removebg-preview.png", "Am Home"],
    ];

    ;
    return Stack(children: <Widget>[
      Image.asset(
        "images/blackhouse2.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: 
          Row(
                      children: [ Text(
              "MyHome",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 100,),
            Chip(
                                            avatar: CircleAvatar(
                                              // radius: 27,
                                              //backgroundColor: Colors.purple,
                                              backgroundImage:
                                              
                                                  AssetImage('images/me2X.jpeg'),
                                            ),
                                            label: Text(
                                              "Rono",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
            ]
          ),
          backgroundColor: Colors.white,
        ),
        
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //New place ~!@#$^&*()!@#$%^&*()_++_)(*&^%$#@!)
    

            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(16.0),
                crossAxisCount: 2,
                children: [
                  ...myImageAndCaption.map(
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Material(
                              color: Colors.grey.shade200.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Image.asset(
                                      i.first,
                                      fit: BoxFit.scaleDown,
                                      height: 135,
                                      width: 150,
                                    ),
                                    Positioned(
                                        top: 80,
                                        child: Container(
                                            height: 135,
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                i.last + ".",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.grey[900],
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ))),
                                  ]),
                            ),
                            onTap: () async {
                              List X = [
                                ScanProduct(),
                                Rentout(),
                                ShoppingList(),
                                Todos(),
                                Settings(),
                                MyFridge()
                              ];
                               print(i[1].toString());
                              //_sample.asMap().forEach((index, value) => f);
                              
                                //print(X[i]);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => i[1]),
                                );
                             
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        
        floatingActionButton: Theme(
            data: Theme.of(context).copyWith(
              cardColor: Colors.transparent,
            ),
            child: PopupMenuButton(
                elevation: 0.0,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Container(
                          height: 200,
                          width: 147,
                          child: Stack(
                            children: [
                              Positioned(
                                  bottom: 1.0,
                                  left: 20.0,
                                  child: FloatingActionButton(
                                      onPressed: () {
                                        print("hello unshine");
                                      },
                                      backgroundColor: Colors.grey[900],
                                      child: Icon(Icons.grid_view),)),
                              Positioned(
                                  bottom: 80.0,
                                  left: 20.0,
                                  child: FloatingActionButton(
                                      highlightElevation: 0.0,
                                      backgroundColor: Colors.grey[900],
                                      onPressed: () {
                                       
                                        
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Chatscreen(),
                                            ),
                                          );
                                        
                                      },
                                      child: Icon(Icons.message))),
                              Positioned(
                                  //top: 25.0,
                                  bottom: 80.0,
                                  right: 0.0,
                                  child: FloatingActionButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SpeechScreen()),
                                        );
                                      },
                                      backgroundColor: Colors.grey[900],
                                      child: Icon(
                                        Icons.keyboard_voice,
                                        color: Colors.green[200],
                                      ))),
                              Positioned(
                                  //top: 25.0,
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: FloatingActionButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Dashy()),
                                        );
                                      },
                                      backgroundColor: Colors.grey[900],
                                      child: Icon(
                                        Icons.home,
                                        color: Colors.yellow[50],
                                      ))),
                            ],
                          ),
                        ),
                      )
                    ],
                icon: Icon(
                  Icons.apps,
                  size: 37,
                  color: Colors.green,
                ),
                offset: Offset(9.0, 9.0)))
      )
    ]);
  }

  roro(List<String> list) {}
}
