// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:f_matrimony/home_pages/matchedpeopledetails.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  String sharedpreferenceuserid;
  String firstname;
  String lastname;
  String gender;
  var newmatchesdata;
  SharedPreferences sharedlogindata;
  getuseridfromsharedpreference()async {
    sharedlogindata = await SharedPreferences.getInstance();
    setState(() {
      sharedpreferenceuserid = sharedlogindata.getString('userid') ?? '';
      firstname=sharedlogindata.getString('firstname') ?? '';
      lastname=sharedlogindata.getString('lastname') ?? '';
      gender=sharedlogindata.getString('gender') ?? '';
      //password1=logindata.getString('password') ?? '';
    });
    print(sharedpreferenceuserid);
  }

  var profileimagedata;
   dynamic profileimagedatafetch() async {
    final url="https://marryme.world/vibaha_backend/profileimagedatafetch.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }
  String serverimage;
   matchimageindatabase() {
    for (var i = 0; i <profileimagedata.length; i++) {
      if (sharedpreferenceuserid == "${profileimagedata[i]["userid"]}") {
        setState(() {
          serverimage = "${profileimagedata[i]["profilepic"]}";
        });
        print("serverimage:$serverimage");
        break;
      }
      else {
        setState(() {
          serverimage = "";
        });
        print("No server image");
      }
    }
  }

    void initState() {
      // TODO: implement initState
      super.initState();
       profileimagedatafetch().then((value) {
        //debugPrint('type-->$value');
        profileimagedata = value;
        print(profileimagedata);
        getuseridfromsharedpreference().then((value){
          matchimageindatabase();
          newMatches();
          todayMatches();
          allMatches();
        });
       });
    }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leadingWidth: 100,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 5),
      //     child: Text("Home",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
      //   ),
      // ),
      body: ListView(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.start,
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

                             child:serverimage!=null?Image.memory(base64Decode(serverimage),fit: BoxFit.cover,):CircularProgressIndicator(color: Colors.blue,)
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
                                       child:serverimage!=null?Image.memory(base64Decode(serverimage),fit: BoxFit.cover,):Center(
                                         child: CircularProgressIndicator(backgroundColor: Colors.red,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),strokeWidth: 5,),
                                       )
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 105,
                                  left: 35,
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

                                    Text("Edit",style: TextStyle(fontSize:15,color: Colors.blue,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.solid,decorationColor: Colors.blue,decorationThickness: 2),),
                                    SizedBox(width: 10,),
                                    Container(height: 15,width: 1,color: Colors.white,),
                                    SizedBox(width: 10,),
                                    // Container(
                                    //   decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                                    //     child: Icon(Icons.edit_outlined,color: Colors.black,size: 15,)),
                                    Text("Upgrade",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15,decoration: TextDecoration.underline,decorationStyle: TextDecorationStyle.solid,decorationColor: Colors.blue,decorationThickness: 2),)
                                  ],
                                )
                              ],
                            )
                        ],
                      ),
                    ],
                       ),
                  ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(children: [Text("New Matches",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)]),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.22,
                //color: Colors.yellow,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newmatchesdata!=null?newmatchesdata.length:0,
                  itemBuilder: (BuildContext context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>MatchedPeopleDetails(newmatchesdata[index])));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Colors.red,
                          ),

                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*.14,
                                      width: MediaQuery.of(context).size.width*.36,
                                      //color: Colors.red,
                                      child:Image.memory(base64Decode(newmatchesdata[index]["profilepic"]),fit: BoxFit.cover,)
                                    ),
                                    SizedBox(height: 2,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("${newmatchesdata[index]["first_name"]}".toUpperCase()+" "+"${newmatchesdata[index]["last_name"]}"[0].toUpperCase(),style: TextStyle(color: Colors.black,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("${newmatchesdata[index]["height"]}",style: TextStyle(color: Colors.grey,),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text("${newmatchesdata[index]["city"]}",style: TextStyle(color: Colors.grey,),),
                                    )
                                  ],
                                ),

                              ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(children: [Text("Today Matches",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)]),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.22,
                //color: Colors.yellow,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newmatchesdata!=null?newmatchesdata.length:0,
                  itemBuilder: (BuildContext context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>MatchedPeopleDetails(newmatchesdata[index])));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Colors.red,
                          ),

                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: MediaQuery.of(context).size.height*.14,
                                      width: MediaQuery.of(context).size.width*.36,
                                      //color: Colors.red,
                                      child:Image.memory(base64Decode(newmatchesdata[index]["profilepic"]),fit: BoxFit.cover,)
                                  ),
                                  SizedBox(height: 2,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${newmatchesdata[index]["first_name"]}".toUpperCase()+" "+"${newmatchesdata[index]["last_name"]}"[0].toUpperCase(),style: TextStyle(color: Colors.black,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${newmatchesdata[index]["height"]}",style: TextStyle(color: Colors.grey,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${newmatchesdata[index]["city"]}",style: TextStyle(color: Colors.grey,),),
                                  )
                                ],
                              ),

                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(children: [Text("All Matches",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)]),
              ),
              Container(
                height: MediaQuery.of(context).size.height*.22,
                //color: Colors.yellow,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: newmatchesdata!=null?newmatchesdata.length:0,
                  itemBuilder: (BuildContext context,index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>MatchedPeopleDetails(newmatchesdata[index])));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height*.22,
                          width: MediaQuery.of(context).size.width*.36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //color: Colors.red,
                          ),

                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: MediaQuery.of(context).size.height*.14,
                                      width: MediaQuery.of(context).size.width*.36,
                                      //color: Colors.red,
                                      child:Image.memory(base64Decode(newmatchesdata[index]["profilepic"]),fit: BoxFit.cover,)
                                  ),
                                  SizedBox(height: 2,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${newmatchesdata[index]["first_name"]}".toUpperCase()+" "+"${newmatchesdata[index]["last_name"]}"[0].toUpperCase(),style: TextStyle(color: Colors.black,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${newmatchesdata[index]["height"]}",style: TextStyle(color: Colors.grey,),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${newmatchesdata[index]["city"]}",style: TextStyle(color: Colors.grey,),),
                                  )
                                ],
                              ),

                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 5,)


            ],
          ),
        ],
      ),
    );
  }
  Future newMatches()  async{
    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/newmatchesdatafetch.php";
    //json maping user entered details

    Map mapeddate ={
      'userid':"$sharedpreferenceuserid",
      'gender':"$gender"
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddate );
    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("DATA: ${data}");
    setState(() {
     newmatchesdata=data;
    });

}

  Future todayMatches()  async{
    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/todaymatchesdatafetch.php";
    //json maping user entered details

    Map mapeddate ={
      'userid':"$sharedpreferenceuserid",
      'gender':"$gender"
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddate );
    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("DATA: ${data}");
    setState(() {
      newmatchesdata=data;
    });

  }
  Future allMatches()  async{
    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/allmatchesdatafetch.php";
    //json maping user entered details

    Map mapeddate ={
      'userid':"$sharedpreferenceuserid",
      'gender':"$gender"
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddate );
    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("DATA: ${data}");
    setState(() {
      newmatchesdata=data;
    });

  }
}




