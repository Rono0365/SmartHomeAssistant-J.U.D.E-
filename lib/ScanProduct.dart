import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr/qr.dart';

import 'Netcloud.dart';

class ScanProduct extends StatefulWidget {
  @override
  _ScanProductState createState() => _ScanProductState();
}

class _ScanProductState extends State<ScanProduct> {
  String qrCode = 'Unknown';
  String text = "";
  String date;
  String sun;
  final myImageAndCaptionX = [
    ["images/groceriesImage-removebg-preview.png", "Milk Products"],
    ["images/groceriesImage-removebg-preview.png", "Meat Products"],
    ["images/groceriesImage-removebg-preview.png", "Bakery"],
    ["images/groceriesImage-removebg-preview.png", "drinks"],
    ["images/groceriesImage-removebg-preview.png", "Groceries"],
  ];
  @override
  Widget build(BuildContext context) {
    Future<void> ScanProduct() async {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      //var Data =
      //  await GetData('http://192.168.0.108:5000?Query=' + qrCode.toString());
      //senm(context);

      void senE(BuildContext context) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(qrCode.toString() + " is not a valid account"),
            content: Text("invalid account"),
          ),
        );
      }

      ;

      ;

      // senE(context);

      ;

      void senm(BuildContext context) {
        final titleController = TextEditingController();
        void _setText() {
          setState(() {
            var text77 = titleController.text;
          });
        }

        void senTT(BuildContext context) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Successfully Added"),
            ),
          );
        }

        void clearT() {
          titleController.clear();
        }

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Product key:" + qrCode.toString()),
                  content: Column(
                    children: [
                      Text(
                        "Add to Category",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            ...myImageAndCaptionX.map(
                              (i) => Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    child: Material(
                                      color: Colors.grey[100],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            i.first,
                                            fit: BoxFit.scaleDown,
                                            height: 100,
                                            width: 100,
                                          ),
                                          Positioned(
                                            bottom: -15,
                                            left: 13,
                                            child: Container(
                                              child: Center(
                                                child: Text(
                                                  i.last + ".",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      sun = i.last;
                                      print(["hello", "there"]);
                                      /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => coolP()),
                              );*/
                                    },
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green[50], elevation: 0.0),
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2021),
                                      lastDate: DateTime(2025))
                                  .then((DateTime value) {
                                if (value != null) {
                                  DateTime _fromDate = DateTime.now();
                                  _fromDate = value;
                                  date = DateFormat.yMMMMd().format(_fromDate);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Selected date: $date')),
                                  );
                                }
                              });
                            },
                            child: const Text("Add Expiry Date",
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: titleController,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          onChanged: (value) {
                            //use this instead

                            Future<void> Home45() async {
                              var Data =
                                  await ('http://192.168.0.108:5000?Query=' +
                                      value.toString() +
                                      ":" +
                                      value.toString()); //here
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "add name to this product "),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text('CANCEL'),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                    FlatButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text('OK'),
                      onPressed: () async {
                        var Data = await GetData('http://192.168.100.20:5000/MyHome?Query=' +
                            qrCode.toString() +
                            '|' +
                            titleController.text +
                            '|' +
                            date+'|'+sun);
                        print(qrCode.toString() +
                            '|' +
                            titleController.text +
                            '|' +
                            date+'|'+sun);
                        Navigator.pop(context);
                        clearT();
                        senTT(context);
                      },
                    ),
                  ],
                ));
      }

      if (qrCode.toString() == '-1') {
        senE(context);
      } else {
        senm(context);
      }

      setState(() {
        this.qrCode = qrCode;
        print(qrCode.toString());
      });
    }
@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(60.0),
          child: FloatingActionButton.extended(
              backgroundColor: Colors.green,
              onPressed: () => ScanProduct(),
              icon: Icon(Icons.camera_alt),
              label: Text("Scan"))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('images/scan-removebg-preview (1).png'),
          Text(
            "   Scan Any Type of barcode or qrcode on product to be stored " +
                "\n" +
                " in refrigerator or if none go to  " +
                "\n" +
                "                    MyFridge",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w300, color: Colors.green),
          ),
        ]),
      ),
    );

   } //try here
  }
}
