// @dart=2.9
import 'dart:async';
import 'dart:convert';


import 'package:f_matrimony/basic_details/basicdetails1.dart';
import 'package:f_matrimony/basic_details/imageupload.dart';
import 'package:f_matrimony/home_pages/homepage.dart';
import 'package:f_matrimony/home_pages/waitforactivation.dart';
import 'package:f_matrimony/screens/final_login.dart';
import 'package:f_matrimony/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  SharedPreferences sharedlogindata;
  bool newuser;
  String currentloginuserid="";
  int isornot=0;
  bool active;

   check_if_already_login() async {
     sharedlogindata=await SharedPreferences.getInstance();
     newuser=sharedlogindata.getBool('login') ?? true;
     print(newuser);
    if (newuser == false) {


      await fetchData().then((value) {
        //debugPrint('type-->$value');
        logindata=value;
        print("registration:$logindata");

        // do functions requiring value parameter
      });

      await basicdetailsdatafetch().then((value) {
        //debugPrint('type-->$value');
        basicdetailsdata=value;
        print("details: $basicdetailsdata");

        // do functions requiring value parameter
      });

      await profileimagedatafetch().then((value) {
        //debugPrint('type-->$value');
        profileimagedata=value;
        print("image:$profileimagedata");

        // do functions requiring value parameter
      });
      sharedlogindata = await SharedPreferences.getInstance();
      currentloginuserid=sharedlogindata.getString('userid') ?? '';
       isuseridinbasicdetails();
       isuseridinprofileimage();
       print(currentloginuserid);

      if(useridinbasicdetails ==0 && useridinprofileimage ==0)
      {
        //await SharedPreferences.setMockInitialValues({'login':newuser});
        String uid=sharedlogindata.getString('userid') ?? '';
        String email=sharedlogindata.getString('emailid') ?? '';
        String rel=sharedlogindata.getString('religion') ?? '';
        String com=sharedlogindata.getString('community') ?? '';
        String fname=sharedlogindata.getString('firstname') ?? '';
        String lname=sharedlogindata.getString('lastname') ?? '';
        print(uid);
        print(email);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Basicdetails1(uid,email,fname,lname,rel,com),
          ),
        );
      }
      else if(useridinbasicdetails==1 && useridinprofileimage==0)
      {
        //await SharedPreferences.setMockInitialValues({'login':newuser});
        String useridforimageuploadpage=sharedlogindata.getString('userid') ?? '';
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  imageUpload(useridforimageuploadpage),
          ),
        );
      }
      else{
        if(sharedlogindata.getString('active')=="active"){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomePage()));
        }
        //await SharedPreferences.setMockInitialValues({'login':newuser});
          else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => waitForActivation()));
        }
      }


    }
    else{
      //await SharedPreferences.setMockInitialValues({'login':newuser});
      Navigator.pushReplacement(context,
              MaterialPageRoute(builder:
                  (context) =>
                  login()));
    }
  }




  var profileimagedata=[];
  dynamic profileimagedatafetch() async {
    final url="http://marryme.world/vibaha_backend/profileimagedatafetch.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      //print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }


  var basicdetailsdata=[];
  dynamic basicdetailsdatafetch() async {
    final url="http://marryme.world/vibaha_backend/basicdetailsdatafetch.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      //print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }



  int useridinbasicdetails=0;
  int useridinprofileimage=0;
  void isuseridinbasicdetails() {
    // sharedlogindata = await SharedPreferences.getInstance();
    // setState(() {
    //   currentloginuserid=sharedlogindata.getString('userid') ?? '';
    // });
    for(var i=0;i<basicdetailsdata.length;i++) {
      if (basicdetailsdata.isNotEmpty && basicdetailsdata[i]["user_id"]==currentloginuserid) {
        // setState(() {
        //   useridinbasicdetails = 1;
        // });
        // print("useridinbasicdetails:$useridinbasicdetails");
        useridinbasicdetails=1;
        print("useridinbasicdetails:$useridinbasicdetails");
        break;
      }
      else {
        // setState(() {
        //   useridinbasicdetails = useridinbasicdetails;
        // });
        // print("useridinbasicdetails:$useridinbasicdetails");
        useridinbasicdetails=useridinbasicdetails;
        print("useridinbasicdetails:$useridinbasicdetails");
      }
    }
  }


  void isuseridinprofileimage(){
    // sharedlogindata = await SharedPreferences.getInstance();
    // setState(() {
    //   currentloginuserid = sharedlogindata.getString('userid') ?? '';
    // });
    for(var i=0;i<profileimagedata.length;i++) {
      if (profileimagedata.isNotEmpty && profileimagedata[i]["userid"] == currentloginuserid) {
        // setState(() {
        //   useridinprofileimage = 1;
        //   print("useridinprofileimage:$useridinprofileimage");
        // });
        useridinprofileimage=1;
        print("useridinprofileimage:$useridinprofileimage");
        break;
      }

      else {
        // setState(() {
        //   useridinprofileimage = useridinprofileimage;
        //   print("useridinprofileimage:$useridinprofileimage");
        // });
        useridinprofileimage=useridinprofileimage;
        print("useridinprofileimage:$useridinprofileimage");
      }
    }
  }
  var logindata=[];
  dynamic fetchData() async {
    final url="http://marryme.world/vibaha_backend/registrationdatafetch.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      //print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 6),
            ()async {
              // SharedPreferences userlogindata=await SharedPreferences.getInstance();
              // bool value=userlogindata.getBool('login') ?? true;
              // String useridvalue=userlogindata.getString('userid') ?? '';
              // SharedPreferences.setMockInitialValues({
              //   'login':value,
              //   'userid':useridvalue
              // });
              await check_if_already_login();
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder:
              //         (context) =>
              //         login()
              //     )
              // );
            }
    );

  }
 static const colorizeColors = [
    Colors.red,
    Colors.blue,
    Colors.orange,
   Colors.purple,
    Colors.yellow,
    Colors.red,
  ];

  static const colorizeTextStyle = TextStyle(

    fontSize: 30.0,
    fontFamily: 'Horizon',
    fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                 height: 200,
                 width: 200,

                child: Image(image: AssetImage("image/splashscreenlogo.png"),
                  fit: BoxFit.fill,
                )
            ),
        AnimatedTextKit(
          animatedTexts: [
            // ColorizeAnimatedText(
            //   ('Vivah.com'),
            //   textStyle: colorizeTextStyle,
            //   colors: colorizeColors,
            // ),
            WavyAnimatedText(
                ("MarryMe"),
              textStyle:colorizeTextStyle,
              //speed: Duration(milliseconds: 250),
              //textAlign: TextAlign.center
            ),
            ColorizeAnimatedText(
              ('MarryMe'),
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
              speed: Duration(milliseconds: 500)
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
          },
        ),


            // Text("F-Shaadi", style: TextStyle(color: Colors.green[900],
            //     fontWeight: FontWeight.bold,
            //     fontSize: 27,
            //     fontStyle: FontStyle.italic),)
          ],
        ),
      ),
    );
  }
}

