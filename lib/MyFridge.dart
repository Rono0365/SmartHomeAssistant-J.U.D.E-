import 'dart:ui';
import 'FridgeGoods.dart';

import 'package:flutter/material.dart';

class MyFridge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0.0,
        //leading: Container(),
        title: InkWell(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        children: [
                          
                          Positioned(bottom: 10, right: 15, child: Text("MyFridge",style: TextStyle(
                            
                          ),))
                        ],
                      ),
                    ),
                  
                  )
      ),
      body: ListView(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
        children: [
          SizedBox(width: 20,),
           InkWell(
                        child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:  Colors.grey.shade200.withOpacity(0.5),),
                          /*   image: 
                            
                           DecorationImage(
          image: AssetImage('images/Judemilkshake.jpg'),
          fit: BoxFit.fill,
          ),*/
                            
                        
                         child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: 120,
                        width: double.infinity,
 decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                                color: Colors.amber,
                                image:DecorationImage(
          image: AssetImage('images/judeicecream.jpg'),
          fit: BoxFit.fill,
          ) 
                              )),
          ),
                            
                            
                         
                                Positioned(
                                bottom: 30,
                                left: 50,
                                child: Text("Milk Products",style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),),),
                            
                          ],
                        ),
         
                        ),
                        onTap: (){
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MilkProd()),
                                ); 
                        },
           ) ,
          SizedBox(height: 7,),
           InkWell(
                        child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:  Colors.grey.shade200.withOpacity(0.5),),
                          /*   image: 
                            
                           DecorationImage(
          image: AssetImage('images/Judemilkshake.jpg'),
          fit: BoxFit.fill,
          ),*/
                            
                        
                         child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: 120,
                        width: double.infinity,
 decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                                color: Colors.amber,
                                image:DecorationImage(
          image: AssetImage('images/judemeat.png'),
          fit: BoxFit.fill,
          ) 
                              )),
          ),
                            
                            
                         
                                Positioned(
                                bottom: 30,
                                left: 50,
                                child: Text("Meat Products",style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),),),
                            
                          ],
                        ),
         
                        ),
                        onTap: (){
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MeatProd()),
                                ); 
                        },
           ) ,
          SizedBox(height: 7,),
           InkWell(
                        child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:  Colors.grey.shade200.withOpacity(0.5),),
                          /*   image: 
                            
                           DecorationImage(
          image: AssetImage('images/Judemilkshake.jpg'),
          fit: BoxFit.fill,
          ),*/
                            
                        
                         child: Stack(
                          clipBehavior: Clip.none,children: [
                            Positioned(
                              child: Container(
                                height: 120,
                        width: double.infinity,
 decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                                color: Colors.amber,
                                image:DecorationImage(
          image: AssetImage('images/judecake.jpg'),
          fit: BoxFit.fill,
          ) 
                              )),
          ),
                            
                            
                         
                                Positioned(
                                bottom: 30,
                                left: 50,
                                child: Text("Bakery",style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),),),
                            
                          ],
                        ),
         
                        ),
                        onTap: (){
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Bakery()),
                                ); 
                        },
           ) ,
          SizedBox(height: 7,),
           InkWell(
                        child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:  Colors.grey.shade200.withOpacity(0.5),),
                          /*   image: 
                            
                           DecorationImage(
          image: AssetImage('images/Judemilkshake.jpg'),
          fit: BoxFit.fill,
          ),*/
                            
                        
                         child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: 120,
                        width: double.infinity,
 decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                                color: Colors.amber,
                                image:DecorationImage(
          image: AssetImage('images/judedrinks.png'),
          fit: BoxFit.fill,
          ) 
                              )),
          ),
                            
                            
                         
                                Positioned(
                                bottom: 30,
                                left: 50,
                                child: Text("drinks",style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),),),
                            
                          ],
                        ),
         
                        ),
                        onTap: (){
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Drinks()),
                                ); 
                        },
           ) ,
          SizedBox(height: 7,),
           InkWell(
                        child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:  Colors.grey.shade200.withOpacity(0.5),),
                          /*   image: 
                            
                           DecorationImage(
          image: AssetImage('images/Judemilkshake.jpg'),
          fit: BoxFit.fill,
          ),*/
                            
                        
                         child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: 120,
                        width: double.infinity,
 decoration: BoxDecoration(
                           border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20)),

                                color: Colors.amber,
                                image:DecorationImage(
          image: AssetImage('images/judegroceries.png'),
          fit: BoxFit.fill,
          ) 
                              )),
          ),
                            
                            
                         
                                Positioned(
                                bottom: 30,
                                left: 50,
                                child: Text("Groceries",style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                                ),),),
                            
                          ],
                        ),
         
                        ),
                        onTap: (){
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Groceries()),
                                ); 
                        },
           ) ,
          
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      floatingActionButton:  FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  icon: InkWell(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 5,
                              left: 5,
                              child: Icon(Icons.add_shopping_cart)),
                          Positioned(bottom: 10, right: 15, child: Text("Add"))
                        ],
                      ),
                    ),
                    onTap: () {
                      print("Add Fridge");
                    },
                  ),
                  label: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 5,
                          left: 5,
                          child: Icon(Icons.access_time_filled_rounded),
                        ),
                        Positioned(bottom: 10, right: 0, child: Text("Expired"))
                      ],
                    ),
                  ),
                  onPressed: () {
                    print("To Expired");
                  },
                ),
    );
  }
}
