import 'dart:ui';

import 'package:flutter/material.dart';

class MilkProd extends StatelessWidget {
  const MilkProd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List myImageAndCaption = [
      ['images/judeicecream.jpg', "Milk "],
      
      ["images/judeicecream.jpg","Yourghurt"],
      ["images/judeicecream.jpg", "cheese"],
      ["images/judeicecream.jpg", "butter"],
      
      //images/rent_key.png
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          
                          Positioned(bottom: 10, right: 15, child: Text("MyFridge",style: TextStyle(
                            
                          ),)),
                          
                          Positioned(bottom: 10, left: 107, child: Text("Milk Products",style: TextStyle(
                            color: Colors.black,
                          ),))
                        ],
                      ),
                    ),
                  
                  )
      ),
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: [
    
      ...myImageAndCaption.map(
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Material(
                              color: Colors.blueGrey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Image.asset(
                                      i.first,
                                      fit: BoxFit.cover,
                                      height: 135,
                                      width: 150,
                                    ),
                                    Positioned(
                                      bottom: 35,
                                      right: 35,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        radius: 40,
                                        child: Text(i.last.substring(0,1),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w300),),

                                      ),
                                    ),
                                    Positioned(
                                        top: 80,
                                        child: Container(
                                            height: 135,
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                i.last + ".",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[900],
                                                  fontSize: 26.0,
                                                ),
                                              ),
                                            ))),
                                  ]),
                            ),
                            onTap: () async {
                              
                              
                             
                            })
                      ],
                    ),
                  ),
  ],
      
    ));
  

    
  }
}

class MeatProd extends StatelessWidget {
  const MeatProd({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List myImageAndCaption = [
      ['images/judemeat.png', "Sausages "],
      
      ["images/judemeat.png","ham"],
      ["images/judemeat.png", "meat"],
      ["images/judemeat.png", "chicken"],
      
      //images/rent_key.png
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          
                          Positioned(bottom: 10, right: 15, child: Text("MyFridge",style: TextStyle(
                            
                          ),)),
                          
                          Positioned(bottom: 10, left: 107, child: Text("Meat Products",style: TextStyle(
                            color: Colors.black,
                          ),))
                        ],
                      ),
                    ),
                  
                  )
      ),
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: [
    
      ...myImageAndCaption.map(
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Material(
                              color: Colors.blueGrey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Image.asset(
                                      i.first,
                                      fit: BoxFit.cover,
                                      height: 135,
                                      width: 150,
                                    ),
                                    Positioned(
                                      bottom: 35,
                                      right: 35,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        radius: 40,
                                        child: Text(i.last.substring(0,1),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w300),),

                                      ),
                                    ),
                                    Positioned(
                                        top: 80,
                                        child: Container(
                                            height: 135,
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                i.last + ".",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[900],
                                                  fontSize: 26.0,
                                                ),
                                              ),
                                            ))),
                                  ]),
                            ),
                            onTap: () async {
                              
                              
                             
                            })
                      ],
                    ),
                  ),
  ],
      
    ));
  

    
    
  }
}

class Bakery extends StatelessWidget {
  const Bakery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        List myImageAndCaption = [
      ['images/judecake.jpg', "cake"],
      
      ["images/judecake.jpg","bread"],
      ["images/judecake.jpg", "peanut butter"],
      ["images/judecake.jpg", "margarine"],
      
      //images/rent_key.png
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          
                          Positioned(bottom: 10, right: 15, child: Text("MyFridge",style: TextStyle(
                            
                          ),)),
                          
                          Positioned(bottom: 10, left: 107, child: Text("Bakery",style: TextStyle(
                            color: Colors.black,
                          ),))
                        ],
                      ),
                    ),
                  
                  )
      ),
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: [
    
      ...myImageAndCaption.map(
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Material(
                              color: Colors.blueGrey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Image.asset(
                                      i.first,
                                      fit: BoxFit.cover,
                                      height: 135,
                                      width: 150,
                                    ),
                                    Positioned(
                                      bottom: 35,
                                      right: 35,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        radius: 40,
                                        child: Text(i.last.substring(0,1),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w300),),

                                      ),
                                    ),
                                    Positioned(
                                        top: 80,
                                        child: Container(
                                            height: 135,
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                i.last + ".",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[900],
                                                  fontSize: 26.0,
                                                ),
                                              ),
                                            ))),
                                  ]),
                            ),
                            onTap: () async {
                              
                              
                             
                            })
                      ],
                    ),
                  ),
  ],
      
    ));
  

 
    
  }
}

