import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExampleVideo extends StatefulWidget {
  @override
  _ExampleVideoState createState() => _ExampleVideoState();
}

class _ExampleVideoState extends State<ExampleVideo> {
  String cam;
  String camP;
  Future getWeather() async {
    http.Response response = await http.get('http://192.168.100.20:5000/sysL');
     var result5 = jsonDecode(response.body);
    setState(() {
      this.camP = result5['person'].toString();
    });
    setState(() {
      this.cam = result5['cam'].toString();
    });
  }

  final String urlToStreamVideo = 'http://192.168.100.20:5000/video_feed';
  final VlcPlayerController controller = VlcPlayerController();
  final int playerWidth = 1600;
  final int playerHeight = 360;
  @override
  void initState() {
    super.initState();
     this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Surveillance",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          VlcPlayer(
            defaultWidth: playerWidth,
            defaultHeight: playerHeight,
            url: urlToStreamVideo,
            controller: controller,
            placeholder: Center(child: CircularProgressIndicator()),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200.withOpacity(0.5),
                  //border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 5,
                      child: Center(
                        child: Text(
                          "House Entrance",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Colors.grey[900]),
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
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Stack(
                children: [
                  camP != "" ?Positioned(
                      top: 13,
                      left: 5,
                      child: BlinkWidget(children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
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
                      ])):Container(),
                  camP != ""?Positioned(
                      top: 13,
                      left: 20,
                      child: Center(
                        child: Text(
                          "LIVE",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.red),
                        ),
                      )):Container(),
                     
                ],
              ),
            ),
          ),
           Positioned(
                      top: 5,
                      right: 5,
                        child:Chip(
                                                                backgroundColor: Colors.blueGrey[900],
                                                                avatar: CircleAvatar(
                                            // radius: 27,
                                            backgroundColor: Colors.blueGrey[900],
                                            child: Icon(Icons.person,color: Colors.red,),
                                           ),
                                          label: Text(
                                            '$camP',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[50],
                                            ),
                                          ),
                                                              ),
                      )
        ],
      ),
    );
  }
}

class BlinkWidget extends StatefulWidget {
  final List<Widget> children;
  final int interval;

  BlinkWidget({@required this.children, this.interval = 700, Key key})
      : super(key: key);

  @override
  _BlinkWidgetState createState() => _BlinkWidgetState();
}

class _BlinkWidgetState extends State<BlinkWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _currentWidget = 0;

  initState() {
    super.initState();

    _controller = new AnimationController(
        duration: Duration(milliseconds: widget.interval), vsync: this);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          if (++_currentWidget == widget.children.length) {
            _currentWidget = 0;
          }
        });

        _controller.forward(from: 0.0);
      }
    });

    _controller.forward();
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.children[_currentWidget],
    );
  }
}
