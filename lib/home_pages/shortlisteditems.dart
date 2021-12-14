// @dart=2.9
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ShortListedItems extends StatefulWidget {
  const ShortListedItems({Key key}) : super(key: key);

  @override
  _ShortListedItemsState createState() => _ShortListedItemsState();
}

class _ShortListedItemsState extends State<ShortListedItems> {
  SharedPreferences sharedlogindata;
  var items;
  getshortlisteditems()async{
    sharedlogindata=await SharedPreferences.getInstance();
    setState(() {
      items=sharedlogindata.getStringList("shortlisteditems") ?? null;
    });
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getshortlisteditems();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   leadingWidth: MediaQuery.of(context).size.width*1,
          //   leading: items!=null?Padding(
          //     padding: const EdgeInsets.only(left: 5,top: 5),
          //     child: Text("You have shortlisted "+"$items".length.toString() +"profiles",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
          //   )
          //       :Padding(
          //         padding: const EdgeInsets.only(left: 5,top: 5),
          //         child: Text("No shortlisted profile",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold)),
          //       ),
          //
          //
          // ),
          body: items!=null?Padding(
            padding: const EdgeInsets.only(left: 5,right: 5),
            child: Container(
              //width: MediaQuery.of(context).size.width*.9,
              child: ListView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                itemCount: items!=null?items.length:0,
                itemBuilder: (BuildContext context,index){
                  return GestureDetector(
                    onTap: (){
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context)=>MatchedPeopleDetails(newmatchesdata[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      // child: Container(
                      //   //height: 100,
                      //   //height:MediaQuery.of(context).size.height*.3,
                      //   //width: 100,
                      //   //width:MediaQuery.of(context).size.width,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     //                                               color: Colors.red,
                      //   ),
                      //
                      //   child: Card(
                      //     clipBehavior: Clip.antiAlias,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //     ),
                      //     child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Stack(
                      //             children: [
                      //               Container(
                      //                   height: MediaQuery.of(context).size.height*.22,
                      //                   width: MediaQuery.of(context).size.width,
                      //                   //color: Colors.red,
                      //                   child:Image.memory(base64Decode(newmatchesdata[index]["profilepic"]),fit: BoxFit.cover,)
                      //               ),
                      //               Row(mainAxisAlignment: MainAxisAlignment.end,
                      //                 children: [
                      //                   IconButton(
                      //                       onPressed:(){
                      //                         setState(() {
                      //                           //click==0?click=1:click=0;
                      //                           click=1;
                      //                         });
                      //                         click==1?sharedlogindata.setStringList("shortlisteditems", newmatchesdata[index]):null;
                      //                       },
                      //                       icon: Icon(Icons.favorite,color:click==0?Colors.grey:Colors.red,)
                      //                   ),
                      //                 ],
                      //               )
                      //             ],
                      //           ),
                      //           SizedBox(height: 2,),
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 5),
                      //             child: Text("${newmatchesdata[index]["first_name"]}".toUpperCase()+" "+"${newmatchesdata[index]["last_name"]}"[0].toUpperCase(),style: TextStyle(color: Colors.black,),),
                      //           ),
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 5),
                      //             child: Text("${newmatchesdata[index]["profession"]}-  ${newmatchesdata[index]["qualification"]}",style: TextStyle(color: Colors.grey,),),
                      //           ),
                      //           // Padding(
                      //           //   padding: const EdgeInsets.only(left: 5,top: 3),
                      //           //   child: Text("${newmatchesdata[index]["height"]}",style: TextStyle(color: Colors.black,),),
                      //           // ),
                      //           // Padding(
                      //           //   padding: const EdgeInsets.only(left: 5,),
                      //           //   child: Text("${newmatchesdata[index]["city"]}- ${newmatchesdata[index]["state"]}",style: TextStyle(color: Colors.black,),),
                      //           // ),
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 5,),
                      //             child: Text("${newmatchesdata[index]["religion"]}- ${newmatchesdata[index]["community"]}",style: TextStyle(color: Colors.grey,),),
                      //           ),
                      //
                      //           Padding(
                      //             padding: const EdgeInsets.only(left: 10,top: 10),
                      //             child: GestureDetector(
                      //               onTap: (){
                      //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>IndibisualMatchingResult(newmatchesdata[index])));
                      //               },
                      //               child: Container(
                      //                 height: MediaQuery.of(context).size.height*.03,
                      //                 width: MediaQuery.of(context).size.width*.25,
                      //                 decoration: BoxDecoration(
                      //                     border:Border.all(color: Colors.grey,width: 1),
                      //                     borderRadius: BorderRadius.circular(8)
                      //                 ),
                      //                 child: Center(
                      //                   child: Text("Matching",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                      //                 ),
                      //               ),
                      //             ),
                      //
                      //           ),
                      //           SizedBox(height: 5,)
                      //
                      //         ],
                      //       ),
                      //
                      //     ),
                      //   ),
                      // ),
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

    //);
  }
}
