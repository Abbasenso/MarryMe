import 'dart:convert';

import 'package:f_matrimony/basic_details/imageupload.dart';
import 'package:f_matrimony/home_pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Basicdetails1 extends StatefulWidget {
  //const Basicdetails1({Key? key}) : super(key: key);
  String uid="";
  String email="";
  String fname="";
  String lname="";
  String rel="";
  String comu="";
  Basicdetails1(u,e,f,l,r,c){
    uid=u;
    email=e;
    fname=f;
    lname=l;
    rel=r;
    comu=c;
  }

  @override
  _Basicdetails1State createState() => _Basicdetails1State();
}

class _Basicdetails1State extends State<Basicdetails1> {
  final k1= GlobalKey<FormState>();
  final k2=GlobalKey<FormState>();
  final k3=GlobalKey<FormState>();
  //final k4=GlobalKey<FormState>();
  int currentStep=0;
  String state="";
  String city="";
  String marit="";
  String diet="";
  String height="";
  String qualification="";
  String collegename="";
  String workwith="";
  String income ="";
  String intro="";
  String children="";
  String noofchildrean="";
  String residencystatus="";
  String as="";
  String profaddress="";
  String radio1="Kafa";
  String radio2="Pitta";
  String radio3="Vata";
  String Radio_value="";
  String habit="";
  String hobby="";



  TextEditingController state1=TextEditingController();
      TextEditingController city1=TextEditingController();
  TextEditingController marit1=TextEditingController();
      TextEditingController diet1=TextEditingController();
  TextEditingController height1=TextEditingController();
  TextEditingController qualification1=TextEditingController();
  TextEditingController college_name=TextEditingController();
  TextEditingController work_with=TextEditingController();
  TextEditingController income1=TextEditingController();
  TextEditingController intro1=TextEditingController();
  TextEditingController children1 =TextEditingController();
  TextEditingController no_of_childrean=TextEditingController();
  TextEditingController residency_status=TextEditingController();
  TextEditingController as1 =TextEditingController();
  TextEditingController prof_address=TextEditingController();
  TextEditingController habit1=TextEditingController();
  TextEditingController hobby1=TextEditingController();

