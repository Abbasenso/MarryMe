


// @dart=2.9
import 'dart:io';
import 'package:f_matrimony/home_pages/chat.dart';
import 'package:f_matrimony/home_pages/home.dart';
import 'package:f_matrimony/home_pages/inbox.dart';
import 'package:f_matrimony/home_pages/matches.dart';
import 'package:f_matrimony/home_pages/premium.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  //const HomePage({Key? key}) : super(key: key);
// File profile_im;
//   HomePage(im){
//     profile_im=im;
//   }


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cart=0;
  int selected_page=0;

  @override
  Widget build(BuildContext context) {
    final pageOption=[
      //MyHome(widget.profile_im),
      MyHome(),
      Matches(),
      Inbox(),
      Chat(),
      //Premium()
    ];
    return Scaffold(
      body: pageOption[selected_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: selected_page,
        selectedFontSize: 16,
        unselectedFontSize: 1,
        onTap: (index){
          setState(() {
            selected_page=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),
            label: "Home",
            //backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.wc),
            label: "Matches",
            //backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            // icon: Stack(
            //   //fit: StackFit.expand,
            //   children: [
            //     Icon(Icons.mail),
            //     Positioned(
            //         left: 13,
            //         //top: 0,
            //         right: 0,
            //         bottom: 11,
            //         child:
            //         Container(
            //           // height: 2,
            //           // width: 2,
            //           decoration: BoxDecoration(
            //             color: Colors.red,
            //             shape: BoxShape.circle,
            //           ),
            //           child: Center(
            //             child: Text("${cart.toString()}", style: TextStyle(color: Colors.white,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 12,
            //             )
            //             ),
            //           ),
            //         )
            //     )
            //   ],
            // ),
            icon: Icon(Icons.search),
            label: "Search",
            //backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
            label: "Profile",
            // backgroundColor: Colors.black
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.folder_special),
          //   label: "Premium",
          //   //backgroundColor: Colors.black,
          // ),

        ],
      ),
    );
  }
}
