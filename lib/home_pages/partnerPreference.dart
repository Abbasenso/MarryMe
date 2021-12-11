import 'package:f_matrimony/screens/final_login.dart';
import 'package:f_matrimony/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PartnerPreference extends StatefulWidget {
  const PartnerPreference({Key? key}) : super(key: key);

  @override
  _PartnerPreferenceState createState() => _PartnerPreferenceState();
}

class _PartnerPreferenceState extends State<PartnerPreference> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Your Partner Preferences",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,)),
        centerTitle: true,

      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("You will see Matches based on the Preferences you",style: TextStyle(color: Colors.grey),),
              Text("have set",style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30,),
              Text("Tap on the field to edit",style: TextStyle(color: Colors.grey)),
              Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: Container(
                  width: MediaQuery.of(context).size.width*.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Basic Details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 20,),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green[300]),
                          child: Icon(Icons.date_range,color: Colors.white,size: 18,),
                        ),
                        title: Text("Age Range",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        subtitle: Text("19 to 25",style: TextStyle(color: Colors.black,fontSize: 12),),
                          trailing: Icon(Icons.arrow_forward_ios,size: 15),
                      ),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green[300]),
                          child: Icon(Icons.height,color: Colors.white,size: 18,),
                        ),
                        title: Text("Height Range",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        subtitle: Text("4\'11\" to 5\'7\"",style: TextStyle(color: Colors.black,fontSize: 12),),
                        trailing: Icon(Icons.arrow_forward_ios,size: 15),
                      ),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.green[300]),
                          child: Icon(Icons.group,color: Colors.white,size: 18,),
                        ),
                        title: Text("Marital Status",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        subtitle: Text("Never Married",style: TextStyle(color: Colors.black,fontSize: 12),),
                        trailing: Icon(Icons.arrow_forward_ios,size: 15),
                      )
                    ],
                  ),

                ),
              ),
              SizedBox(height: 10,),

              Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: Container(
                  width: MediaQuery.of(context).size.width*.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Community",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 20,),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orangeAccent),
                          child: Icon(Icons.book,color: Colors.white,size: 18,),
                        ),
                        title: Text("Religion",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        subtitle: Text("Hindu",style: TextStyle(color: Colors.black,fontSize: 12),),
                        trailing: Icon(Icons.arrow_forward_ios,size: 15),
                      ),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orangeAccent),
                          child: Icon(Icons.group_add,color: Colors.white,size: 18,),
                        ),
                        title: Text("Community",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        subtitle: Text("Sunni,Bengali,Sunni Hanafi etc.",style: TextStyle(color: Colors.black,fontSize: 12),),
                        trailing: Icon(Icons.arrow_forward_ios,size: 15),
                      ),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.orangeAccent),
                          child: Icon(Icons.group,color: Colors.white,size: 18,),
                        ),
                        title: Text("Mother Tounge",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        subtitle: Text("Bengali",style: TextStyle(color: Colors.black,fontSize: 12),),
                        trailing: Icon(Icons.arrow_forward_ios,size: 15),
                      ),
                      ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
                          child: Icon(Icons.logout,color: Colors.white,size: 18,),
                        ),
                        title: Text("Logout",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        //subtitle: Text("Bengali",style: TextStyle(color: Colors.black,fontSize: 12),),
                        //trailing: Icon(Icons.arrow_forward_ios,size: 15),
                        onTap: ()async{
                          SharedPreferences sharedlogindata;
                          sharedlogindata=await SharedPreferences.getInstance();
                          sharedlogindata.setBool('login', true);
                          sharedlogindata.clear();
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()),ModalRoute.withName('/'));
                          //Navigator.pop(context);
                        },
                      )
                    ],
                  ),

                ),
              ),



            ],
          )
        ],
      ),

    );
  }
}