  getIntro(){
    setState(() {
      intro1.text="Hi there,I am "+"${widget.fname} "+"${widget.lname} "+"from "+"$state "+"at "+
      "$city."+"My residential status is $residencystatus."+"I am a "+"${widget.rel } "+"and from "+"${widget.comu} community."+
      "My maritial status is $marit."+"I have $height height and My diet is $diet."+"My qualification is $qualification."
      +"Thank u for coming to my profile.";
      intro="Hi there,I am "+"${widget.fname} "+"${widget.lname} "+"from "+"$state "+"at "+
          "$city."+"My residential status is $residencystatus."+"I am a "+"${widget.rel } "+"and from "+"${widget.comu} community."+
          "My maritial status is $marit."+"I have $height height and My diet is $diet."+"My qualification is $qualification."
          +"Thank u for coming to my profile.";
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Container(),
      //   title: Text("F-Shaadi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,)),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: Colors.white,
      body: ListView(
        //scrollDirection: Axis.vertical,
        children: [
          Column(
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


              Padding(
                padding: const EdgeInsets.only(left: 0,right: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Thanks for Registering.Now let's build",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                    Text("your profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 15),),
                    Theme(
                      data: ThemeData(
                          //accentColor: Colors.orange,
                          //primarySwatch: Colors.orange,
                          colorScheme: ColorScheme.light(
                              primary: Colors.orangeAccent
                          )),
                      child: Stepper(
                          physics: ClampingScrollPhysics(),
                         currentStep: currentStep,
                       type: StepperType.vertical,
                       onStepContinue: (){
                         if(k1.currentState!.validate()){
                           currentStep < 2 ?
                           setState(() => currentStep += 1):StepState.disabled;
                         }
                       },
                         onStepCancel: (){

                         },

                         onStepTapped: (int i){
                           setState(() {
                             currentStep=i;
                           });
                         },
                       steps: getSteps()
                    ),
                    ),
                    SizedBox(height: 20,),

                    GestureDetector(
                      onTap: (){
                        if(k1.currentState!.validate()&& k2.currentState!.validate()&& k3.currentState!.validate()){
                          detailSubmit();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:
                                  (context) =>
                                  imageUpload(widget.uid)
                              )
                          );


                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height*.04,
                        width: MediaQuery.of(context).size.width*.3,
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
                        child: Center(child: Text("Create Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,)
            ],
          )
        ],
      ),
    );
  }

  List<Step> getSteps()
  {
    return[
      Step(
        title: new Text('Basic details'),
        content: Form(
          key: k1,
          child: Container(
            width: MediaQuery.of(context).size.width*.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 1),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  All fields are mendatory",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(state1.text==''){
                            return 'Select your state';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: state1,
                        onChanged: (value){
                          setState(() {
                            state=state1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Your State",
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
                        readOnly: true,
                        //keyboardType: TextInputType.none,
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  state = newValue!;
                                  state1.text=newValue;
                                });
                              },
                              //['Andhra Pradesh','Arunachal Pradesh','Assam','Bihar','Chhattisgarh','Goa','Gujarat','Haryana','Himachal Pradesh',
                              //'Jharkhand','Karnataka','Kerala','Madhya Pradesh','Maharashtra','Manipur','Meghalaya','Mizoram','Nagaland','Odisha','Punjab','Rajasthan',
                              //'Sikkim','Tamil Nadu','Telangana','Tripura','Uttar Pradesh','Uttarakhand',]
                              items: <String>['West Bengal',]
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


                SizedBox(height: 10,),

                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(city1.text==''){
                            return 'Select your district';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: city1,
                        onChanged: (value){
                          setState(() {
                            city=city1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Your District",
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
                        //keyboardType: TextInputType.phone,
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  city = newValue!;
                                  city1.text=newValue;
                                });
                              },
                              items: <String>['Alipurduar','Bankura','Birbhum','Cooch Behar','Dakshin Dinajpur','Darjeeling','Hooghly','Howrah',
                              'Jalpaiguri','Jhargram','Kalimpong','Kolkata','Malda','Murshidabad','Nadia','North 24 Parganas','Paschim Bardhaman','Paschim Medinipur',
                              'Purba Bardhaman','Purba Medinipur','Purulia','South 24 Parganas','Uttar Dinajpur']
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

                SizedBox(height: 10,),


                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(residency_status.text==''){
                            return 'Select your Residental Status';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: residency_status,
                        onChanged: (value){
                          setState(() {
                            residencystatus=city1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Your Residency Status",
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
                        //keyboardType: TextInputType.phone,
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  residencystatus = newValue!;
                                  residency_status.text=newValue;
                                });
                              },
                              items: <String>['Citizen','Permanent Resident','Student Visa','Temporary Visa','Work Permit']
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




                SizedBox(height: 10,),

                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(marit1.text==''){
                            return 'Select your maritial status';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: marit1,
                        onChanged: (value){
                          setState(() {
                            marit=marit1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Maritial Status",
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  marit = newValue!;
                                  marit1.text=newValue;
                                });
                              },
                              items: <String>['Never Married','Divorced','Widowed','Awaiting Divorce','Annulled']
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
                marit=="Never Married" || marit==""? Container():


                //SizedBox(height: 10,),
                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.width*.75,
                      child: Stack(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(children1.text==''){
                                return 'Select an option';
                              }
                              return null;
                            },
                            enableInteractiveSelection: false,
                            controller: children1,
                            onChanged: (value){
                              setState(() {
                                children=diet1.text;
                              });
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: " Do you Have Children",
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
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      children = newValue!;
                                      children1.text=newValue;
                                    });
                                  },
                                  items: <String>['No','Yes. Living together','Yes. Not living together']
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
                marit=="Never Married"||marit==""||children==""||children=="No"?Container():
                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.width*.75,
                      child: Stack(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(no_of_childrean.text==''){
                                return 'Select no of Childrean';
                              }
                              return null;
                            },
                            enableInteractiveSelection: false,
                            controller: no_of_childrean,
                            onChanged: (value){
                              setState(() {
                                noofchildrean=no_of_childrean.text;
                              });
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: " No of Childrean",
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
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      noofchildrean = newValue!;
                                      no_of_childrean.text=newValue;
                                    });
                                  },
                                  items: <String>['1','2','3','More than 3']
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

                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(diet1.text==''){
                            return 'Select your diet';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: diet1,
                        onChanged: (value){
                          setState(() {
                            diet=diet1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Your Diet",
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  diet = newValue!;
                                  diet1.text=newValue;
                                });
                              },
                              items: <String>['Veg','Non Veg','Occasionally Non-Veg','Eggetarian','Jain','Vegan']
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
                // SizedBox(height: 10,),
                // Container(
                //   height: MediaQuery.of(context).size.height*.06,
                //   width: MediaQuery.of(context).size.width*.75,
                //   child: Stack(
                //     children: [
                //       TextFormField(
                //         validator: (value){
                //           if(hobby1.text==''){
                //             return 'Select your hobby';
                //           }
                //           return null;
                //         },
                //         enableInteractiveSelection: false,
                //         controller: diet1,
                //         onChanged: (value){
                //           setState(() {
                //             diet=diet1.text;
                //           });
                //         },
                //         cursorColor: Colors.white,
                //         decoration: InputDecoration(
                //           labelText: " Your Diet",
                //           focusedBorder: OutlineInputBorder(
                //             //borderRadius: BorderRadius.circular(25.0),
                //             borderSide: BorderSide(
                //               color: Colors.blue,
                //             ),
                //           ),
                //           enabledBorder: OutlineInputBorder(
                //             //borderRadius: BorderRadius.circular(25.0),
                //             borderSide: BorderSide(
                //               color: Colors.grey,
                //               width: 1.0,
                //             ),
                //           ),
                //         ),
                //         //keyboardType: TextInputType.none,
                //         readOnly: true,
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Padding(
                //               padding: const EdgeInsets.only(left: 10),
                //               child:Text("")
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(right: 10),
                //             child: DropdownButton<String>(
                //               //value: profilefor,
                //               icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //               iconSize: 24,
                //               elevation: 16,
                //               style: const TextStyle(color: Colors.black),
                //               underline: Container(color: Colors.white,),
                //               onChanged: (String? newValue) {
                //                 setState(() {
                //                   diet = newValue!;
                //                   diet1.text=newValue;
                //                 });
                //               },
                //               items: <String>['Veg','Non Veg','Occasionally Non-Veg','Eggetarian','Jain','Vegan']
                //                   .map<DropdownMenuItem<String>>((String value) {
                //                 return DropdownMenuItem<String>(
                //                   value: value,
                //                   child: Text(value),
                //                 );
                //               }).toList(),
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                // ),


                SizedBox(height: 10,),
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(height1.text==''){
                            return 'Select your height';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: height1,
                        onChanged: (value){
                          setState(() {
                            height=height1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Your Height",
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  height = newValue!;
                                  height1.text=newValue;
                                });
                              },
                              items: <String>['5ft','5ft 1in','5ft 2in','5ft 3in','5ft 4in','5ft 5in','5ft 6in','5ft 7in','5ft 8in'
                                ,'5ft 9in','5ft 10in','5ft 11in','6ft','6ft 1in','6ft 2in','6ft 3in','6ft 4in','6ft 5in','6ft 6in','6ft 7in',
                                '6ft 8in','6ft 9in','6ft 10in','6ft 11in','7ft',]
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
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep == 0 ?
        StepState.editing : StepState.complete,
      ),







      Step(
        title: new Text('Education & Carrier details'),
        content: Form(
          key: k2,
          child: Container(
            width: MediaQuery.of(context).size.width*.8,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  All fields are mendatory",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(qualification1.text==''){
                            return 'Select your qualification';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: qualification1,
                        onChanged: (value){
                          setState(() {
                            qualification=qualification1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Your Highest Qualification",
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  qualification = newValue!;
                                  qualification1.text=newValue;
                                });
                              },
                              items: <String>['B.E/B.Tech','M.E/M.Tech','M.S Engineering','B.Eng(Hons)','M.Eng(Hons)','Engineering Diploma',
                              'AE','AET','B.A','B.ED','BJMC','BFA','B.Arch','B.Des','BMM','MFA','M.ED','M.A','MSW','MJMC','M.Arch','M.Des',
                              'BA(Hons)','B.Arch(Hons)','DFA','D.Ed','D.Arch','AA','AFA','B.Com','CA/CPA','CFA','CS','BSc/BFin','M.Com','MSc/MFin/MS',
                              'BCom(Hons','PGD Finance','BCA','B.IT','BCS','BA Computer Science','MCA','PGDCA','IT Diploma','ADIT','B.Sc','M.Sc',
                              'BSc(Hons)','DipSc','AS','AAS','MBBS','BDS','BPT','BAMS','BHMS','B.Pharma','BVSc','BSN/BScN','MDS','MCh','M.D','M.S Medicine',
                              'MPT','DM','M.Pharma','MVSc','MMed','PGD Medicine','ADN','BBA','BHM','BBM','MBA','PGDM','ABA','ADBus','BL/LLB','ML/LLM','LLB(Hons),'
                                    'ALA','Ph.D','M.Phil','Bachelor','Master','Diploma','Honours','Doctorate','Associate','High School','Under High School']
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


                SizedBox(height: 10,),

                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: TextFormField(
                    validator: (value){
                      if(college_name.text.length<=0){
                        return 'Please enter your college name';
                      }
                      return null;
                    },
                    enableInteractiveSelection: false,
                    controller: college_name,
                    decoration: InputDecoration(
                      labelText: "Highest Degree College Name",
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
                        collegename=college_name.text;
                      });
                    },
                  ),
                ),


                SizedBox(height: 10,),

                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(work_with.text==''){
                            return 'Select your work Area';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: work_with,
                        onChanged: (value){
                          setState(() {
                            workwith=work_with.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Work with",
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  workwith = newValue!;
                                  work_with.text=newValue;
                                });
                              },
                              items: <String>['Private Company','Government/Private Sector','Defence/Civil Services','Business/Self Employed','Not Working']
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
                workwith=="Not Working"?Container():


                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.width*.75,
                      child: Stack(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(as1.text==''){
                                return 'Select an Option';
                              }
                              return null;
                            },
                            enableInteractiveSelection: false,
                            controller: as1,
                            onChanged: (value){
                              setState(() {
                                as=as1.text;
                              });
                            },
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              labelText: " As",
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
                                  //isExpanded:true,
                                  //value: profilefor,
                                  icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                  iconSize: 24,
                                  elevation: 16,
                                  //isDense: true,
                                  style: const TextStyle(color: Colors.black),
                                  underline: Container(color: Colors.white,),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      as = newValue!;
                                      as1.text=newValue;
                                    });
                                  },
                                  items: <String>
                                  //['abcdvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv']
                                  ['Banking Professional','Chartered Aountant','Company Secretary','Finance Professional','Investment Professional',
                                  'Accounting Professional(Others)','Admin Professional','Human Resource Professional','Actor','Advertising Professional','Entertainment Professional',
                                  'Event Maneger','Journalist','Media Professional','Public Relation Professional','Farming','Horticulturist','Agriculture Professional\n& Others',
                                  'Air Hostess/Flight Attendant','Pilot/Co-Pilot','Other Airline Professional','Architect','Interior Designer','Landscape Architect',
                                  'Animator','Commercial Artist','Web/UX Designer','Artist(Others)','Beautician','Fashon Designer','Hairstylist','Jewellery Designer',
                                  'Designer(Others)','Cutomer Support/BPO/\nKPO Professional','IAS/IRS/IES/IFS','Indian Police Services(IPS)','Law Enforcement\nEmployee(Others)',
                                  'Airforce','Army','Navy','Defence Services(Others)','Lecturer','Professor','Reearch Assistant','Research Scholar',
                                  'Teacher','Training Professional(Others)','Civil Engineer','Electronic/Telecom Engineer','Mechanical/\nProduction Engineer',
                                  'Non IT Engineer(Others)','Chef/Sommelier/Food Critic','Catering Profesional','Hotel & Hospitality\nProfessional(Others)',
                                  'Software Developer/Programmer','Software Consultant','Hardware & Networking\nProfessional','Software Professional(Others)',
                                  'Lawyer','Legal Assistant','Legal Professional(Others)','Dentist','Doctor','Medical Transcriptionist','Nurse','Pharmacist',
                                  'Physician Assistant','Physiotherapist/\nOccupational Therapist','Psychologist','Surgeon','Veterinary Doctor','Therapist(Others)',
                                  'Medical/Healthcare\nProfessional(Others)','Merchant Naval Officer','Mariner','Marketing Professional','Sales Professional',
                                  'Biologist/Botanist','Physicist','Science Professional(Others)','CxO/Chairman/Director\nPresident','VP/AVP/GM/DGM','Sr. Manager/Manager',
                                  'Consultant/Supervisor/\nTeam Leads','Team Member/Staff','Agent/Broker/Trader\n/Contractor','Business Owner/Entrepreneur','Politician','Social Worker/Volunteer/NGO',
                                  'Sportsman','Travel & Transport\nProfessional','Writer']
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


                workwith=="Not Working"?Container():


                Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.width*.75,
                      child: TextFormField(
                        validator: (value){
                          if(prof_address.text.length<=0){
                            return 'Please put your profession Address';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: prof_address,
                        decoration: InputDecoration(
                          labelText: "Your Profession Address",
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
                            profaddress=prof_address.text;
                          });
                        },
                      ),
                    ),

                  ],
                ),


                SizedBox(height: 10,),

                Container(
                  height: MediaQuery.of(context).size.height*.06,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Stack(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(income1.text==''){
                            return 'Select your annual Income';
                          }
                          return null;
                        },
                        enableInteractiveSelection: false,
                        controller: income1,
                        onChanged: (value){
                          setState(() {
                            income=income1.text;
                          });
                        },
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: " Annual Income",
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
                              onChanged: (String? newValue) {
                                setState(() {
                                  income = newValue!;
                                  income1.text=newValue;
                                });
                              },
                              items: <String>["INR 50k to 1 lakh",'INR 1 Lakh to 2 Lakh','INR 2 Lakh to 4 Lakh','INR 4 Lakh to 7 Lakh','INR 7 Lakh to 10 Lakh','INR 10 Lakh to 15 Lakh','INR 15 Lakh to 20 Lakh','INR 20 Lakh to 25 Lakh','INR 25 Lakh to 30 Lakh','INR upto 50 lakh','INR upto 1 crore']
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
                SizedBox(height: 10,),

                Container(
                  height: MediaQuery.of(context).size.height*.2,
                  width: MediaQuery.of(context).size.width*.75,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLines: 5,
                        //maxLength: 300,
                        validator: (value){
                          if(intro1.text.length<=0){
                            return 'Please put your profession Address';
                          }
                          else if(intro1.text.length>300){
                            return 'too long! maximum 300 characters';
                          }
                          return null;
                        },
                        //enableInteractiveSelection: false,
                        controller: intro1,
                        decoration: InputDecoration(
                          labelText: "Introduction",
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
                            intro=intro1.text;
                          });
                        },
                      ),
                      SizedBox(height: 5,),
                      GestureDetector(
                        onTap: (){
                          getIntro();
                        },
                          child:Text("Get intro from Merry Me?",style: TextStyle(color: Colors.blue),))
                    ],
                  ),
                ),


                SizedBox(height: 5,),
              ],
            ),
          ),
        ),
        isActive: currentStep >= 1,
        state: currentStep == 1 ?
        StepState.editing : currentStep < 1 ? StepState.disabled: StepState.complete,
      ),

      Step(
        title: new Text("Ayurbedic bodyType"),
        content:Form(
          key: k3,
          child: Container(
            width: MediaQuery.of(context).size.width*.8,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey,width: 1),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  Optional",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                  ],
                ),
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: radio1, groupValue: Radio_value,
                      onChanged: (radio1){
                        setState(() {
                          Radio_value=radio1.toString();
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    Text("Kapha",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: radio2, groupValue: Radio_value,
                      onChanged: (radio2){
                        setState(() {
                          Radio_value=radio2.toString();
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    Text("Pitta",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio(
                      value: radio3, groupValue: Radio_value,
                      onChanged: (radio3){
                        setState(() {
                          Radio_value=radio3.toString();
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                    Text("Vata",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _showMyDialog();
                      },
                        child: const Text("Know about Ayurbedic bodytype?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                    ),
                  ],
                ),
                SizedBox(height: 5,)
              ],

            ),
          ),

        ),
        isActive:currentStep >= 2,
        state: currentStep == 2 ?
        StepState.editing : currentStep < 2 ? StepState.disabled: StepState.complete,
      ),





      // Step(
      //   title: new Text("Your Introduction"),
      //   content:Form(
      //     key: k3,
      //     child: Container(
      //       width: MediaQuery.of(context).size.width*.8,
      //       height: MediaQuery.of(context).size.height*.15,
      //       decoration: BoxDecoration(
      //         border: Border.all(color: Colors.grey,width: 1),
      //         borderRadius: BorderRadius.circular(5)
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 5,right: 5),
      //         child: TextFormField(
      //           keyboardType: TextInputType.text,
      //           enableInteractiveSelection: false,
      //           maxLines: 5,
      //           maxLength: 100,
      //           controller: intro1,
      //           validator: (value){
      //             if(intro1.text.length<=0){
      //              return "Describe about Yourself";
      //             }
      //             else if(intro1.text.length<100){
      //               return "Please fill minimum length";
      //             }
      //             return null;
      //           },
      //           decoration: InputDecoration(
      //             hintText: "  typing here",
      //             focusedBorder: OutlineInputBorder(
      //               //borderRadius: BorderRadius.circular(25.0),
      //               borderSide: BorderSide(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               //borderRadius: BorderRadius.circular(25.0),
      //               borderSide: BorderSide(
      //                 color: Colors.white,
      //                 width: 1.0,
      //               ),
      //             ),
      //           ),
      //           onChanged: (value){
      //             setState(() {
      //               intro=value;
      //             });
      //           },
      //         ),
      //       ),
      //     ),
      //   ),
      //   isActive:currentStep >= 2,
      //   state: currentStep == 2 ?
      //   StepState.editing : currentStep < 2 ? StepState.disabled: StepState.complete,
      // ),
    ];
  }

  Future detailSubmit()  async{

    String mapuserid=widget.uid;
    String mapemail=widget.email;
    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/basicdetails_post.php";
    //json maping user entered details


    Map mapeddata ={
      'user_id':"$mapuserid",
      'email':"$mapemail",
      'country':"India",
      'state':"$state",
      'city':"$city",
      'residency':"$residencystatus",
      'maritialstatus':"$marit",
      'children':"$children",
      'noofchild':"$noofchildrean",
      'diet':"$diet",
      'height':"$height",
      'qualification':"$qualification",
      'collegename':"$collegename",
      'workwith':"$workwith",
      'profession':"$as",
      'professionaddress':"$profaddress",
      'annualincome':"$income",
      'bodytype':"$Radio_value",
      'introduction':"$intro",



    };
    //print(mapeddata);
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddata );
    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("DATA: ${data}");
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
        useSafeArea: true,
        context: context,
        barrierDismissible:true,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),),
            scrollable: true,
              title: Center(
                child: const Text(
                  'Ayurvedic Body Type', style: TextStyle(color:Colors.green,fontSize: 18,fontWeight: FontWeight.bold,),),
              ),
              //insetPadding: EdgeInsets.zero,
              content: SingleChildScrollView(
                child: Container(
                    width: MediaQuery.of(context).size.width*1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Text("MEN")
                      //   ],
                      // ),
                      SizedBox(height: 5,),
                      Container(
                        width: MediaQuery.of(context).size.width*1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5,),
                            Text("KAPHA",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Container(
                              height: MediaQuery.of(context).size.height*.2,
                              width: MediaQuery.of(context).size.width*.3,
                              child: Image(
                                  image: AssetImage("image/KAPHA.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Key Points:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Nature:   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                  child: Text("Calm,pacefull,solicitous,resilient,loyal,slow,deliberate,relaxed,caring,patient,nurturing,stable.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Memory: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Remember & forget slowly.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Think: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Slow,methodical.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Creative: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Best in the field of business.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Stress: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Lethargic,dull,in denial.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dream: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Romance,sentiment,water and snow.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Speech: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Slow,monotone,melodic.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Voice: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Pleasant,deep,resonant.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Lifestyle: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Slow,steady.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Spending: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Thrifty,collect wealth,spend on food.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Sex: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("High libido,strong desire.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dislike weather: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.3,
                                      child: Text("Cool and damp.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Make Decisions: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.3,
                                      child: Text("Rather inactive.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Emotional: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Deliberate.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Love to: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Calm,complacent,get angry slowly.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 5,)

                          ],
                          
                        ),
                      ),
                      SizedBox(height: 5,),



                      Container(
                        width: MediaQuery.of(context).size.width*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5,),
                            Text("PITTA",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            Container(
                              height: MediaQuery.of(context).size.height*.2,
                              width: MediaQuery.of(context).size.width*.3,
                              child: Image(
                                image: AssetImage("image/PITTA.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Key Points:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Nature:   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Ambitious,practical,motivated,sharp,friendly,courageous,discriminating,leader,goal-oriented,competitive.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Memory: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Average,clear,distinct.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Think: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Organized,accurate,at optimal speed.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Creative: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Inventive with good follow-up.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Stress: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Aggressive,angry,irritable,headachy.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dream: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Violence,fire,anger,passion,the sun.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Speech: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Precise,convincing.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Voice: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Sharp,loud,high pitched,penetrating.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Lifestyle: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Active,intense.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Spending: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Moderate,can save,spend on luxuries.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Sex: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Interested frequent sex.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dislike weather: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.3,
                                      child: Text("Hot,with strong sun.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Make Decisions: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.3,
                                      child: Text("Quick and dicesive.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Emotional: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Angry,irritated easily.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Love to: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Sport,politics,luxury.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 5,)
                          ],

                        ),
                      ),
                      SizedBox(height: 5,),


                      Container(
                        width: MediaQuery.of(context).size.width*1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 1)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 5,),
                            Text("VATA",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                            SizedBox(height: 10,),
                            Container(
                              height: MediaQuery.of(context).size.height*.2,
                              width: MediaQuery.of(context).size.width*.3,
                              child: Image(
                                image: AssetImage("image/VATA.png"),
                                fit: BoxFit.contain,
                              ),
                            ),

                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Key Points:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.blue),),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Nature:   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Flexible,optimistic,lively,intuitive,enthusiastic,changeable,an initiator.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Memory: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Remember & forget quickly.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Think: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Restless,quick.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Creative: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Full of ideas with poor follow-up.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Stress: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Sigh and hyperventilate.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dream: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Activity,running,flying,frightening.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Speech: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Fast,talkative.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Voice: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Weak,low,hoarse,whiny.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Lifestyle: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Highly active.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Spending: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Wasteful,cannot save.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Sex: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Low libido,low sex.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Dislike weather: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.3,
                                      child: Text("Cold,windy,dry.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Make Decisions: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.3,
                                      child: Text("Anxious,insecure,tense,and unsure.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Emotional: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Worry,anxious,moody.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Love to: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                  Container(width:MediaQuery.of(context).size.width*.4,
                                      child: Text("Traveling,art,esoteric subjects.",style: TextStyle(fontSize: 14),textAlign: TextAlign.justify,))
                                ],
                              ),
                            ),
                            SizedBox(height: 5,)
                          ],

                        ),
                      ),
                      SizedBox(height: 20,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Text("WOMEN")
                      //   ],
                      // ),
                      // SizedBox(height: 5,),
                      // Container(
                      //   width: MediaQuery.of(context).size.width*1,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey,width: 1)
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SizedBox(height: 5,),
                      //       Text("KAPHA"),
                      //       SizedBox(height: 10,),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height*.2,
                      //         width: MediaQuery.of(context).size.width*.3,
                      //         child: Image(
                      //           image: AssetImage("image/kafa_female.png"),
                      //           fit: BoxFit.contain,
                      //         ),
                      //       ),
                      //     ],
                      //
                      //   ),
                      // ),
                      // SizedBox(height: 5,),
                      //
                      //
                      //
                      // Container(
                      //   width: MediaQuery.of(context).size.width*1,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey,width: 1)
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SizedBox(height: 5,),
                      //       Text("PITTA"),
                      //       SizedBox(height: 10,),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height*.2,
                      //         width: MediaQuery.of(context).size.width*.3,
                      //         child: Image(
                      //           image: AssetImage("image/pitta_female.png"),
                      //           fit: BoxFit.contain,
                      //         ),
                      //       ),
                      //     ],
                      //
                      //   ),
                      // ),
                      // SizedBox(height: 5,),
                      //
                      //
                      // Container(
                      //   width: MediaQuery.of(context).size.width*1,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       border: Border.all(color: Colors.grey,width: 1)
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SizedBox(height: 5,),
                      //       Text("VATA"),
                      //       SizedBox(height: 10,),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height*.2,
                      //         width: MediaQuery.of(context).size.width*.3,
                      //         child: Image(
                      //           image: AssetImage("image/vata_female.png"),
                      //           fit: BoxFit.contain,
                      //         ),
                      //       ),
                      //     ],
                      //
                      //   ),
                      // ),



                      ],
                  ),
                )
              ),
              actions: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Text("OK",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold),)
                )

              ]
          );
        }
    );
  }
}