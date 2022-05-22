//this is for notifications incase:>> of untimely future events
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class Lnote extends StatefulWidget {
  const Lnote({Key key}) : super(key: key);

  @override
  _LnoteState createState() => _LnoteState();
}

class _LnoteState extends State<Lnote> {
  List<dynamic> litems2 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0.0,
           title: Text("Home Lighting",style: TextStyle(fontSize: 25,color: Colors.grey[900],fontWeight: FontWeight.w900),),
           actions: [
             IconButton(onPressed:(){}, icon:Icon(Icons.add_box_outlined,color: Colors.black)),
             ],
         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          //leading: Icon(Icons.home_work),
          title: Text('Living room',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
          subtitle: Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 
                     ),
                  Text("Lamp1")
                ]),

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.cast),
          title: Text("Rono's room",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
            

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.security),
          title: Text("Kitchen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 ,
                  ),
                  Text("main")
                ]),
                
                SizedBox(width: 10,),


                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.list),
          title: Text("Corridor way",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png'),
                 
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
               

                
              ],
            ),
          ),),
       
      ],
    )
    );


  }
}

class Anote extends StatelessWidget {
  const Anote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0.0,
           title: Text("Home Appliances",style: TextStyle(fontSize: 29,color: Colors.grey[900],fontWeight: FontWeight.w300),),
   
         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          //leading: Icon(Icons.home_work),
          title: Text('Living room',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
          subtitle: Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Icon(Icons.airplay_outlined),
                  ),
                  Text("Tv")
                ]),
                SizedBox(width: 10,),
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/curtainopener.png')
                 
                     ),
                  Text("curtain")
                ]),
                SizedBox(width: 10,),
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/cup_coffee.png'),
                 
                     ),
                  Text("Water Dispenser")
                ]),

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.cast),
          title: Text("Rono's room",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/curtainopener.png')
                 
                  ),
                  Text("curtain")
                ]),
                SizedBox(width: 10,),
            

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.security),
          title: Text("Kitchen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/curtainopener.png')
                 ,
                  ),
                  Text("curtains")
                ]),
                
                SizedBox(width: 10,),


                
              ],
            ),
          ),
        ),
        
       
      ],
    )
);
  }
}

class Mnote extends StatelessWidget {
  const Mnote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0.0,
           title: Text("Home Music",style: TextStyle(fontSize: 29,color: Colors.grey[900],fontWeight: FontWeight.w300),),
   
         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          //leading: Icon(Icons.home_work),
          title: Text('Living room',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
          subtitle: Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Icon(Icons.music_note,color: Colors.cyan,),
                  ),
                  Text("Home theater")
                ]),
                SizedBox(width: 10,),
                

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.cast),
          title: Text("Rono's room",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                 Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Icon(Icons.music_note,color: Colors.cyan,),
                  ),
                  Text("Music system")
                ]),
                SizedBox(width: 10,),
            

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.security),
          title: Text("Kitchen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                 Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Icon(Icons.music_note,color: Colors.cyan,),
                  ),
                  Text("smart speaker")
                ]),
                
                SizedBox(width: 10,),


                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.list),
          title: Text("Corridor way",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                 Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Icon(Icons.music_note,color: Colors.cyan,),
                  ),
                  Text("Home speaker")
                ]),
                SizedBox(width: 10,),
               

                
              ],
            ),
          ),),
       
      ],
    )
);
  }
}

class Nnote extends StatelessWidget {
  const Nnote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      
      backgroundColor: Colors.white,
         appBar: AppBar(
            title: Text("Notifications",style: TextStyle(fontSize: 29,color: Colors.grey[900],fontWeight: FontWeight.w300),),
   
           backgroundColor: Colors.white,
           elevation: 0.0,
         ),
         body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children:[
           Icon(Icons.notifications_none,size: 140,),
           Text("No notifications for the moment.",textAlign: TextAlign.center,style: TextStyle(fontSize: 32, color: Colors.blueAccent[900]))], )
);
  }
}

class Dnote extends StatelessWidget {
  const Dnote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(    backgroundColor: Colors.white, body: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children:[
           Icon(Icons.check_circle_outline_rounded,size: 140,),
           Text("  Nothing new for the moment.",textAlign: TextAlign.center,style: TextStyle(fontSize: 32, color: Colors.blueAccent[900]))], ),
         
         
);
  }
}

class Snote extends StatelessWidget {
  const Snote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0.0,
         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          //leading: Icon(Icons.home_work),
          title: Text('Living room',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
          subtitle: Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 
                     ),
                  Text("Lamp1")
                ]),

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.cast),
          title: Text("Rono's room",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
            

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.security),
          title: Text("Kitchen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 ,
                  ),
                  Text("main")
                ]),
                
                SizedBox(width: 10,),


                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.list),
          title: Text("Corridor way",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png'),
                 
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
               

                
              ],
            ),
          ),),
       
      ],
    )
);
  }
}

class Ndnote extends StatelessWidget {
  const Ndnote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      backgroundColor: Colors.white,
         appBar: AppBar(
           backgroundColor: Colors.white,
           elevation: 0.0,
            title: Text("Done",style: TextStyle(fontSize: 29,color: Colors.grey[900],fontWeight: FontWeight.w300),),
   
         ),
         body: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          //leading: Icon(Icons.home_work),
          title: Text('Living room',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
          subtitle: Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 
                     ),
                  Text("Lamp1")
                ]),

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.cast),
          title: Text("Rono's room",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
            

                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.security),
          title: Text("Kitchen",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png')
                 ,
                  ),
                  Text("main")
                ]),
                
                SizedBox(width: 10,),


                
              ],
            ),
          ),
        ),
        ListTile(
          //leading: Icon(Icons.list),
          title: Text("Corridor way",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 28),),
       
          subtitle:  Container(
                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.80,
                                ),
                            
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundColor: Colors.green[50],
                    child: Image.asset('images/lightbulb2-removebg-preview.png'),
                 
                  ),
                  Text("main")
                ]),
                SizedBox(width: 10,),
               

                
              ],
            ),
          ),),
       
      ],
    )
);
  }
}
