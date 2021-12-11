import 'package:f_matrimony/screens/final_login.dart';
import 'package:f_matrimony/screens/registration.dart';
import 'package:f_matrimony/screens/sponsor_verification.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';



class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String sponsorid="CN";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Carousel(
              images: [
                // AssetImage("image/slider_im1.png"),
                // AssetImage("image/slider_im3.jpg"),
                // AssetImage("image/slider_im4.jpg")
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("image/loginnewslider5.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("image/loginnewslider2.jpeg"),
                //           fit: BoxFit.fill
                //       )
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //           image: AssetImage("image/loginnewslider3.jpeg"),
                //           fit: BoxFit.fill
                //       )
                //   ),
                // )
              ],
              dotSize: 6,
              dotVerticalPadding: 50,
              dotBgColor: Colors.transparent,
              dotColor: Colors.white,
              dotIncreasedColor: Colors.transparent,
              dotSpacing: 13,
              dotPosition: DotPosition.bottomCenter,
              autoplayDuration: Duration(seconds: 3),
              autoplay:false,

            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.white,
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*.7,),
              Center(child: Text("New to Vivah.com?",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
              SizedBox(height: 5,),
              GestureDetector(
                child: Container(
                  height: MediaQuery.of(context).size.height*.05,
                  width: MediaQuery.of(context).size.width*.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,end: Alignment.bottomCenter,
                      colors: [Colors.red,Colors.yellow]
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Icon(Icons.group_add,color: Colors.white,size: 30,),
                      ),
                      SizedBox(width: 10,),
                      Text("Sign Up by Sponsor",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
                    ],
                  ),
                ),
                onTap: (){
                  setState(() {
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          SponsorVreification()
                      )
                  );

                },
              ),
              SizedBox(height: 10,),
              GestureDetector(
                child: Container(
                  height: MediaQuery.of(context).size.height*.05,
                  width: MediaQuery.of(context).size.width*.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,end: Alignment.bottomCenter,
                          colors: [Colors.red,Colors.yellow]
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child:
                        // Image(image: NetworkImage("https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",),
                        // )
                        Icon(Icons.person,color: Colors.white,size: 30,),
                      ),
                      SizedBox(width: 10,),
                      Text("Sign Up by Candidate",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
                    ],
                  ),
                ),
                onTap: (){
                  setState(() {
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context) =>
                          Registration(sponsorid)
                      )
                  );

                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.09,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 5,),
                  Container(
                    height: MediaQuery.of(context).size.height*.06,
                      width: MediaQuery.of(context).size.width*.1,
                      child: Image(image: AssetImage("image/splashscreenlogo.png"),
                        fit: BoxFit.contain,
                      )
                  ),
                  SizedBox(width: 5,),
                  Text("Already have an account?",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                  GestureDetector(
                    child: Container(
                      height: MediaQuery.of(context).size.height*.03,
                      width: MediaQuery.of(context).size.width*.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.7),
                            spreadRadius: 1,
                            blurRadius: 15,
                            offset: Offset(0,10), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text("Login",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold ,fontSize: 15),),
                      ),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder:
                              (context) =>
                              FinalLogin()
                          )
                      );
                    },
                  )
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}


class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color=Colors.red;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}