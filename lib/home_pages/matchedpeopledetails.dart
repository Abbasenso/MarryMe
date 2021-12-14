// @dart=2.9
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class MatchedPeopleDetails extends StatefulWidget {
  //const MatchedPeopleDetails({Key? key}) : super(key: key);
  var detaildata;
  MatchedPeopleDetails(data){
    detaildata=data;
  }


  @override
  _MatchedPeopleDetailsState createState() => _MatchedPeopleDetailsState();
}

class _MatchedPeopleDetailsState extends State<MatchedPeopleDetails> {
  SharedPreferences sharedlogindata;
  int click=0;
  String profileid;
  @override
  Widget build(BuildContext context) {
    var allData=widget.detaildata;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.25,
                width: MediaQuery.of(context).size.width,
                //color: Colors.red,
                child: Image.memory(base64Decode(allData["profilepic"]),fit: BoxFit.cover,),
              ),
              // Row(mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     IconButton(
              //         onPressed:(){
              //           setState(() {
              //             //click==0?click=1:click=0;
              //             click=1;
              //             profileid="${widget.detaildata["user_id"]}";
              //           });
              //         },
              //         icon: Icon(Icons.favorite,color:click==0?Colors.grey:Colors.red,)
              //     ),
              //   ],
              // )
              
            ],
          ),
          SizedBox(height: 10,),
         DefaultTabController(
             length: 2,
             child:Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   TabBar(
                     unselectedLabelColor: Colors.grey,
                     labelStyle: TextStyle(fontWeight: FontWeight.bold),
                     labelColor: Colors.black,
                     indicatorSize: TabBarIndicatorSize.label,

                     tabs: [
                       Tab(
                         child: Container(
                           child: Align(
                             alignment: Alignment.center,
                             child: Text("Personal Info",),
                           ),
                         ),
                       ),
                       Tab(
                         child: Container(
                           child: Align(
                             alignment: Alignment.center,
                             child: Text("Religion Info",),
                           ),
                         ),
                       ),
                     ],
                   ),
                   Container(
                     height: 600,
                     //color: Colors.red,
                     child: TabBarView(
                         children: [
                           Column(mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height: 10,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("Personal Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                               ),
                               SizedBox(height: 5,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("A Few Lines About Me",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                               ),
                               SizedBox(height: 3,),
                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("${allData["introduction"]}",style: TextStyle(color: Colors.grey,fontSize: 16),),
                               ),
                               SizedBox(height: 15,),

                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("Basic Details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Name",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["first_name"]}".toUpperCase()+" "+"${allData["last_name"]}".toUpperCase(),style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Age",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Height",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["height"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Marital status",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["maritialstatus"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Date of Birth",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["dob"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),



                               SizedBox(height: 15,),

                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("Location",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Citizenship",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["country"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Country",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["country"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("State",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["state"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("City",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["city"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Lives In",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["state"]},${allData["city"]}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               SizedBox(height: 15,),

                               Padding(
                                 padding: const EdgeInsets.only(left: 5),
                                 child: Text("Contact",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                               ),
                               SizedBox(height: 5,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Whatsapp",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["mobile_no"]}".substring(4,6)+"*******",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Phone",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["mobile_no"]}".substring(0,6)+"*******",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("Email",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                   Text("-",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                   Container(width: MediaQuery.of(context).size.width*.45,
                                     child: Text("${allData["first_name"]}".substring(0,2)+"*******@gmail.com",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),),
                                   ),
                                 ],
                               ),




                             ],
                           ),
                           Text("Religeon Info")
                         ]
                     ),
                   ),
                 ],
               ),
             ),


         ),
        ],
      ),

    );
  }
  Future shortlistedprofilesend()  async{
    sharedlogindata=await SharedPreferences.getInstance();
    var APIURL = "https://marryme.world/vibaha_backend/shortlisted_profile_post.php";
    //json maping user entered details


    Map mapeddata ={
      'user_id':"${sharedlogindata.getString('user_id')}",
      'profile_id':profileid
    };
    //print(mapeddata);
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapeddata );
    //getting response from php code, here
    var data = jsonDecode(reponse.body.toString());
    print("DATA: ${data}");
  }
}
