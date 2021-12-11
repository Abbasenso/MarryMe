// @dart=2.9
import 'dart:convert';
import 'dart:math';

import 'package:f_matrimony/basic_details/basicdetails1.dart';
import 'package:f_matrimony/screens/reg_otpverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp/flutter_otp.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;

class Registration1 extends StatefulWidget {
  //const Registration1({Key key}) : super(key: key);
  String spid="";
  String profor="";
  String fname="";
  String lname="";
  String gen="";
  String reli="";
  String comm="";
  String uname="";
  String passw="";
  Registration1(sp,pro,fn,ln,gn,rel,com,un,pas){
    spid=sp;
    profor=pro;
    fname=fn;
    lname=ln;
    gen=gn;
    reli=rel;
    comm=com;
    uname=un;
    passw=pas;

  }

  @override
  _Registration1State createState() => _Registration1State();
}

class _Registration1State extends State<Registration1> {
  final k1= GlobalKey<FormState>();
  String countrycode="";
  String emailid="";
  String mobile="";
  String date="";
  String month="";
  String year="";
  String livingin="";
  String ccode="+91";
  int minNumber=1000;
  int maxNumber=6000;


  TextEditingController country_code =TextEditingController();
  TextEditingController email_id =TextEditingController();
  TextEditingController mobile_no =TextEditingController();
  TextEditingController gen =TextEditingController();
  TextEditingController rel =TextEditingController();
  TextEditingController com =TextEditingController();
  TextEditingController date1 =TextEditingController();
  TextEditingController month1 =TextEditingController();
  TextEditingController year1 =TextEditingController();
  TextEditingController living_in =TextEditingController();

