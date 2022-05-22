import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'package:wifi_iot/wifi_iot.dart';
import 'dart:convert';
import 'notdisplay.dart';
//import 'package:Flutter_beep/flutter_beep.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
//import 'package:shake/shake.dart';
import 'Netcloud.dart';
import 'JudeDashboard.dart';
import 'package:wifi/wifi.dart';
//import 'package:connectivity/connectivity.dart';
import 'chatPage.dart';
import 'vidfeed.dart';
import 'coolslides.dart';
import 'package:badges/badges.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
//import 'accessories.dart';
import 'judenote.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_vlc_player/vlc_player_flutter.dart';
//import 'package:porcupine/porcupine.dart';
//import 'package:porcupine/porcupine_manager.dart';
//import 'package:porcupine/porcupine_error.dart';

m() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    print(connectivityResult);
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    print(connectivityResult);
  }
  return 0;
}

Future<void> main() async => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Jude Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashy(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  String url;

  var Dataa;

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  bool isPlaying = false;
  String ComData;
  List<String> xs;
  FlutterTts _flutterTts;
  List<String> listx;
  FlutterTts flutterTts = FlutterTts();
  double width = 100.0, height = 100.0;
  Offset position;
  Future rono2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Container(
                  width: 260.0,
                  height: 230.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white38,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(60.0)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          // listx;
                        ],
                      ),
                    ],
                  )));
        });
  }

  Future rono() {
    showDialog(
        barrierColor: Colors.black26,
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
              content: Container(
                  width: 260.0,
                  height: 230.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white38,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(60.0)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/lightbulb2-removebg-preview.png',
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 170,
                        child: Text(
                          'Light is on',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  )));
        });
  }

  final _formkey = GlobalKey<FormState>();

