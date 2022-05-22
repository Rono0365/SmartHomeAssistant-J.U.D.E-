import 'package:flutter/material.dart';
import 'Netcloud.dart';

class coolP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myImageAndCaption = [
      ["images/lightbulb2-removebg-preview.png", "lights on"],
      ["images/lightsoff-removebg-preview (1).png", "lights off"],
      ["images/music2.png", "Music"],
      ["images/pauseplay2-removebg-preview-removebg-preview.png", "Pause/play"],
      ["images/weather2-removebg-preview.png", "Weather"],
      ["images/curtainopener.png","Curtains"]
    ];
    return Stack(children: <Widget>[
      Image.asset(
        "images/home.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
      ),
      
       Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Accessories',
            overflow: TextOverflow.ellipsis,
  style: TextStyle(fontWeight: FontWeight.bold,
  color: Colors.black,
  ),
  
          ),
          backgroundColor: Colors.transparent,
        ),
        
        body: GridView.count(

          crossAxisCount: 2,
          children: [
            ...myImageAndCaption.map(
              (i) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    child: Material(
                      color: Colors.greenAccent,
                      shape:  RoundedRectangleBorder(
                        borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(40.0),
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              ),
                      ),
                      child:Stack(

                       children: <Widget>[
                         Image.asset(
                        i.first,
                        fit: BoxFit.fitWidth,
                        height: 135,
                        width: 150,
                      ),
                      Text(i.last+".",style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black38,
              fontSize: 26.0,
            ),),]
                    ),),
                    onTap: () async {
                     /* var Data = await GetData(
                        'http://192.168.100.7:5000/api?Query=' + i.last,
                      );*/
                    },
                  ),
                 
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