class Drinks extends StatelessWidget {
  const Drinks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List myImageAndCaption = [
      ['images/judedrinks.png', "soda "],
      
      ["images/judedrinks.png","wine"],
      ["images/judedrinks.png", "Fruit Juice"],
      ["images/judedrinks.png", "Liquor"],
      
      //images/rent_key.png
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          
                          Positioned(bottom: 10, right: 15, child: Text("MyFridge",style: TextStyle(
                            
                          ),)),
                          
                          Positioned(bottom: 10, left: 107, child: Text("drinks",style: TextStyle(
                            color: Colors.black,
                          ),))
                        ],
                      ),
                    ),
                  
                  )
      ),
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: [
    
      ...myImageAndCaption.map(
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Material(
                              color: Colors.blueGrey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Image.asset(
                                      i.first,
                                      fit: BoxFit.cover,
                                      height: 135,
                                      width: 150,
                                    ),
                                    Positioned(
                                      bottom: 35,
                                      right: 35,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        radius: 40,
                                        child: Text(i.last.substring(0,1),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w300),),

                                      ),
                                    ),
                                    Positioned(
                                        top: 80,
                                        child: Container(
                                            height: 135,
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                i.last + ".",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[900],
                                                  fontSize: 26.0,
                                                ),
                                              ),
                                            ))),
                                  ]),
                            ),
                            onTap: () async {
                              
                              
                             
                            })
                      ],
                    ),
                  ),
  ],
      
    ));
  

    
  }
}

class Groceries extends StatelessWidget {
  const Groceries({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List myImageAndCaption = [
      ['images/judegroceries.png', "Apples "],
      
      ["images/judeicecream.jpg","Vegetables"],
      ["images/judeicecream.jpg", "Bananas"],
      ["images/judeicecream.jpg", "Watermelon"],
      
      //images/rent_key.png
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: InkWell(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          
                          Positioned(bottom: 10, right: 15, child: Text("MyFridge",style: TextStyle(
                            
                          ),)),
                          
                          Positioned(bottom: 10, left: 107, child: Text("Groceries",style: TextStyle(
                            color: Colors.black,
                          ),))
                        ],
                      ),
                    ),
                  
                  )
      ),
      body: GridView.count(
  // Create a grid with 2 columns. If you change the scrollDirection to
  // horizontal, this produces 2 rows.
  crossAxisCount: 2,
  // Generate 100 widgets that display their index in the List.
  children: [
    
      ...myImageAndCaption.map(
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            child: Material(
                              color: Colors.blueGrey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topLeft,
                                  children: <Widget>[
                                    Image.asset(
                                      i.first,
                                      fit: BoxFit.cover,
                                      height: 135,
                                      width: 150,
                                    ),
                                    Positioned(
                                      bottom: 35,
                                      right: 35,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green[50],
                                        radius: 40,
                                        child: Text(i.last.substring(0,1),style: TextStyle(fontSize: 32,fontWeight: FontWeight.w300),),

                                      ),
                                    ),
                                    Positioned(
                                        top: 80,
                                        child: Container(
                                            height: 135,
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                i.last + ".",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.grey[900],
                                                  fontSize: 26.0,
                                                ),
                                              ),
                                            ))),
                                  ]),
                            ),
                            onTap: () async {
                              
                              
                             
                            })
                      ],
                    ),
                  ),
  ],
      
    ));
  

    
  }
}
