import 'dart:convert';

import 'package:f_matrimony/basic_details/basicdetails1.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:http/http.dart' as http;

class OTP extends StatefulWidget {
  String spid="";
  String profor="";
  String fn="";
  String ln="";
  String gn="";
  String re="";
  String com="";
  String email="";
  String mobile="";
  String dt="";
  String mon="";
  String ye="";
  int rand=0;
  String uname="";
  String pass="";
  OTP(sp,prof,fna,lna,ge,rel,comm,em,mob,dat,mo,year,r,una,pas){
    spid=sp;
    profor=prof;
    fn=fna;
    ln=lna;
    gn=ge;
    re=rel;
    com=comm;
    email=em;
    mobile=mob;
    dt=dat;
    mon=mo;
    ye=year;
    rand=r;
    uname=una;
    pass=pas;
  }
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  TextEditingController otp=TextEditingController();
  String putedCode="";

  var _userData2=[];
  dynamic fetchData() async {
    final url="https://feonnaaherbals.com/vibaha_backend/fetchmaxid.php";
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
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //super.initState();
  //   this.fetchData();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_listOPT();
    fetchData().then((value) {
      //debugPrint('type-->$value');
      _userData2=value;
      print(_userData2);

      // do functions requiring value parameter
    });

  }
 String mid="1";
  void createmaxid(){
    if(_userData2[0]["id"]==null){
      setState(() {
        mid=mid;
      });

    }
    else{
      setState(() {
        mid=_userData2[0]["id"];
      });
    }
  }

  String uid="";
  void createUserid(){
    createmaxid();
    var date=DateTime.now();
    String sp=widget.spid;
    String fn=widget.fn[0];
    String ln=widget.ln[0];
    String day=date.day.toString();
    String mon=date.month.toString();
    String year=date.year.toString();
    String h=date.hour.toString();
    String min=date.minute.toString();
    String mil =date.millisecond.toString();
    String micros=date.microsecond.toString();
    String maxId="$mid";
    setState(() {
      uid="$sp"+"-"+"${fn.toUpperCase()}"+"${ln.toUpperCase()}"+"-"+"$day"+"$mon"+"$year"+"-"+"$maxId";
    });

  }
  var duration;
  void setDuration(){
    var now=DateTime.now();
    setState(() {
      duration=now.add(new Duration(days: 90));
    });
    print("$duration");

  }

  @override
  Widget build(BuildContext context){
    print("${widget.rand}");

  return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              Text("Verification Code",style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Please type the Verification Code",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
              Text("send to +91${widget.mobile}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),

              Container(
                height: MediaQuery.of(context).size.height*.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://www.160seconds.dev/content/images/2021/03/sms-otp.png"),
                    fit: BoxFit.contain
                  )
                )
              ),
              Container(
                height: MediaQuery.of(context).size.height*.05,
                width: MediaQuery.of(context).size.width*.5,
                child:  PinFieldAutoFill(
                  enableInteractiveSelection: false,
                  cursor: Cursor.disabled(),
                  //cursor: Cursor(color: Colors.blue,enabled: true),
                  keyboardType: TextInputType.none,
                  //controller: otp,
                  currentCode: "${widget.rand}",
                  decoration: UnderlineDecoration(
                    lineHeight: 1,
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                  ),
                  codeLength: 4,
                  onCodeSubmitted: (code) {
                    setState(() {
                      putedCode=code;
                    });
                  },
                  // onCodeChanged: (code) {
                  //   if (code!.length == 6) {
                  //     FocusScope.of(context).requestFocus(FocusNode());
                  //   }
                  // },
                ),
              ),
              SizedBox(height: 15,),
              Text("Resend",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  if(widget.rand.toString()==widget.rand.toString()){
                    final snackbar2=new SnackBar(
                      backgroundColor: Colors.black,
                      duration: Duration(seconds: 2),
                      //width: MediaQuery.of(context).size.width*.95,
                      content: Text("Registration successful with verification",style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold),),
                      action: SnackBarAction(
                        label: "Done",
                        textColor: Colors.green,
                        onPressed: (){

                        },
                      ),

                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar2);
                    createUserid();
                    setDuration();
                    print(duration);
                    RegistrationUser();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Basicdetails1(uid,widget.email,widget.fn,widget.ln,widget.re,widget.com)));
                  }
                  else{
                     final snackbar1 =new  SnackBar(
                      backgroundColor: Colors.black,
                      duration: Duration(seconds: 2),
                      //width: MediaQuery.of(context).size.width*.95,
                      content: Text("Not Matched! put Correct OTP",style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),),
                       action: SnackBarAction(
                         label: "ERROR",
                         textColor: Colors.red,
                         onPressed: (){

                         },
                       ),

                    );
                     ScaffoldMessenger.of(context).showSnackBar(snackbar1);
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*.03,
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
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.red,Colors.yellow]
                      )
                  ),
                  child: Center(child: Text("Verify",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                ),
              ),
              //Container(child: Text("${widget.mobile}"),)
            ],
          ),
        ),
      ),
    );
  }

  // // _listOPT()
  // //  async {
  // //    await SmsAutoFill().listenForCode(smsCodeRegexPattern: '\\d{4,6}');
  // }


  Future RegistrationUser()  async{
    String sp_id=widget.spid;
    String profor=widget.profor;
    String firstn=widget.fn;
    String lastn=widget.ln;
    String gend=widget.gn;
    String relig=widget.re;
    String communi=widget.com;
    String email=widget.email;
    String mob=widget.mobile;
    String dob=widget.dt;
    String mobir=widget.mon;
    String yob=widget.ye;
    String username=widget.uname;
    String password=widget.pass;
    //print("$firstn"+"$lastn");


    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/insertdata.php";
    //json maping user entered details

    Map mapeddate ={
      'sp_id_candidate':"$sp_id",
      'user_id':"$uid",
      'profile_for':"$profor",
      'first_name':"$firstn",
      'last_name':"$lastn",
      'gender':"$gend",
      'religion':"$relig",
      'community':"$communi",
      'email_id':"$email",
      'mobile_no':"+91 $mob",
      'dob':"$dob $mobir $yob",
      // 'mob':"$mobir",
      // 'yob':"$yob",
      //'image':"",
      'password':"$password",
      'duratio':"${duration.toString()}",
      'username':"$username",
      'status':"1",
    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddate );
    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");
  }
}