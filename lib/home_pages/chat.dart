// @dart=2.9
import 'dart:convert';
import 'dart:ui';

import 'package:f_matrimony/home_pages/matches.dart';
import 'package:f_matrimony/home_pages/shortlisteditems.dart';
import 'package:f_matrimony/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool selector1=false;
  bool selector2=false;
  bool selector3=false;
  bool selector4=false;
  bool selector5=false;
  bool selector6=false;
  bool selector7=false;
  bool selector8=false;
  bool selector9=false;
  SharedPreferences sharedlogindata;
  String sharedpreferenceuserid,firstname,lastname,gender,profilepic;
  var allmatchesdata;
  getuseridfromsharedpreference()async {
    sharedlogindata = await SharedPreferences.getInstance();
    setState(() {
      sharedpreferenceuserid = sharedlogindata.getString('userid') ?? '';
      firstname=sharedlogindata.getString('firstname') ?? '';
      lastname=sharedlogindata.getString('lastname') ?? '';
      gender=sharedlogindata.getString('gender') ?? '';
      profilepic=sharedlogindata.getString('profilepic') ?? '';

      //password1=logindata.getString('password') ?? '';
    });
    print(sharedpreferenceuserid);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getuseridfromsharedpreference().then((value){
      //matchimageindatabase();
      // newMatches();
      // todayMatches();
      // allMatches();
    });
    //});
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leadingWidth: 100,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 5),
      //     child: Center(child: Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
      //   ),
      // ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: _image==null?Text(""):Image.file(_image),
                  //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.07), BlendMode.dstATop),
                  //   fit: BoxFit.cover
                  // ),
                  color: const Color(0xff7c94b6),
                ),
                child:
                Stack(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height*.25,
                        width: MediaQuery.of(context).size.width,

                        child:profilepic!=null?Image.memory(base64Decode(profilepic),fit: BoxFit.cover,):CircularProgressIndicator(color: Colors.blue,)
                      //Image.memory(base64Decode(serverimage),fit: BoxFit.contain,)
                      //_image==null?Image.file(widget.pro_im,fit: BoxFit.cover,):Image.file(_image,fit: BoxFit.cover,),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height*.25,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(

                          //image: _image==null?Image.file(widget.pro_im,fit: BoxFit.cover,):Image.file(_image,fit: BoxFit.cover,),

                        ),
                        child: new BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            height: MediaQuery.of(context).size.height*.25,
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
                          ),)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 20,),
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            // CircleAvatar(
                            //   radius: 50,
                            //   backgroundColor: Colors.transparent,
                            //  child: ClipOval(
                            //    child: _image==null? CircleAvatar():
                            //    Image.file(_image,fit: BoxFit.contain,width: 50,height: 50,),
                            //  )
                            // ),
                            Container(
                              height: MediaQuery.of(context).size.height*.15,
                              width: MediaQuery.of(context).size.width*.25,
                              decoration: BoxDecoration(
                                //color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                // image: DecorationImage(
                                //   image: AssetImage("image/profile.jpg"),
                                //   fit: BoxFit.cover,
                                //     colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstIn)
                                // )
                              ),
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child:profilepic!=null?Image.memory(base64Decode(profilepic),fit: BoxFit.cover,):Center(
                                      child: CircularProgressIndicator(backgroundColor: Colors.red,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),strokeWidth: 5,),
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                              top: 105,
                              left: 39,
                              child: GestureDetector(
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue
                                  ),
                                  child: Icon(Icons.add,color: Colors.white,),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 25,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(firstname!=null&&lastname!=null?"${firstname.toUpperCase()+" "+lastname.toUpperCase()}":"",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(sharedpreferenceuserid!=null?"$sharedpreferenceuserid":"",style: TextStyle(color: Colors.white),),
                            Text("Account - Free",style: TextStyle(color: Colors.white),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text("Edit Profile",style: TextStyle(fontSize:15,color: Colors.blue,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.solid,decorationColor: Colors.blue,decorationThickness: 2),),
                                SizedBox(width: 10,),
                                Container(height: 15,width: 1,color: Colors.white,),
                                SizedBox(width: 10,),
                                // Container(
                                //   decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                                //     child: Icon(Icons.edit_outlined,color: Colors.black,size: 15,)),
                                Text("Upgrade Account",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.solid,decorationColor: Colors.blue,decorationThickness: 2),)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              ListTile(
                leading: Icon(Icons.wc,color: Colors.grey,),
              title: Text("Matches",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
              horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: ()async{
                    setState(() {
                      selector1=true;
                      selector2=false;
                      selector3=false;
                      selector4=false;
                      selector5=false;
                      selector6=false;
                      selector7=false;
                      selector8=false;
                      selector9=false;
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  Matches(),));
                    },
                selected: selector1,
              ),

              ListTile(
                leading: Icon(Icons.favorite,color: Colors.grey,),
                title: Text("Shortlisted",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=true;
                    selector3=false;
                    selector4=false;
                    selector5=false;
                    selector6=false;
                    selector7=false;
                    selector8=false;
                    selector9=false;
                  });
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ShortListedItems()));
                },
                selected: selector2,
              ),

              ListTile(
                leading: Icon(Icons.visibility,color: Colors.grey,),
                title: Text("Profile Views",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=true;
                    selector4=false;
                    selector5=false;
                    selector6=false;
                    selector7=false;
                    selector8=false;
                    selector9=false;
                  });
                },
                selected: selector3,
              ),

              ListTile(
                leading: Icon(Icons.chat,color: Colors.grey,),
                title: Text("Chats",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=false;
                    selector4=true;
                    selector5=false;
                    selector6=false;
                    selector7=false;
                    selector8=false;
                    selector9=false;
                  });
                },
                selected: selector4,
              ),

              ListTile(
                leading: Icon(Icons.add_alert_sharp,color: Colors.grey,),
                title: Text("Notifications",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=false;
                    selector4=false;
                    selector5=true;
                    selector6=false;
                    selector7=false;
                    selector8=false;
                    selector9=false;
                  });
                },
                selected: selector5,
              ),
              ListTile(
                leading: Icon(Icons.assignment_sharp,color: Colors.grey,),
                title: Text("Subscription Plans",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=false;
                    selector4=false;
                    selector5=false;
                    selector6=true;
                    selector7=false;
                    selector8=false;
                    selector9=false;
                  });
                },
                selected: selector6,
              ),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.grey,),
                title: Text("Settings",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=false;
                    selector4=false;
                    selector5=false;
                    selector6=false;
                    selector7=true;
                    selector8=false;
                    selector9=false;
                  });
                },
                selected: selector7,
              ),
              ListTile(
                leading: Icon(Icons.assignment,color: Colors.grey,),
                title: Text("Term & Condition",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[100],
                trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=false;
                    selector4=false;
                    selector5=false;
                    selector6=false;
                    selector7=false;
                    selector8=true;
                    selector9=false;
                  });
                },
                selected: selector8,
              ),
              ListTile(
                leading: Icon(Icons.logout,color: Colors.grey,),
                title: Text("Logout",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                horizontalTitleGap: 1,
                selectedTileColor: Colors.grey[200],
                //trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                onTap: (){
                  setState(() {
                    selector1=false;
                    selector2=false;
                    selector3=false;
                    selector4=false;
                    selector5=false;
                    selector6=false;
                    selector7=false;
                    selector8=false;
                    selector9=true;
                  });
                  _showMyDialog();
                },
                selected: selector9,

              )



            ],
          )
        ],
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Sure you want to logout?",style: TextStyle(color: Colors.black,fontSize: 16),textAlign: TextAlign.center,),
            backgroundColor: Colors.white,
            actions: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text("Cancle",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()async{
                          sharedlogindata=await SharedPreferences.getInstance();
                          sharedlogindata.setBool('login', true);
                          sharedlogindata.clear();
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()),ModalRoute.withName('/'));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width*.2,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(5),
                            color: Colors.blue
                          ),
                          child: Center(
                            child: Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10,)
                ],
              )
            ],
          );
        }
    );
  }
}
