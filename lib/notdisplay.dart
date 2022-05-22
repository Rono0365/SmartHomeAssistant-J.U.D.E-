import 'package:flutter/material.dart';

class ligton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     bool _visible = true;
    return AnimatedOpacity(

  // If the widget is visible, animate to 0.0 (invisible).
  // If the widget is hidden, animate to 1.0 (fully visible).
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  // The green box must be a child of the AnimatedOpacity widget.
  child: Container(
    color: Colors.black,
    child:    Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/Alamp.jpg',
                              fit: BoxFit.fitWidth,
                              height: 475,
                              width: 250,
                            ),
                            Positioned(
      top: 80,
      
      child: Container(
        height: 600,
        width: 600,
        child: Center(child: Text(
                              "Light is on",
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                                fontSize: 42.0,
                              ),
                            ),),
        
      ),
    ),
                            
                          ],
                        ),
    
  ),
);
  }
}
