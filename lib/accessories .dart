import 'package:flutter/material.dart';
import 'main.dart';
class Lights extends StatelessWidget {
  const Lights({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
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
      //LIghts list from server
    ;
  }
}
class Appliances extends StatelessWidget {
  const Appliances({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Music extends StatelessWidget {
  const Music({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
class doneStuff extends StatelessWidget {
  const doneStuff({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
class added_shopping_c extends StatelessWidget {
  const added_shopping_c({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
    );
  }
}
class undone extends StatelessWidget {
  const undone({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     
    );
  }
}