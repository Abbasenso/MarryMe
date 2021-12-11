import 'dart:convert';

import 'package:f_matrimony/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class waitForActivation extends StatefulWidget {
  const waitForActivation({Key? key}) : super(key: key);

  @override
  _waitForActivationState createState() => _waitForActivationState();
}

class _waitForActivationState extends State<waitForActivation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("Your Profile Is In Verification State",style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: ()async {
              SharedPreferences sharedlogindata;
              sharedlogindata=await SharedPreferences.getInstance();
              sharedlogindata.setBool('login', true);
              sharedlogindata.clear();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>login()),ModalRoute.withName('/'));

              },
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
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.red,Colors.yellow]
                  )
              ),
              child: Center(child: Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
          )
        ],

      ),
    );
  }
}

