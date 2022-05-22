import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class roro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _launchURL();
  }
}


_launchURL() async {
  const url = 'http://192.168.0.106:5000/video_feed';
  
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