/*
  void wifi1() async {
    int level = await Wifi.level;
    print(level);
    while (true) {
      if (level.toString() == '3') {
        var DatA$$ = await GetData('http://192.168.100.14/?led=on');
      }
      ;
      if (level.toString() == '2') {
        var DatA$$ = await GetData('http://192.168.100.14/?led=off');
      }
      ;
      if (level.toString() == '1') {
        var DatA$$ = await GetData('http://192.168.100.14/?led=off');
      }
      ;
    }
  }
*/

  // To close: detector.stopListening();
  // ShakeDetector.waitForStart() waits for user to call detector.startListening();

  stt.SpeechToText _speech;
  bool _islistening = false;
  bool _talking = false;
  String _text = "Tap the audio button and speak";
  String recognizedWords = '';

  void startListening() {
    if (_islistening != true) {
      _speech.listen(
          listenFor: Duration(seconds: 30000),
          //pauseFor: Duration(seconds: 5),
          onResult: (val) => setState(() {
                _text = val.recognizedWords;
                if (_text.toString() == "hey Judy") {
                  //to do after wake word
                  _islistening = true;
                }
              }));
    }
    ;
  }

  Future _stop() async {
    var result = await _flutterTts.stop();

    if (result == 1)
      setState(() {
        isPlaying = false;
      });
  }

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    _speech.initialize();
    final Map<String, HighlightedWord> _highlights = {
      'hello': HighlightedWord(
        onTap: () {},
        textStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'lights': HighlightedWord(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lnote(),
            ),
          );
        },
        textStyle: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'on': HighlightedWord(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lnote(),
            ),
          );
        },
        textStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.w400,
          fontSize: 43,
        ),
      ),
      'light': HighlightedWord(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lnote(),
            ),
          );
        },
        textStyle: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'Lights': HighlightedWord(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lnote(),
            ),
          );
        },
        textStyle: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'Light': HighlightedWord(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lnote(),
            ),
          );
        },
        textStyle: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'shopping': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'fridge': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'calendar': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.cyan,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'remove': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'add': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'Fridge': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'done': HighlightedWord(
        onTap: () {
          /* Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.greenAccent,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'undone': HighlightedWord(
        onTap: () {
          /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Lnote(),
                                      ),
                                    );*/
        },
        textStyle: const TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
      ),
      'off': HighlightedWord(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Lnote(),
            ),
          );
        },
        textStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.w400,
          fontSize: 43,
        ),
      ),
      'music': HighlightedWord(
        onTap: () {},
        textStyle: const TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      )
    };
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Jude Assistant',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            cardColor: Colors.transparent,
          ),
          child: PopupMenuButton(
              elevation: 0.0,
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Container(
                        height: 300,
                        width: 450,
                        child: Stack(
                          children: [
                            Positioned(
                                bottom: 50.0,
                                left: 0.0,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    print("hello unshine");
                                    //coolS()
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => coolS(),
                                      ),
                                    );
                                  },
                                  backgroundColor: Colors.grey[900],
                                  child: Icon(Icons.grid_view),
                                )),
                            Positioned(
                                bottom: 120.0,
                                left: 20.0,
                                child: FloatingActionButton(
                                    highlightElevation: 0.0,
                                    backgroundColor: Colors.grey[900],
                                    onPressed: () {
                                      print("hello unshine");

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
                                bottom: 120.0,
                                right: 80.0,
                                child: FloatingActionButton(
                                    backgroundColor: Colors.grey[900],
                                    child: Icon(
                                      Icons.keyboard_voice,
                                      color: Colors.green[200],
                                    ))),
                            Positioned(
                                //top: 25.0,
                                bottom: 50.0,
                                right: 60.0,
                                child: FloatingActionButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Dashy()));
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
              offset: Offset(9.0, 9.0))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _islistening,
        glowColor: Colors.grey,
        endRadius: 120.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: Container(
            height: 90,
            width: 90,
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: _listen,
              child: Icon(
                _islistening ? Icons.mic : Icons.mic_none,
                color: Colors.green[50],
                size: 50.0,
              ),
            )),
      ),
      body: ListView(children: [
        //hereTalk
        _talking
            ? Stack(
                children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: Container(
                        //alignment: Alignment.topRight,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.60,
                        ),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
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
                        child: Text(
                          ComData.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                  Positioned(
                    top: 5,
                    left: 60,
                    child: AvatarGlow(
                      animate: _talking,
                      glowColor: Colors.red,
                      endRadius: 25.0,
                      duration: const Duration(milliseconds: 2000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: CircleAvatar(
                        radius: 12,
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      left: 70,
                      child: LinearProgressIndicator(
                          backgroundColor: Colors.green,
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.red)))
                ],
              )
            : Container(),
        SingleChildScrollView(
          reverse: true,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
            child: _text == ''
                ? Text("Listening")
                : TextHighlight(
                    text: _text,
                    words: _highlights,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    )),
          ),
        ),
      ]),
    );
  }

  Function ssnd() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ligton()),
    );
  }

  Future _speak(String k) async {
    setState(() {
      _talking = true;
    });

    flutterTts.setVoice("en-AU");
    flutterTts.setSpeechRate(0.8);
    flutterTts.setPitch(0.9);
    _talking == true ? flutterTts.speak(k) : _flutterTts.stop();
    print("KSECS:" + k.length.toString());

    double ak1 = (k.length * 0.075);
    double xak1 = 0.7;
    double rxc = ak1 + xak1;
    int ak = rxc.round();
    //double  ans = nuv * ak;
    print(ak);
    Future.delayed(Duration(seconds: ak + 1), () {
      setState(() {
        _talking = false;
      });
    });

    // if (result == 1) setState(() => ttsState = TtsState.playing);
  }

  void _listen() async {
    //String ssid = await Wifi.ssid;

    if (!_islistening) {
      //  wifi1();
      bool available = await _speech.initialize(
        onStatus: (val) => print('listening: $val'),
        onError: (val) => print('error: $val'),
      );
      setState(() => _islistening = false);
      if (available) {
        setState(() => _islistening = true);

        _speech.listen(
            onResult: (val) => setState(() {
                  _text = val.recognizedWords;
                  //int xr = _text.length;
                  //_author @rono.ai
                  double ak1 = _text.length * 0.075;
                  int xr = ak1.round();
                  Future.delayed(Duration(seconds: xr + 1), () {
                    setState(() => _islistening = false);
                  });

                  if (_text.toString() != null && _islistening != true) {
                    dope(_text.toString());
                    // _talking = false;
                    _speech.stop();
                  }
                  ;
                }));
      }

      setState(() => _islistening = true);
    } else {
      setState(() => _islistening = false);
      //here tap
    }
  }

  void dope(String r) async {
    var Data = await GetData('http://192.168.100.20:5000/api?Query=' + r);

    var DecodedData = jsonDecode(Data);
    DecodedData.toString() != null
        ? _speak(DecodedData.toString())
        : _speak("Offline for the moment");

    //xs.add();

    //isPlaying = false;

    //ComData = DecodedData.toString();

    //xs.add(DecodedData.toString());
  }
}
