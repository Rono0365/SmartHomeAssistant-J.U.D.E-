import 'package:flutter/material.dart';

class Rentout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

      ),
      body: Column(mainAxisAlignment
        :MainAxisAlignment.center,
              children:[
                Icon(
                  Icons.access_alarm,
                  size: 52,
                ),
                Center(
                  child: Text("Available Soon",style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87
                  ),),
                ),
              ] ,
      ),
    );
  }
}
