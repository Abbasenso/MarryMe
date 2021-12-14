// @dart=2.9
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndibisualMatchingResult extends StatefulWidget {
   //IndibisualMatchingResult({Key? key}) : super(key: key);
  var indibisualdetails;
  IndibisualMatchingResult(d){
    indibisualdetails=d;
  }

  @override
  _IndibisualMatchingResultState createState() => _IndibisualMatchingResultState();
}

class _IndibisualMatchingResultState extends State<IndibisualMatchingResult> {
  SharedPreferences sharedlogindata;
  String sharedpreferenceuserid;
  String firstname;
  String lastname;
  String profilepic;
  String city;
  String country;
  String profession;
  String qualification;
  String state;
  String diet;
  String qualificationaddress;
  String professionarea;
  String maritialstatus;
  String havechild;
  String noofchild;
  String bodytype;
  getuseridfromsharedpreference()async {
    sharedlogindata = await SharedPreferences.getInstance();
    setState(() {
      sharedpreferenceuserid = sharedlogindata.getString('userid') ?? '';
      firstname=sharedlogindata.getString('firstname') ?? '';
      lastname=sharedlogindata.getString('lastname') ?? '';
      profilepic=sharedlogindata.getString('profilepic') ?? '';
      city=sharedlogindata.getString('city') ?? '';
      country=sharedlogindata.getString('country') ?? '';
      profession=sharedlogindata.getString('profession') ?? '';
      qualification=sharedlogindata.getString('qualification') ?? '';
      state=sharedlogindata.getString('state') ?? '';
      diet=sharedlogindata.getString('diet') ?? '';
      qualificationaddress=sharedlogindata.getString('qualificationaddress') ?? '';
      professionarea=sharedlogindata.getString('workwith') ?? '';
      maritialstatus=sharedlogindata.getString('maritialstatus') ?? '';
      havechild=sharedlogindata.getString('havechildren') ?? '';
      noofchild=sharedlogindata.getString('noofchild') ?? '';
      bodytype=sharedlogindata.getString('bodytype') ?? '';

      //password1=logindata.getString('password') ?? '';
    });
    print(sharedpreferenceuserid);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuseridfromsharedpreference();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //height: MediaQuery.of(context).size.height*.3,
                width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.3,
                          //width: MediaQuery.of(context).size.width*.48,
                          //color: Colors.green,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Container(
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
                                      child:profilepic!=null?Image.memory(base64Decode(profilepic),fit: BoxFit.cover,)
                                          :Center(
                                        child: CircularProgressIndicator(backgroundColor: Colors.red,
                                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),strokeWidth: 5,),
                                      )

                                  ),
                                ),
                              ),
                              Text("$firstname ${lastname[0]}".toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                              //Text("$profession  $qualification",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                              Text("$city,  $country",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                            ],
                          ),

                        ),
                        Container(
                          //height: MediaQuery.of(context).size.height*.3,
                          //width: MediaQuery.of(context).size.width*.48,
                          //color: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Container(
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
                                      child:widget.indibisualdetails!=null?Image.memory(base64Decode(widget.indibisualdetails["profilepic"]),fit: BoxFit.cover,)
                                          :Center(
                                        child: CircularProgressIndicator(backgroundColor: Colors.red,
                                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),strokeWidth: 5,),
                                      )

                                  ),
                                ),
                              ),
                              widget.indibisualdetails!=null?Text("${widget.indibisualdetails["first_name"]} ${widget.indibisualdetails["last_name"][0]}".toUpperCase(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text(""),
                              //Text("$profession  $qualification",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                              widget.indibisualdetails!=null?Text("${widget.indibisualdetails["city"]},  ${widget.indibisualdetails["country"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),):Text(""),
                            ],
                          ),

                        ),
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),

              //Location................................
              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(leading: CircleAvatar(radius: 13,backgroundColor: Colors.black,
                    child: CircleAvatar(backgroundColor: Colors.white,radius: 11,
                    child: Center(child: Text("01",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
                    ),
                    ),
                      title: Text("Location",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      horizontalTitleGap: 1,
                    ),
                    //country..........................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Country",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        country==widget.indibisualdetails["country"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    country==widget.indibisualdetails["country"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.15,
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(3)
                    ),
                      child: Center(child: Text("$country",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.15,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$country",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.15,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["country"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),

                    //state......................
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("State",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        state==widget.indibisualdetails["state"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    state==widget.indibisualdetails["state"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.25,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$state",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.2,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$state",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.2,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["state"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),


                    //city..................................
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("City",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        city==widget.indibisualdetails["city"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    city==widget.indibisualdetails["city"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.25,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$city",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.2,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$city",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.2,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["city"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),


              //diet.....................................

              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(leading: CircleAvatar(radius: 13,backgroundColor: Colors.black,
                      child: CircleAvatar(backgroundColor: Colors.white,radius: 11,
                        child: Center(child: Text("02",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                    ),
                      title: Text("Diet",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      horizontalTitleGap: 1,
                    ),
                    //diet..........................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Diet",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        diet==widget.indibisualdetails["diet"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    diet==widget.indibisualdetails["diet"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$diet",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$diet",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["diet"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),

              //qualification......................................
              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(leading: CircleAvatar(radius: 13,backgroundColor: Colors.black,
                      child: CircleAvatar(backgroundColor: Colors.white,radius: 11,
                        child: Center(child: Text("03",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                    ),
                      title: Text("Qualification",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      horizontalTitleGap: 1,
                    ),


                    //qualification..........................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Qualification",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        qualification==widget.indibisualdetails["qualification"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    qualification==widget.indibisualdetails["qualification"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$qualification",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$qualification",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["qualification"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),

              //profession...................................
              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(leading: CircleAvatar(radius: 13,backgroundColor: Colors.black,
                      child: CircleAvatar(backgroundColor: Colors.white,radius: 11,
                        child: Center(child: Text("04",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                    ),
                      title: Text("Profession",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      horizontalTitleGap: 1,
                    ),


                    //profession area..........................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Profession Area",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        professionarea==widget.indibisualdetails["workwith"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    professionarea==widget.indibisualdetails["workwith"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$professionarea",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$professionarea",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["workwith"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),

                    //profession.........................................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Profession",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        profession==widget.indibisualdetails["profession"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    profession==widget.indibisualdetails["profession"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$profession",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: profession==""?Text("No profession",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("$profession",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: widget.indibisualdetails["profession"]==""?Text("No Profession",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("${widget.indibisualdetails["profession"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),


              //Maritial status...............................
              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(leading: CircleAvatar(radius: 13,backgroundColor: Colors.black,
                      child: CircleAvatar(backgroundColor: Colors.white,radius: 11,
                        child: Center(child: Text("05",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                    ),
                      title: Text("Maritial Status",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      horizontalTitleGap: 1,
                    ),


                    //status..........................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Status",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        maritialstatus==widget.indibisualdetails["maritialstatus"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    maritialstatus==widget.indibisualdetails["maritialstatus"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: Text("$maritialstatus",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("$maritialstatus",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("${widget.indibisualdetails["maritialstatus"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),

                    //have child.........................................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Have child",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        havechild==widget.indibisualdetails["have_childrean"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    havechild==widget.indibisualdetails["have_childrean"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: havechild==""?Text("No",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("$havechild",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: havechild==""?Text("No",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("$havechild",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: widget.indibisualdetails["have_childrean"]==""?Text("No",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("${widget.indibisualdetails["have_childrean"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),

                    //No of child..................................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("No of child",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        noofchild==widget.indibisualdetails["no_of_child"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    noofchild==widget.indibisualdetails["no_of_child"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child: noofchild==""?Text("0",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("$noofchild",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: noofchild==""?Text("0",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("$noofchild",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: widget.indibisualdetails["no_of_child"]==""?Text("0",style: TextStyle(color: Colors.grey,fontSize: 15)):Text("${widget.indibisualdetails["no_of_child"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),


              //Ayurvedic match........................................
              Container(
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(leading: CircleAvatar(radius: 13,backgroundColor: Colors.black,
                      child: CircleAvatar(backgroundColor: Colors.white,radius: 11,
                        child: Center(child: Text("06",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
                      ),
                    ),
                      title: Text("Ayurvedic Body",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      horizontalTitleGap: 1,
                    ),


                    //bodytype..........................
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Text("Body type",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                        ),
                        SizedBox(width: 20,),
                        bodytype==widget.indibisualdetails["bodytype"]?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: Center(child: Icon(Icons.done,color: Colors.white,size: 15,)),)
                            :CircleAvatar(radius: 10,backgroundColor: Colors.red,child: Center(child: Icon(Icons.clear,color: Colors.white,size: 15,)),)
                      ],
                    ),
                    SizedBox(height: 3,),
                    bodytype==widget.indibisualdetails["bodytype"]?Container(
                      //height: MediaQuery.of(context).size.height*.01,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(child:bodytype==""?Text("Not mentioned",style: TextStyle(color: Colors.grey,fontSize: 15),): Text("$bodytype",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                    )
                        :Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: bodytype==""?Text("Not mentioned",style: TextStyle(color: Colors.grey,fontSize: 15),):Text("$bodytype",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          //height: MediaQuery.of(context).size.height*.01,
                          width: MediaQuery.of(context).size.width*.4,
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 1),
                              borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: widget.indibisualdetails["bodytype"]==""?Text("Not mentioned",style: TextStyle(color: Colors.grey,fontSize: 15),):Text("${widget.indibisualdetails["bodytype"]}",style: TextStyle(color: Colors.grey,fontSize: 15),)),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),
              SizedBox(height: 10,)



            ],
          )
        ],
      ),

    );
  }
}