// // @dart=2.9
// import 'dart:convert';
// import 'dart:io';
// import 'dart:ui';
//
// import 'package:f_matrimony/home_pages/contactFilters.dart';
// import 'package:f_matrimony/home_pages/partnerPreference.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart'as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MyHome extends StatefulWidget {
//   // File pro_im;
//   // MyHome(imag){
//   //   pro_im=imag;
//   // }
//
//
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//
//
//
//
//   String sharedpreferenceuserid;
//   SharedPreferences sharedlogindata;
//   getuseridfromsharedpreference()async {
//     sharedlogindata = await SharedPreferences.getInstance();
//     setState(() {
//       sharedpreferenceuserid = sharedlogindata.getString('userid') ?? '';
//       //password1=logindata.getString('password') ?? '';
//     });
//   }
//
//   var profileimagedata=[];
//   dynamic profileimagedatafetch() async {
//     final url="https://feonnaaherbals.com/vibaha_backend/profileimagedatafetch.php";
//     var _userData=[];
//     try {
//       final response = await http.get(Uri.parse(url));
//       //debugPrint(response.body);
//       final jsonData = jsonDecode(response.body) as List;
//       // setState(() {
//       //  userData= jsonData;
//       // });
//       _userData=jsonData;
//       print(_userData);
//       return _userData;
//     }
//     catch (err) {
//       print(err);
//     }
//   }
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     profileimagedatafetch().then((value) {
//       //debugPrint('type-->$value');
//       profileimagedata=value;
//       print(profileimagedata);
//     });
//     getuseridfromsharedpreference();
//     matchimageindatabase();
//   }
//   String serverimage;
//   void matchimageindatabase(){
//     for(var i=0;i<profileimagedata.length;i++){
//       if(sharedpreferenceuserid == "${profileimagedata[i]["userid"]}"){
//         setState(() {
//           serverimage="${profileimagedata[i]["image"]}";
//
//         });
//         break;
//       }
//       else{
//         setState(() {
//           serverimage="";
//         });
//       }
//     }
//   }
//
//
//   File _image ;
//   final picker = ImagePicker();
//
//   Future getImage()async{
//     final pickedFile1 = await picker.getImage(source: ImageSource.camera,preferredCameraDevice: CameraDevice.rear,);
//
//     setState(() {
//       _image = File(pickedFile1.path);
//     });
//   }
//
//   Future getImage1()async{
//     final pickedFile2 = await picker.getImage(source: ImageSource.gallery);
//
//     setState(() {
//       _image = File(pickedFile2.path);
//     });
//   }
//
//
//
//
//
//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Choose a Option',style: TextStyle(fontSize: 15),),
//           actions: <Widget>[
//             Center(
//               child: Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.rectangle,
//                                   borderRadius: BorderRadius.circular(5),
//                                   border: Border.all(color: Colors.grey,width: .5),
//                                   image: DecorationImage(
//                                     image: NetworkImage("https://i.pinimg.com/originals/8a/76/96/8a7696cb9ac02d0ea26945a8e563b04b.jpg"),
//                                     fit: BoxFit.cover
//                                   )
//                                 ),
//
//                               ),
//                               onTap:(){
//                                 getImage();
//                                 Navigator.pop(context);
//                               }
//                             ),
//                             Text("Camera")
//                           ],
//                         ),
//                         Column(mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               child: Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey[350],
//                                     shape: BoxShape.rectangle,
//                                     borderRadius: BorderRadius.circular(5),
//                                     border: Border.all(color: Colors.grey,width: .5),
//                                     image: DecorationImage(
//                                         image: NetworkImage("https://cdn-icons-png.flaticon.com/512/1040/1040241.png"),
//                                         fit: BoxFit.contain
//                                     )
//                                 ),
//                               ),
//                               onTap:(){
//                                 getImage1();
//                                 Navigator.pop(context);
//                               }
//                             ),
//                             Text("Gallery")
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Cancel",style: TextStyle(color: Colors.blue),),
//                     ),
//
//                   ],
//                 ),
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   int notification=0;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       //backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         toolbarHeight: 30,
//         leading: Center(
//           child: Text("F-Shaadi",
//             style: TextStyle(
//               color: Colors.red,
//               fontWeight: FontWeight.bold
//           ),),
//         ),
//         leadingWidth: 100,
//         automaticallyImplyLeading: true,
//         elevation: 0,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: Stack(children: [Icon(Icons.notifications_none,color: Colors.grey,),
//               Positioned(
//                   left: 13,
//                   top: 0,
//                   right: 0,
//                   bottom: 17,
//                   child:Container(
//                     //height: 2,
//                     //width: 2,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: Text("${notification.toString()}", style: TextStyle(color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 12,
//                       )
//                       ),
//                     ),
//                   )
//               ),
//             ]),
//           )
//
//         ],
//       ),
//       body: ListView(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height*.25,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   // image: DecorationImage(
//                   //   image: _image==null?Text(""):Image.file(_image),
//                   //   colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.07), BlendMode.dstATop),
//                   //   fit: BoxFit.cover
//                   // ),
//                     color: const Color(0xff7c94b6),
//                 ),
//                 child:
//                    Stack(
//                      children: [
//                        Container(
//                          height: MediaQuery.of(context).size.height*.25,
//                          width: MediaQuery.of(context).size.width,
//
//                          child:serverimage==null?Text(""):Image.memory(base64Decode("$serverimage")),
//                          //Image.memory(base64Decode(serverimage),fit: BoxFit.contain,)
//                          //_image==null?Image.file(widget.pro_im,fit: BoxFit.cover,):Image.file(_image,fit: BoxFit.cover,),
//                        ),
//                        Container(
//                          height: MediaQuery.of(context).size.height*.25,
//                          width: MediaQuery.of(context).size.width,
//                          decoration: BoxDecoration(
//
//                            //image: _image==null?Image.file(widget.pro_im,fit: BoxFit.cover,):Image.file(_image,fit: BoxFit.cover,),
//
//                          ),
//                          child: new BackdropFilter(
//                               filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                               child: new Container(
//                                 height: MediaQuery.of(context).size.height*.25,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
//                        ),)
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                         SizedBox(width: 20,),
//                         Stack(
//                           overflow: Overflow.visible,
//                           children: [
//                             // CircleAvatar(
//                             //   radius: 50,
//                             //   backgroundColor: Colors.transparent,
//                             //  child: ClipOval(
//                             //    child: _image==null? CircleAvatar():
//                             //    Image.file(_image,fit: BoxFit.contain,width: 50,height: 50,),
//                             //  )
//                             // ),
//                             Container(
//                               height: 80,
//                               width: 80,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 //color: Colors.white
//                                 color: Colors.white,
//                                 // image: DecorationImage(
//                                 //   image: AssetImage("image/profile.jpg"),
//                                 //   fit: BoxFit.cover,
//                                 //     colorFilter: new ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstIn)
//                                 // )
//                               ),
//                               child:serverimage==null?Text(""):Image.memory(base64Decode(serverimage),fit: BoxFit.contain,)
//                               //_image==null?Image.file(widget.pro_im,fit: BoxFit.contain,):Image.file(_image,fit: BoxFit.contain,)
//
//                             ),
//                             Positioned(
//                               top: 65,
//                               left: 32,
//                               child: GestureDetector(
//                                 onTap: (){_showMyDialog();
//     },
//                                 child: Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.blue
//                                   ),
//                                   child: Icon(Icons.add,color: Colors.white,),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(width: 25,),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text("Sambhu Mandal",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//                             SizedBox(height: 5,),
//                             Text("SM821786MD",style: TextStyle(color: Colors.white),),
//                             Text("Account - Free",style: TextStyle(color: Colors.white),),
//                             SizedBox(height: 10,),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//
//                                 Text("Edit",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//                                 SizedBox(width: 5,),
//                                 Container(
//                                   decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
//                                     child: Icon(Icons.edit_outlined,color: Colors.black,size: 15,)),
//                               ],
//                             )
//                           ],
//                         )
//                     ],
//                   ),
//                 ],
//                    ),
//               ),
//               SizedBox(height: 20,),
//               Padding(
//                 padding: const EdgeInsets.only(left: 5),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text("Options & Settings",style: TextStyle(fontWeight: FontWeight.bold),),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 5,),
//               Container(
//                 color: Colors.white,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.group,color: Colors.grey,),
//                       selectedTileColor: Colors.grey,
//                       minLeadingWidth: 15,
//                       title: Text("Partner Preferences",style: TextStyle(fontSize: 15),),
//                       trailing: Icon(Icons.arrow_forward_ios,size: 15),
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) =>  PartnerPreference())
//                         );
//                       },
//                     ),
//                     Divider(color: Colors.grey,thickness: .2,),
//                     ListTile(
//                       leading: Icon(Icons.filter_alt_sharp,color: Colors.grey,),
//                       selectedTileColor: Colors.grey,
//                       minLeadingWidth: 15,
//                       title: Text("Contact Filters",style: TextStyle(fontSize: 15),),
//                       trailing: Icon(Icons.arrow_forward_ios,size: 15),
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(
//                             builder: (context) =>  ContactFilters())
//                         );
//                       },
//                     ),
//                     Divider(color: Colors.grey,thickness: .2,),
//                     ListTile(
//                       leading: Icon(Icons.settings,color: Colors.grey,),
//                       selectedTileColor: Colors.grey,
//                       minLeadingWidth: 15,
//                       title: Text("Account Settings",style: TextStyle(fontSize: 15),),
//                       trailing: Icon(Icons.arrow_forward_ios,size: 15),
//                       onTap: (){
//
//                       },
//                     ),
//                     Divider(color: Colors.grey,thickness: .2,),
//                     ListTile(
//                       leading: Icon(Icons.help,color: Colors.grey,),
//                       selectedTileColor: Colors.grey,
//                       minLeadingWidth: 15,
//                       title: Text("Help & Support",style: TextStyle(fontSize: 15),),
//                       trailing: Icon(Icons.arrow_forward_ios,size: 15),
//                       onTap: (){},
//                     ),
//                     Divider(color: Colors.grey,thickness: .2,),
//                     ListTile(
//                       leading: Icon(Icons.star_rate,color: Colors.grey,),
//                       selectedTileColor: Colors.grey,
//                       minLeadingWidth: 15,
//                       title: Text("Rate the App",style: TextStyle(fontSize: 15),),
//                       subtitle: Text("Make your opinion count"),
//                       trailing: Icon(Icons.arrow_forward_ios,size: 15),
//                       onTap: (){},
//                     ),
//
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 color: Colors.grey[300],
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: const [
//                     SizedBox(height: 10,),
//                     Text("Terms & Conditions",style: TextStyle(fontSize: 12),),
//                     SizedBox(height: 5,),
//                     Text("Copyright @ 1996-2021 F-Shaadi",style: TextStyle(fontSize: 12)),
//                     SizedBox(height: 5,),
//                     Text("Version 9.2.0",style: TextStyle(fontSize: 12)),
//                     SizedBox(height: 10,)
//
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
// }
