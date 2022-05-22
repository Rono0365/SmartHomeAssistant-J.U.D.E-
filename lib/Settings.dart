import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:shake/shake.dart';
import 'package:http/http.dart' as http;

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int st = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Icon(
          Icons.settings,
          color: Colors.green,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 12.0,
                          child: Icon(
                            Icons.camera_alt,
                            size: 15.0,
                            color: Color(0xFF404040),
                          ),
                        ),
                      ),
                      radius: 58.0,
                      backgroundImage: AssetImage('images/me2X.jpeg'),
                    ),
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(Icons.home_work),
                  title: Text('Accounts'),
                  subtitle: Text('Number of users,change users,admins'),
                ),
                ListTile(
                  leading: Icon(Icons.cast),
                  title: Text('Devices'),
                  subtitle: Text('Lights,appliances,pump...'),
                ),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Security'),
                  subtitle: Text('Users,overwatch modes'),
                ),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('routines'),
                  subtitle: Text(
                      'Am home, Am leaving,Goodnight,Goodmorning,OverWatch mode,Study mode'),
                ),
                ListTile(
                  leading: Icon(Icons.help_center),
                  title: Text('Help'),
                  subtitle: Text('Our Policy,Contact us,FAQ'),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: LiteRollingSwitch(
                    //initial value
                    value: false,
                    textOn: 'on',
                    textOff: 'off',
                    colorOn: Colors.greenAccent[700],
                    colorOff: Colors.redAccent[700],
                    iconOn: Icons.done,
                    iconOff: Icons.remove_circle_outline,
                    textSize: 16.0,
                    onChanged: (bool state) {
                      if (state == true) {
                        ShakeDetector detector =
                            ShakeDetector.autoStart(onPhoneShake: () {
                          // Do stuff on phone shake
                          print("it's shaking ............!");
                          String hey;
                          Future rono2() {
                            showDialog(
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
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(60.0)),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Image.asset(
                                                'images/sun.png',
                                                height: 200,
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                top: 160,
                                                child: Text(
                                                  'Light is off',
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )));
                                });
                          }
//are you scared of hardwork...leave it to the big boys!
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
                                            borderRadius: new BorderRadius.all(
                                                new Radius.circular(60.0)),
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

                          Future<http.Response> beautifulthng(hey) {
                            return http
                                .get('http://192.168.100.34/?led=' + hey);
                          }

                          //beautifulthng();
                          List<String> heh = ['on', 'off'];
                          heh.shuffle();
                          //heh.shuffle();
                          for (var i = 0; i < heh.length; i++) {
                            if (heh[i] == 'off') {
                              beautifulthng('on');
                              print(heh[i]);
                              setState() {
                                i--;
                              }

                              ;
                              rono2();
                              break;
                            }
                            ;
                            if (heh[i] == 'on') {
                              beautifulthng('off');
                              rono();
                              print(heh[i]);
                             
                              ;  

                              


                              break;
                            }
                            ;

                            break;
                          }
                        });
                        if (state == false) {
                          detector.stopListening();
                        }
                      } else {
                        print('nbs dj');
                      }
                      ;
                      //Use it to manage the different states
                      print('Current State of SWITCH IS: $state');
                    },
                  ),
                ),
                Text(
                  "Judewave",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.green[300],
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 150),
            Text("Created by Rono"),
            Text("2020")
          ],
        ),
      ),
    );
  }
}
