// @dart=2.9
import 'dart:convert';

import 'package:f_matrimony/home_pages/indibisualmatchingresult.dart';
import 'package:f_matrimony/home_pages/matchedpeopledetails.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



class Matches extends StatefulWidget {
  const Matches({Key key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  var shortuserid=[];
  int click=0;
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuseridfromsharedpreference().then((value){
      allMatches();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: MediaQuery.of(context).size.width*1,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child:newmatchesdata!=null? Center(child: Text(newmatchesdata.length.toString()+" matches for you",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),)):Text("Waiting...",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14)),
        ),
      ),
      body: newmatchesdata!=null?Padding(
        padding: const EdgeInsets.only(left: 5,right: 5),
        child: Container(
          //width: MediaQuery.of(context).size.width*.9,
          child: ListView.builder(
            shrinkWrap: true,
            //scrollDirection: Axis.vertical,
            itemCount: newmatchesdata!=null?newmatchesdata.length:0,
            itemBuilder: (BuildContext context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>MatchedPeopleDetails(newmatchesdata[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    //height: 100,
                    //height:MediaQuery.of(context).size.height*.3,
                    //width: 100,
                    //width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //                                               color: Colors.red,
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
                            Stack(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height*.22,
                                    width: MediaQuery.of(context).size.width,
                                    //color: Colors.red,
                                    child:Image.memory(base64Decode(newmatchesdata[index]["profilepic"]),fit: BoxFit.cover,)
                                ),
                                // Row(mainAxisAlignment: MainAxisAlignment.end,
                                //   children: [
                                //     IconButton(
                                //         onPressed:(){
                                //           setState(() {
                                //             //click==0?click=1:click=0;
                                //             click=1;
                                //             shortuserid.add(newmatchesdata[index]["user_id"]);
                                //           });
                                //           click==1?sharedlogindata.setStringList('shortlisteditems',newmatchesdata): null;
                                //         },
                                //         icon: Icon(Icons.favorite,color:click==0?Colors.grey:Colors.red,)
                                //     ),
                                //   ],
                                // )
                              ],
                            ),
                            SizedBox(height: 2,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("${newmatchesdata[index]["first_name"]}".toUpperCase()+" "+"${newmatchesdata[index]["last_name"]}"[0].toUpperCase(),style: TextStyle(color: Colors.black,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text("${newmatchesdata[index]["profession"]}-  ${newmatchesdata[index]["qualification"]}",style: TextStyle(color: Colors.grey,),),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 5,top: 3),
                            //   child: Text("${newmatchesdata[index]["height"]}",style: TextStyle(color: Colors.black,),),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 5,),
                            //   child: Text("${newmatchesdata[index]["city"]}- ${newmatchesdata[index]["state"]}",style: TextStyle(color: Colors.black,),),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5,),
                              child: Text("${newmatchesdata[index]["religion"]}- ${newmatchesdata[index]["community"]}",style: TextStyle(color: Colors.grey,),),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>IndibisualMatchingResult(newmatchesdata[index])));
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height*.03,
                                  width: MediaQuery.of(context).size.width*.25,
                                  decoration: BoxDecoration(
                                      border:Border.all(color: Colors.grey,width: 1),
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Center(
                                    child: Text("Matching",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),

                            ),
                            SizedBox(height: 5,)

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
      ):Center(
        child: CircularProgressIndicator(backgroundColor: Colors.red,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),strokeWidth: 5,),
      ),

    );
  }

}




// import 'package:flutter/material.dart';
//
//
// class Matches extends StatefulWidget {
//   const Matches({Key? key}) : super(key: key);
//
//   @override
//   _MatchesState createState() => _MatchesState();
// }
//
// class _MatchesState extends State<Matches> {
//   @override
//   Widget build(BuildContext context) {
//     return   MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//           initialIndex: 1,
//           length: 7,
//           child: Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               toolbarHeight: 50,
//               titleSpacing: 1,
//               //toolbarHeight: 40,
//               title:  TabBar(
//
//                 unselectedLabelColor: Colors.red,
//                 isScrollable: true,
//                 //indicatorColor: Colors.red,
//                 //indicatorSize: TabBarIndicatorSize.label,
//                 indicatorWeight: 0,
//                 indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(3),
//                     gradient: LinearGradient(
//                     colors: [Colors.red,Colors.yellow],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter
//                     ),
//                 ),
//
//
//                 tabs: [
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("New"),
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Today's Matches"),
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("My Matches"),
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Near Me"),
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("More Matches"),
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Shortlisted"),
//                       ),
//                     ),
//                   ),
//                   Tab(
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         //border: Border.all(color: Colors.grey, width: .5)
//                       ),
//                       child: Align(
//                         alignment: Alignment.center,
//                         child: Text("Recently Viewed"),
//                       ),
//                     ),
//                   ),
//
//
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               children: [
//                 Container(
//                   height: 100,
//                   width: 100,
//                   color: Colors.red,
//                 ),
//                 Container(color: Colors.blue,),
//                 Container(color: Colors.yellow,),
//                 Container(color: Colors.black,),
//                 Container(color: Colors.green,),
//                 Container(color: Colors.orange,),
//                 Container(color: Colors.purple,),
//               ],
//             ),
//           )
//       ),
//     );
//   }
// }
