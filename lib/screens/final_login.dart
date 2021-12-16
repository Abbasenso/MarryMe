// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:f_matrimony/basic_details/basicdetails1.dart';
import 'package:f_matrimony/basic_details/imageupload.dart';
import 'package:f_matrimony/home_pages/homepage.dart';
import 'package:f_matrimony/home_pages/matches.dart';
import 'package:f_matrimony/home_pages/waitforactivation.dart';
import 'package:f_matrimony/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class FinalLogin extends StatefulWidget {
  const FinalLogin({Key key}) : super(key: key);

  @override
  _FinalLoginState createState() => _FinalLoginState();
}

class _FinalLoginState extends State<FinalLogin> {
   var userdata;
  //File im;
  final k1= GlobalKey<FormState>();
  String emailorphone="";
  String password="";
  TextEditingController email_or_phone =TextEditingController();
  TextEditingController pass_word =TextEditingController();

  //SharedPreference functions
   SharedPreferences sharedlogindata;
  //bool newuser;
  //String currentloginuserid="";
  int isornot=0;
  //String haslogindata,userid,fname,lname,gender,email,phone;

  // void check_if_already_login() async {
  //
  //   // await fetchData().then((value) {
  //   //   //debugPrint('type-->$value');
  //   //   logindata=value;
  //   //   print("registration:$logindata");
  //   //
  //   //   // do functions requiring value parameter
  //   // });
  //   //
  //   // await basicdetailsdatafetch().then((value) {
  //   //   //debugPrint('type-->$value');
  //   //   basicdetailsdata=value;
  //   //   print("details: $basicdetailsdata");
  //   //
  //   //   // do functions requiring value parameter
  //   // });
  //   //
  //   // await profileimagedatafetch().then((value) {
  //   //   //debugPrint('type-->$value');
  //   //   profileimagedata=value;
  //   //   print("image:$profileimagedata");
  //   //
  //   //   // do functions requiring value parameter
  //   // });
  //    sharedlogindata = await SharedPreferences.getInstance();
  //   // setState(() {
  //   //   currentloginuserid=sharedlogindata.getString('userid') ?? '';
  //   // });
  //   // isuseridinbasicdetails();
  //   // isuseridinprofileimage();
  //
  //   newuser = (sharedlogindata.getBool('login') ?? true);
  //   print(newuser);
  //   if (newuser == false) {
  //
  //     await fetchData().then((value) {
  //       //debugPrint('type-->$value');
  //       logindata=value;
  //       print("registration:$logindata");
  //
  //       // do functions requiring value parameter
  //     });
  //
  //     await basicdetailsdatafetch().then((value) {
  //       //debugPrint('type-->$value');
  //       basicdetailsdata=value;
  //       print("details: $basicdetailsdata");
  //
  //       // do functions requiring value parameter
  //     });
  //
  //     await profileimagedatafetch().then((value) {
  //       //debugPrint('type-->$value');
  //       profileimagedata=value;
  //       print("image:$profileimagedata");
  //
  //       // do functions requiring value parameter
  //     });
  //     sharedlogindata = await SharedPreferences.getInstance();
  //     setState(() {
  //       currentloginuserid=sharedlogindata.getString('userid') ?? '';
  //     });
  //     isuseridinbasicdetails();
  //     isuseridinprofileimage();
  //
  //     print(currentloginuserid);
  //     // isuseridinbasicdetails();
  //     // isuseridinprofileimage();
  //
  //     if(useridinbasicdetails ==0 && useridinprofileimage ==0)
  //     {
  //       String uid=sharedlogindata.getString('userid') ?? '';
  //       String email=sharedlogindata.getString('emailid') ?? '';
  //       print(uid);
  //       print(email);
  //        Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => Basicdetails1(uid,email),
  //         ),
  //       );
  //     }
  //     else if(useridinbasicdetails==1 && useridinprofileimage==0)
  //     {
  //       String useridforimageuploadpage=sharedlogindata.getString('userid') ?? '';
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) =>  imageUpload(useridforimageuploadpage),
  //         ),
  //       );
  //     }
  //     else {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => HomePage()));
  //     }
  //
  //
  //   }
  // }




  // var profileimagedata=[];
  // dynamic profileimagedatafetch() async {
  //   final url="https://marryme.world/vibaha_backend/profileimagedatafetch.php";
  //   var _userData=[];
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     //debugPrint(response.body);
  //     final jsonData = jsonDecode(response.body) as List;
  //     // setState(() {
  //     //  userData= jsonData;
  //     // });
  //     _userData=jsonData;
  //     //print(_userData);
  //     return _userData;
  //   }
  //   catch (err) {
  //     print(err);
  //   }
  // }


  // var basicdetailsdata=[];
  // dynamic basicdetailsdatafetch() async {
  //   final url="http://marryme.world/vibaha_backend/basicdetailsdatafetch.php";
  //   var _userData=[];
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     //debugPrint(response.body);
  //     final jsonData = jsonDecode(response.body) as List;
  //     // setState(() {
  //     //  userData= jsonData;
  //     // });
  //     _userData=jsonData;
  //     //print(_userData);
  //     return _userData;
  //   }
  //   catch (err) {
  //     print(err);
  //   }
  // }



  // int useridinbasicdetails=0;
  // int useridinprofileimage=0;
  // void isuseridinbasicdetails() {
  //   // sharedlogindata = await SharedPreferences.getInstance();
  //   // setState(() {
  //   //   currentloginuserid=sharedlogindata.getString('userid') ?? '';
  //   // });
  //   for(var i=0;i<basicdetailsdata.length;i++) {
  //     if (basicdetailsdata.isNotEmpty && basicdetailsdata[i]["user_id"]==currentloginuserid) {
  //       // setState(() {
  //       //   useridinbasicdetails = 1;
  //       // });
  //       // print("useridinbasicdetails:$useridinbasicdetails");
  //       useridinbasicdetails=1;
  //       print("useridinbasicdetails:$useridinbasicdetails");
  //       break;
  //     }
  //     else {
  //       // setState(() {
  //       //   useridinbasicdetails = useridinbasicdetails;
  //       // });
  //       // print("useridinbasicdetails:$useridinbasicdetails");
  //       useridinbasicdetails=useridinbasicdetails;
  //       print("useridinbasicdetails:$useridinbasicdetails");
  //     }
  //   }
  // }


  // void isuseridinprofileimage(){
  //   // sharedlogindata = await SharedPreferences.getInstance();
  //   // setState(() {
  //   //   currentloginuserid = sharedlogindata.getString('userid') ?? '';
  //   // });
  //   for(var i=0;i<profileimagedata.length;i++) {
  //   if (profileimagedata.isNotEmpty && profileimagedata[i]["userid"] == currentloginuserid) {
  //     // setState(() {
  //     //   useridinprofileimage = 1;
  //     //   print("useridinprofileimage:$useridinprofileimage");
  //     // });
  //     useridinprofileimage=1;
  //     print("useridinprofileimage:$useridinprofileimage");
  //     break;
  //   }
  //
  //   else {
  //     // setState(() {
  //     //   useridinprofileimage = useridinprofileimage;
  //     //   print("useridinprofileimage:$useridinprofileimage");
  //     // });
  //     useridinprofileimage=useridinprofileimage;
  //     print("useridinprofileimage:$useridinprofileimage");
  //   }
  // }
  // }

   userlogin()async{
    if(userdata.isNotEmpty){
      if(!userdata[0].containsKey("city")|| !userdata[0].containsKey("profilepic")){
        sharedlogindata=await SharedPreferences.getInstance();
         setState((){
          sharedlogindata.setString("userid", "${userdata[0]["user_id"]}");
          sharedlogindata.setString("firstname", "${userdata[0]["first_name"]}");
          sharedlogindata.setString("lastname", "${userdata[0]["last_name"]}");
          sharedlogindata.setString("gender", "${userdata[0]["gender"]}");
          sharedlogindata.setString("religion", "${userdata[0]["religion"]}");
          sharedlogindata.setString("community", "${userdata[0]["community"]}");
          sharedlogindata.setString("emailid", "${userdata[0]["email_id"]}");
          sharedlogindata.setString("mobileno", "${userdata[0]["mobile_no"]}");
          sharedlogindata.setString("dob", "${userdata[0]["dob"]}");
          sharedlogindata.setString("duration", "${userdata[0]["duration"]}");
          sharedlogindata.setString("status", "${userdata[0]["status"]}");
          sharedlogindata.setString("username", "${userdata[0]["username"]}");
          sharedlogindata.setString("password", "${userdata[0]["password"]}");
          sharedlogindata.setBool('login', false);
          isornot=1;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) =>  Basicdetails1(userdata[0]["user_id"],userdata[0]["email_id"],userdata[0]["first_name"],userdata[0]["last_name"],userdata[0]["religion"],userdata[0]["community"]),
        ),
        );
      }
      else if(userdata[0].containsKey("city") && !userdata[0].containsKey("profilepic")){
        sharedlogindata=await SharedPreferences.getInstance();
         setState((){
          sharedlogindata.setString("userid", "${userdata[0]["user_id"]}");
          sharedlogindata.setString("firstname", "${userdata[0]["first_name"]}");
          sharedlogindata.setString("lastname", "${userdata[0]["last_name"]}");
          sharedlogindata.setString("gender", "${userdata[0]["gender"]}");
          sharedlogindata.setString("religion", "${userdata[0]["religion"]}");
          sharedlogindata.setString("community", "${userdata[0]["community"]}");
          sharedlogindata.setString("emailid", "${userdata[0]["email_id"]}");
          sharedlogindata.setString("mobileno", "${userdata[0]["mobile_no"]}");
          sharedlogindata.setString("dob", "${userdata[0]["dob"]}");
          sharedlogindata.setString("duration", "${userdata[0]["duration"]}");
          sharedlogindata.setString("status", "${userdata[0]["status"]}");
          sharedlogindata.setString("username", "${userdata[0]["username"]}");
          sharedlogindata.setString("password", "${userdata[0]["password"]}");
          sharedlogindata.setBool('login', false);
          isornot=1;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  imageUpload(userdata[0]["user_id"]),
          ),
        );
      }
      else{
        sharedlogindata=await SharedPreferences.getInstance();
        setState((){
          sharedlogindata.setString("userid", "${userdata[0]["user_id"]}");
          sharedlogindata.setString("firstname", "${userdata[0]["first_name"]}");
          sharedlogindata.setString("lastname", "${userdata[0]["last_name"]}");
          sharedlogindata.setString("gender", "${userdata[0]["gender"]}");
          sharedlogindata.setString("religion", "${userdata[0]["religion"]}");
          sharedlogindata.setString("community", "${userdata[0]["community"]}");
          sharedlogindata.setString("emailid", "${userdata[0]["email_id"]}");
          sharedlogindata.setString("mobileno", "${userdata[0]["mobile_no"]}");
          sharedlogindata.setString("dob", "${userdata[0]["dob"]}");
          sharedlogindata.setString("duration", "${userdata[0]["duration"]}");
          sharedlogindata.setString("status", "${userdata[0]["status"]}");
          sharedlogindata.setString("username", "${userdata[0]["username"]}");
          sharedlogindata.setString("password", "${userdata[0]["password"]}");
          sharedlogindata.setString("country", "${userdata[0]["country"]}");
          sharedlogindata.setString("state", "${userdata[0]["state"]}");
          sharedlogindata.setString("city", "${userdata[0]["city"]}");
          sharedlogindata.setString("residencystatus", "${userdata[0]["residency_status"]}");
          sharedlogindata.setString("maritialstatus", "${userdata[0]["maritialstatus"]}");
          sharedlogindata.setString("havechildren", "${userdata[0]["have_childrean"]}");
          sharedlogindata.setString("noofchild", "${userdata[0]["no_of_child"]}");
          sharedlogindata.setString("diet", "${userdata[0]["diet"]}");
          sharedlogindata.setString("height", "${userdata[0]["height"]}");
          sharedlogindata.setString("qualification", "${userdata[0]["qualification"]}");
          sharedlogindata.setString("collegename", "${userdata[0]["collegename"]}");
          sharedlogindata.setString("workwith", "${userdata[0]["workwith"]}");
          sharedlogindata.setString("profession", "${userdata[0]["profession"]}");
          sharedlogindata.setString("professionaddress", "${userdata[0]["profession_address"]}");
          sharedlogindata.setString("annualincome", "${userdata[0]["annualincome"]}");
          sharedlogindata.setString("bodytype", "${userdata[0]["bodytype"]}");
          sharedlogindata.setString("identitytype", "${userdata[0]["identity_type"]}");
          sharedlogindata.setString("profilepic", "${userdata[0]["profilepic"]}");
          sharedlogindata.setBool('login', false);
          isornot=1;
        });
        if(userdata[0]["status"] !='0'){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HomePage(),
            ),
          );
        }
        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  waitForActivation(),
            ),
          );
        }
      }
    }
    else{
            setState(() {
              isornot=isornot;
            });
          }
    }


  // Future <void> userLogin( a)async{
  //   List ud=a;
  //   var i;
  //   for(i=0;i<ud.length;i++){
  //     if(emailorphone=="${ud[i]["username"]}" && password=="${ud[i]["password"]}"){
  //
  //       // sharedlogindata=await SharedPreferences.getInstance() ;
  //       //sharedlogindata.setBool('login', false);
  //       //print(sharedlogindata.getBool('login'));
  //       // setState(() {
  //       //   currentloginuserid="${ud[i]["user_id"]}";
  //       // });
  //       currentloginuserid="${ud[i]["user_id"]}";
  //       print(currentloginuserid);
  //        isuseridinbasicdetails();
  //        isuseridinprofileimage();
  //       if(useridinbasicdetails==0 && useridinprofileimage==0)
  //       {
  //         sharedlogindata=await SharedPreferences.getInstance();
  //         await sharedlogindata.setBool('login', false);
  //         setState(() {
  //
  //         });
  //         print(sharedlogindata.getBool('login'));
  //         //SharedPreferences.setMockInitialValues({});
  //         sharedlogindata.setString('userid', "${ud[i]["user_id"]}");
  //         sharedlogindata.setString('emailid', "${ud[i]["email_id"]}");
  //         sharedlogindata.setString('firstname', "${ud[i]["first_name"]}");
  //         sharedlogindata.setString('lastname', "${ud[i]["last_name"]}");
  //         sharedlogindata.setString('gender', "${ud[i]["gender"]}");
  //         sharedlogindata.setString('religion', "${ud[i]["religion"]}");
  //         sharedlogindata.setString('community', "${ud[i]["community"]}");
  //
  //         //sharedlogindata.setString('password', password);
  //         setState(() {
  //           isornot=1;
  //         });
  //         Navigator.pushReplacement(context, MaterialPageRoute(
  //             builder: (context) =>  Basicdetails1(ud[i]["user_id"],ud[i]["email_id"],ud[i]["first_name"],ud[i]["last_name"],ud[i]["religion"],ud[i]["community"]),
  //           ),
  //         );
  //       }
  //       else if(useridinbasicdetails==1 && useridinprofileimage==0)
  //         {
  //           sharedlogindata=await SharedPreferences.getInstance() ;
  //           await sharedlogindata.setBool('login', false);
  //           setState(() {
  //
  //           });
  //           print(sharedlogindata.getBool('login'));
  //           //SharedPreferences.setMockInitialValues({});
  //           sharedlogindata.setString('userid', "${ud[i]["user_id"]}");
  //           sharedlogindata.setString('emailid', "${ud[i]["email_id"]}");
  //           sharedlogindata.setString('firstname', "${ud[i]["first_name"]}");
  //           sharedlogindata.setString('lastname', "${ud[i]["last_name"]}");
  //           sharedlogindata.setString('gender', "${ud[i]["gender"]}");
  //           sharedlogindata.setString('religion', "${ud[i]["religion"]}");
  //           sharedlogindata.setString('community', "${ud[i]["community"]}");
  //           //sharedlogindata.setString('password', password);
  //           setState(() {
  //             isornot=1;
  //           });
  //           Navigator.pushReplacement(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) =>  imageUpload(ud[i]["user_id"]),
  //             ),
  //           );
  //         }
  //       else
  //         {
  //           sharedlogindata=await SharedPreferences.getInstance() ;
  //           await sharedlogindata.setBool('login', false);
  //           setState(() {
  //
  //           });
  //           print(sharedlogindata.getBool('login'));
  //           //SharedPreferences.setMockInitialValues({});
  //           sharedlogindata.setString('userid', "${ud[i]["user_id"]}");
  //           sharedlogindata.setString('emailid', "${ud[i]["email_id"]}");
  //           sharedlogindata.setString('active',"${ud[i]["status"]}");
  //           sharedlogindata.setString('firstname', "${ud[i]["first_name"]}");
  //           sharedlogindata.setString('lastname', "${ud[i]["last_name"]}");
  //           sharedlogindata.setString('gender', "${ud[i]["gender"]}");
  //           sharedlogindata.setString('religion', "${ud[i]["religion"]}");
  //           sharedlogindata.setString('community', "${ud[i]["community"]}");
  //           //sharedlogindata.setString('password', password);
  //           setState(() {
  //             isornot=1;
  //           });
  //           if(ud[i]["status"] !='0'){
  //             Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) =>  HomePage(),
  //               ),
  //             );
  //           }
  //           else{
  //             Navigator.pushReplacement(
  //               context,
  //               MaterialPageRoute(
  //                 builder: (context) =>  waitForActivation(),
  //               ),
  //             );
  //           }
  //
  //
  //         }
  //       break;
  //     }
  //     else{
  //       setState(() {
  //         isornot=isornot;
  //       });
  //     }
  //   }
  // }
  showSnackbar(){
    if(isornot==1){
      final snackBar1 = SnackBar(
        content: Text("Login Success",style: TextStyle(color: Colors.green,fontSize: 12),),
        action: SnackBarAction(
          label: "Done",
          textColor: Colors.green,
          onPressed: (){

          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }
    else{
      final snackBar2 = SnackBar(
        content: Text("Either username or password is wrong",style: TextStyle(color: Colors.red,fontSize: 12),),
        action: SnackBarAction(
          label: "ERROR!",
          textColor: Colors.red,
          onPressed: (){

          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar2);
    }
  }


  // var logindata=[];
  // dynamic fetchData() async {
  //   final url="http://marryme.world/vibaha_backend/registrationdatafetch.php";
  //   var _userData=[];
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     //debugPrint(response.body);
  //     final jsonData = jsonDecode(response.body) as List;
  //     // setState(() {
  //     //  userData= jsonData;
  //     // });
  //     _userData=jsonData;
  //     //print(_userData);
  //     return _userData;
  //   }
  //   catch (err) {
  //     print(err);
  //   }
  // }

  //  void initState()  {
  //   // TODO: implement initState
  //    super.initState();
  //
  //     fetchData().then((value) {
  //     //debugPrint('type-->$value');
  //     logindata=value;
  //     print("registration:$logindata");
  //
  //     // do functions requiring value parameter
  //   });
  //
  //    basicdetailsdatafetch().then((value) {
  //     //debugPrint('type-->$value');
  //     basicdetailsdata=value;
  //     print("details: $basicdetailsdata");
  //
  //     // do functions requiring value parameter
  //   });
  //
  //    profileimagedatafetch().then((value) {
  //     //debugPrint('type-->$value');
  //     profileimagedata=value;
  //     print("image:$profileimagedata");
  //
  //     // do functions requiring value parameter
  //   });
  //    //isuseridinbasicdetails();
  //    //isuseridinprofileimage();
  //
  //     //check_if_already_login();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: k1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: MediaQuery.of(context).size.height*.1,
                width:MediaQuery.of(context).size.width*.2,

                child: Image(image: AssetImage("image/splashscreenlogo.png"),
                  fit: BoxFit.fill,
                )
            ),
            Center(child: Text("Welcome Back",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),)),
            SizedBox(height: 3,),
            Text("Login to your account",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: MediaQuery.of(context).size.height*.06,
                child: TextFormField(
                  validator: (value){
                    if(email_or_phone.text.length<=0){
                      return 'Please enter your reg email or phone';
                    }
                    return null;
                  },
                  enableInteractiveSelection: false,
                  controller: email_or_phone,
                  decoration: InputDecoration(
                    labelText: "Username",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (value){
                    setState(() {
                      emailorphone=value;
                    });
                  },
                ),
              ),
            ),



            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                height: MediaQuery.of(context).size.height*.06,
                child: TextFormField(
                  validator: (value){
                    if(pass_word.text.length<=0){
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  enableInteractiveSelection: false,
                  controller: pass_word,
                  decoration: InputDecoration(
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onChanged: (value){
                    setState(() {
                      password=value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
               // children: [
                 // Text("Login with OTP",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),
                 // Text("Forgot password",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 12),),
              //  ],
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: ()async {
               if(k1.currentState.validate()){
                 await sendusernamepassword();
                 //await userLogin(logindata);
                 await userlogin();
                 showSnackbar();
               }
               return null;
              },
              child: Container(
                height: MediaQuery.of(context).size.height*.04,
                width: MediaQuery.of(context).size.width*.2,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(0,10), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.red,Colors.yellow]
                    )
                ),
                child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                    text: "Don't have an account? ",style: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*.03),
                    children:[
                      //TextSpan(text: " Sign Up",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.width*.03,fontWeight: FontWeight.bold)),
                    WidgetSpan(child: GestureDetector(child:Text('Sign Up', style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.width*.03,fontWeight: FontWeight.bold),), onTap: (){
    Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) => login())
    );
    }),),
                      TextSpan(text: " Here for Free",style: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*.03)),
                      //TextSpan(text: " T&C",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.width*.03)),
                    ]
                ),

                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future sendusernamepassword()  async{
    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/userloginData_sharedData.php";
    //json maping user entered detailsbarnali

    Map mapeddate ={
      'username':"$emailorphone",
      'password':"$password",
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddate );
    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("UserDATA: ${data}");
    setState(() {
      userdata=data;
    });
  }
}
