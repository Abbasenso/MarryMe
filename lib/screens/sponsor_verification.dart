import 'package:f_matrimony/basic_details/basicdetails1.dart';
import 'package:f_matrimony/screens/registration.dart';
import 'package:flutter/material.dart';


class SponsorVreification extends StatefulWidget {
  const SponsorVreification({Key? key}) : super(key: key);

  @override
  _SponsorVreificationState createState() => _SponsorVreificationState();
}

class _SponsorVreificationState extends State<SponsorVreification> {
  final k1= GlobalKey<FormState>();
  String sponsorid="";
  String sponsorname="";
  String emailid="";
  String phoneno="";
  String otp="";



  TextEditingController sponsor_id =TextEditingController();
  TextEditingController sponsor_name =TextEditingController();
  TextEditingController email_id =TextEditingController();
  TextEditingController phone_no =TextEditingController();
  TextEditingController otp_ =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("F-Shaadi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: Center(child: Text("Login >",style: TextStyle(color: Colors.blue),)),
      //     )
      //   ],
      // ),
      body: ListView(
        children: [
          Form(
            key: k1,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height*.1,
                            width:MediaQuery.of(context).size.width*.2,

                            child: Image(image: AssetImage("image/splashscreenlogo.png"),
                              fit: BoxFit.fill,
                            )
                        ),
                        Text("Verify",style: TextStyle(color: Colors.black,fontSize: 17,),),
                        Text("Your Sponsor Id",style: TextStyle(color: Colors.black,fontSize: 17,),)
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("All Fields Are Mendatory",style: TextStyle(color: Colors.grey,fontSize: 10),)
                      ],
                    ),
                  ),
                  SizedBox(height: 2,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 15,),


                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height*.06,
                              child: TextFormField(
                                validator: (value){
                                  if(sponsor_id.text.length<=0){
                                    return 'Please enter your valid sponsor id';
                                  }
                                  return null;
                                },
                                enableInteractiveSelection: false,
                                controller: sponsor_id,
                                decoration: InputDecoration(
                                  labelText: "Sponsor Id",
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
                                    sponsorid=sponsor_id.text;
                                  });
                                },
                              ),
                            ),
                          ),


                          SizedBox(height: 15,),


                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height*.06,
                              child: TextFormField(
                                validator: (value){
                                  if(sponsor_name.text.length<=0){
                                    return 'Please enter your sponsor name';
                                  }
                                  return null;
                                },
                                enableInteractiveSelection: false,
                                controller: sponsor_name,
                                decoration: InputDecoration(
                                  labelText: "Sponsor Name",
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
                                    sponsorname=sponsor_name.text;
                                  });
                                },
                              ),
                            ),
                          ),


                          SizedBox(height: 15,),


                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height*.06,
                              child: TextFormField(
                                validator: (value){
                                  if(email_id.text.length<=0){
                                    return 'Please enter your reg email id';
                                  }
                                  return null;
                                },
                                enableInteractiveSelection: false,
                                controller: email_id,
                                decoration: InputDecoration(
                                  labelText: "Reg Email",
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
                                    emailid=email_id.text;
                                  });
                                },
                              ),
                            ),
                          ),


                          SizedBox(height: 15,),


                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: Container(
                              height: MediaQuery.of(context).size.height*.06,
                              child: TextFormField(
                                validator: (value){
                                  if(phone_no.text.length<=0){
                                    return 'Please enter your phone no.';
                                  }
                                  else if(phone_no.text.length<10 || phone_no.text.length>10){
                                    return 'Please enter valid phone no.';
                                  }
                                  return null;
                                },
                                enableInteractiveSelection: false,
                                controller: phone_no,
                                decoration: InputDecoration(
                                  labelText: "Reg Phone No.",
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
                                keyboardType: TextInputType.phone,
                                onChanged: (value){
                                  setState(() {
                                    phoneno=phone_no.text;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),






                        ],
                      ),
                    ),

                  ),
                  SizedBox(height: 15,),
                  GestureDetector(
                    onTap: (){
                      if(k1.currentState!.validate()){
                        Navigator.push(context,
                                      MaterialPageRoute(builder:
                                          (context) =>
                                          Registration(sponsorid)
                                      )
                                  );
                      }
                      return null;
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height*.03,
                      width: MediaQuery.of(context).size.width*.22,
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
                      child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                    ),
                  ),
                  // SizedBox(height: 30,),
                  // Text("OTP Verification",style: TextStyle(color: Colors.grey,fontSize: 15),),
                  // SizedBox(height: 5,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: MediaQuery.of(context).size.height*.06,
                  //       width: MediaQuery.of(context).size.width*.4,
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey,width: 1),
                  //         borderRadius: BorderRadius.circular(5),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left: 15,right: 15),
                  //         child: TextFormField(
                  //           controller: otp_,
                  //           keyboardType: TextInputType.number,
                  //           enableInteractiveSelection: false,
                  //           decoration: InputDecoration(
                  //             hintText: "Put OTP",
                  //             hintMaxLines: 1,
                  //             hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                  //           ),
                  //           onChanged: (value){
                  //             setState(() {
                  //               otp=otp_.text;
                  //             });
                  //           },
                  //           validator: (value){
                  //             if(otp_.text.length<=0){
                  //               return 'Put OTP';
                  //             }
                  //             return null;
                  //           },
                  //         ),
                  //       )
                  //     ),
                  //     SizedBox(width: 10,),
                  //     Text("Resend",style: TextStyle(color: Colors.blue,fontSize: 10),)
                  //   ],
                  // ),
                  // SizedBox(height: 10,),
                  // GestureDetector(
                  //   onTap: (){
                  //     if(k1.currentState!.validate()){
                  //       Navigator.pushReplacement(context,
                  //           MaterialPageRoute(builder:
                  //               (context) =>
                  //               Registration()
                  //           )
                  //       );
                  //       return null;
                  //     }
                  //   },
                  //   child: Container(
                  //     height: MediaQuery.of(context).size.height*.03,
                  //     width: MediaQuery.of(context).size.width*.2,
                  //     decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.black.withOpacity(.3),
                  //             spreadRadius: 1,
                  //             blurRadius: 15,
                  //             offset: Offset(0,10), // changes position of shadow
                  //           ),
                  //         ],
                  //         borderRadius: BorderRadius.circular(8),
                  //         gradient: LinearGradient(
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //             colors: [Colors.red,Colors.yellow]
                  //         )
                  //     ),
                  //     child: Center(child: Text("Verify",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),)),
                  //   ),
                  // ),

                ],
              )
          ),
        ],
      ),
    );
  }
}