  int rand=0;
  int  generateRandom(){
    Random rd=new Random();
    int rand1=0;
    return  rand1=rd.nextInt(8999) + 1000;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      rand=generateRandom();
    });
    fetchData().then((value) {
      //debugPrint('type-->$value');
      logindata=value;
      print("registration:$logindata");

      // do functions requiring value parameter
    });
  }
  var logindata=[];
  dynamic fetchData() async {
    final url="https://feonnaaherbals.com/vibaha_backend/registrationdatafetch.php";
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
  Widget build(BuildContext context) {
    String fname=widget.fname;
    String lname=widget.lname;
    String sponsorid=widget.spid;
    String profilefor=widget.profor;
    String gender=widget.gen;
    String religion=widget.reli;
    String community=widget.comm;
    String username=widget.uname;
    String password=widget.passw;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: BackButton(
      //     color: Colors.grey,
      //     onPressed: (){
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text("F-Shaadi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),),
      //   centerTitle: true,
      // ),
      body: ListView(
        children: [
          Form(
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

                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Great! Now some basic details about",style: TextStyle(color: Colors.black,fontSize: 17,),),
                      Text("you",style: TextStyle(color: Colors.black,fontSize: 17,),)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text("All fields are mendatory",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                        ),
                      ],
                    )),


                SizedBox(height: 5,),



                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.06,
                    child: TextFormField(
                      //autovalidate: false,
                      validator: (value){
                        //String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        //RegExp regExp = new RegExp(p);
                        if(email_id.text==""){
                          return 'Your email is mendatory';
                        }
                        else if(!email_id.text.contains("@gmail.com")){
                          return "Your email is not valid";
                        }
                        else if(!logindata.isEmpty){
                          for(var i=0;i<logindata.length;i++){
                            if(logindata[i]["email_id"]==email_id.text){
                              return 'This email id already has been used';
                            }
                          }

                        }
                        return null;
                      },
                      enableInteractiveSelection: false,
                      controller: email_id,
                      decoration: InputDecoration(
                        labelText: "Email Id",
                        focusedBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.name,
                      onChanged: (value){
                        setState(() {
                          emailid=email_id.text;
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
                    child: Stack(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(country_code.text==''){
                              return 'Please choose your country code';
                            }
                            return null;
                          },
                          enableInteractiveSelection: false,
                          controller: country_code,
                          onChanged: (value){
                            setState(() {
                              countrycode=country_code.text;
                            });
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Country Code",
                            focusedBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          //keyboardType: TextInputType.none,
                          readOnly: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:Text("")
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: DropdownButton<String>(
                                //value: profilefor,
                                icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(color: Colors.white,),
                                onChanged: (String newValue) {
                                  setState(() {
                                    countrycode = newValue;
                                    country_code.text=newValue;
                                  });
                                },
                                items: <String>['India(+91)']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),




                SizedBox(height: 15,),


                Row(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.width*.7,
                        child: TextFormField(
                          validator: (value){
                            if(mobile_no.text.length<=0){
                              return 'Please enter your Mobile no.';
                            }
                            else if(mobile_no.text[0]=="0" ||mobile_no.text[0]=="1"||mobile_no.text[0]=="2"||mobile_no.text[0]=="3"||mobile_no.text[0]=="4"||mobile_no.text[0]=="5" ){
                              return 'Your phone no. is not valid';
                            }
                            else if(!logindata.isEmpty){
                              for(var i=0;i<logindata.length;i++){
                                if(logindata[i]["mobile_no"]==mobile_no.text){
                                  return 'This phone no. already has been used';
                                }
                              }

                            }
                            return null;
                          },
                          enableInteractiveSelection: false,
                          controller: mobile_no,
                          decoration: InputDecoration(
                            labelText: "Mobile No.",
                            focusedBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                            setState(() {
                              mobile=mobile_no.text;
                            });
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                        },
                          child: Icon(
                            Icons.help,
                            //size: 25,
                            color: Colors.grey,
                          )),
                    )
                  ],
                ),


                SizedBox(height:15,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Date of birth",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.width*.3,
                        child: Stack(
                          children: [
                            TextFormField(
                              validator: (value){
                                if(date1.text==''){
                                  return 'Select day';
                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: date1,
                              onChanged: (value){
                                setState(() {
                                  date=date1.text;
                                });
                              },
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "Day",
                                focusedBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              //keyboardType: TextInputType.none,
                              readOnly: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child:Text("")
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: DropdownButton<String>(
                                    //value: profilefor,
                                    icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(color: Colors.white,),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        date = newValue;
                                        date1.text=newValue;
                                      });
                                    },
                                    items: <String>['01','02','03','04','05','06','07','08','09','10',
                                    '11','12','13','14','15','16','17','18','19','20','21','22','23','24',
                                    '25','26','27','28','29','30','31']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),


                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.width*.25,
                        child: Stack(
                          children: [
                            TextFormField(
                              validator: (value){
                                if(month1.text==''){
                                  return 'Select month';
                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: month1,
                              onChanged: (value){
                                setState(() {
                                  month=month1.text;
                                });
                              },
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "Month",
                                focusedBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              //keyboardType: TextInputType.none,
                              readOnly: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child:Text("")
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: DropdownButton<String>(
                                    //value: profilefor,
                                    icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(color: Colors.white,),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        month = newValue;
                                        month1.text=newValue;
                                      });
                                    },
                                    items: <String>['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),



                      Container(
                        height: MediaQuery.of(context).size.height*.06,
                        width: MediaQuery.of(context).size.width*.25,
                        child: Stack(
                          children: [
                            TextFormField(
                              validator: (value){
                                if(year1.text==''){
                                  return 'Select year';
                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: year1,
                              onChanged: (value){
                                setState(() {
                                  year=year1.text;
                                });
                              },
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                labelText: "Year",
                                focusedBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              //keyboardType: TextInputType.none,
                              readOnly: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child:Text("")
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: DropdownButton<String>(
                                    //value: profilefor,
                                    icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.black),
                                    underline: Container(color: Colors.white,),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        year = newValue;
                                        year1.text=newValue;
                                      });
                                    },
                                    items: <String>['1952','1953','1954','1955','1956','1957','1958',
                                    '1958','1959','1960','1961','1962','1963','1964','1965','1966','1967','1968',
                                    '1969','1970','1971','1972','1973','1974','1975','1976','1977','1978','1979',
                                    '1980','1981','1982','1983','1984','1985','1986','1987','1988','1989','1990',
                                    '1991','1992','1993','1994','1995','1996','1997','1998','1999','2000']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),



                SizedBox(height: 15,),




                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.06,
                    child: Stack(
                      children: [
                        TextFormField(
                          validator: (value){
                            if(living_in.text==''){
                              return 'Please select your living country';
                            }
                            return null;
                          },
                          enableInteractiveSelection: false,
                          autofocus: false,
                          controller: living_in,
                          onChanged: (_){
                            setState(() {
                              living_in.text="$livingin";
                            });
                          },
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            labelText: "Living In",
                            focusedBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              //borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          //keyboardType: TextInputType.none,
                          //enabled: false,
                          readOnly: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:Text("")
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: DropdownButton<String>(
                                //value: gender,
                                icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(color: Colors.white,),
                                onChanged: (String newValue) {
                                  setState(() {
                                    livingin = newValue;
                                    living_in.text=newValue;
                                  });
                                },
                                items: <String>['India']
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // SizedBox(height: 20,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: Stack(
                //       children: [
                //         TextFormField(
                //           validator: (value){
                //             if(rel.text==''){
                //               return 'Please choose your religion';
                //             }
                //             return null;
                //           },
                //           enableInteractiveSelection: false,
                //           controller: rel,
                //           onChanged: (_){
                //             setState(() {
                //               rel.text=religion;
                //             });
                //           },
                //           cursorColor: Colors.white,
                //           cursorRadius: Radius.circular(10),
                //           decoration: InputDecoration(
                //             labelText: "Religion",
                //             focusedBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //                 width: 1.0,
                //               ),
                //             ),
                //           ),
                //           keyboardType: TextInputType.none,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Padding(
                //                 padding: const EdgeInsets.only(left: 10),
                //                 child:Text("")
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(right: 10),
                //               child: DropdownButton<String>(
                //                 //value: religion,
                //                 icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //                 iconSize: 24,
                //                 elevation: 16,
                //                 style: const TextStyle(color: Colors.black),
                //                 underline: Container(color: Colors.white,),
                //                 onChanged: (String? newValue) {
                //                   setState(() {
                //                     religion = newValue!;
                //                     rel.text=newValue;
                //                   });
                //                 },
                //                 items: <String>['Hindu','Muslim','Christian','Jain','Sikh','Buddhist','Parsi','Jewish','Other','No Religion','Spiritual-not religious']
                //                     .map<DropdownMenuItem<String>>((String value) {
                //                   return DropdownMenuItem<String>(
                //                     value: value,
                //                     child: Text(value),
                //                   );
                //                 }).toList(),
                //               ),
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),


                // SizedBox(height: 30,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: Stack(
                //       children: [
                //         TextFormField(
                //           validator: (value){
                //             if(com.text==''){
                //               return 'Please choose your community';
                //             }
                //             return null;
                //           },
                //           enableInteractiveSelection: false,
                //           controller: com,
                //           onChanged: (_){
                //             setState(() {
                //               com.text=community;
                //             });
                //           },
                //           cursorColor: Colors.white,
                //           cursorRadius: Radius.circular(10),
                //           decoration: InputDecoration(
                //             labelText: "Community",
                //             focusedBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //                 width: 1.0,
                //               ),
                //             ),
                //             // errorBorder: OutlineInputBorder(
                //             //   borderSide: BorderSide(
                //             //     color: Colors.red,
                //             //     width: 1.0,
                //             //   ),
                //             // )
                //           ),
                //           keyboardType: TextInputType.none,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Padding(
                //                 padding: const EdgeInsets.only(left: 10),
                //                 child:Text("")
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(right: 10),
                //               child: DropdownButton<String>(
                //                 //value: religion,
                //                 icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //                 iconSize: 24,
                //                 elevation: 16,
                //                 style: const TextStyle(color: Colors.black),
                //                 underline: Container(color: Colors.white,),
                //                 onChanged: (String? newValue) {
                //                   setState(() {
                //                     community = newValue!;
                //                     com.text=newValue;
                //                   });
                //                 },
                //                 items: <String>['Hindi','Marathi','Punjabi','Bengali','Gugarati','Urdu','Telugu','Kannada','English'
                //                     'Tamil','Odia','Marwari','Aka','Arabic','Arunachali','Assamese','Awadhi','Baluchi','Bhojpuri','Bhutia',
                //                   'Brahui','Brij','Burmese','Chattisgarhi','Chinese','Coorgi','Dogri','French','Garhwali','Garo',
                //                   'Haryanavi','Himachali/Pahari','Hindko','Kakbarak','Kanauji','Kashmiri','Khandesi','Khasi',
                //                   'Konkani','Koshali','Kumaoni','Kutchi','Ladakhi','Lepcha','Magahi','Maithili','Malay','Malayalam',
                //                   'Manipuri','Miji','Mizo','Monpa','Nepali','Pashto','Persian','Rajasthani','Russian','Sanskrit','Santhali',
                //                   'Seraiki','Sindhi','Sinhala','Sourashtra','Spanish','Swedish','Tagalog','Tulu','Other'
                //                 ]
                //                     .map<DropdownMenuItem<String>>((String value) {
                //                   return DropdownMenuItem<String>(
                //                     value: value,
                //                     child: Text(value),
                //                   );
                //                 }).toList(),
                //               ),
                //             ),
                //
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 15,),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height*.035,
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
                    child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
                  ),
                  onTap: (){
                    if(k1.currentState.validate()){
                      FlutterOtp otp=FlutterOtp();
                      otp.sendOtp(mobile, "Dear $fname your F-Shaadi OTP is $rand.Please don't share anyone",
                          minNumber, maxNumber, ccode);
                      final signature=  SmsAutoFill().getAppSignature;
                      print(signature);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                        =>OTP(sponsorid,profilefor,fname,lname,gender,religion,community,emailid,mobile,date,month,year,rand,username,password)

                        ));
                    }
                    else{
                      "Missing fields";
                    }
                  },
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  RichText(text: TextSpan(
                    text: "By creating account,you agree to our",style: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*.03),
                    children:<TextSpan> [
                      TextSpan(text: " Privecy Policy",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.width*.03)),
                      TextSpan(text: " and",style: TextStyle(color: Colors.grey,fontSize: MediaQuery.of(context).size.width*.03)),
                      TextSpan(text: " T&C",style: TextStyle(color: Colors.blue,fontSize: MediaQuery.of(context).size.width*.03)),
                    ]
                  ),

                  )
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
