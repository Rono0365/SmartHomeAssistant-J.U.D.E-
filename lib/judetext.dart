import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class JIdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final webScraper = WebScraper('https://192.168.0.106:5000');
    void Jude() async {
      if (await webScraper.loadWebPage('/message?Query=samosa')) {
        List<Map<String, dynamic>> elements =
            webScraper.getElement('h3.title > a.caption', ['href']);
        print(elements);
      }
    
    }
    //return elements;
    Jude();
  }
}
