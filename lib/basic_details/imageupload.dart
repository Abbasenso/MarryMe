// @dart=2.9
import 'dart:convert';
import 'package:f_matrimony/home_pages/homepage.dart';
import 'package:f_matrimony/home_pages/waitforactivation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:async/async.dart";
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
//import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';



class imageUpload extends StatefulWidget {
  //ImageUpload({Key? key}) : super(key: key);
 String userid="";
  imageUpload(u){
    userid=u;
  }

  @override
  _imageUploadState createState() => _imageUploadState();
}

class _imageUploadState extends State<imageUpload> {
  SharedPreferences sharedlogindata;
  String selector="";
  bool select_value=false;
  bool select_value1=false;
  String Radio_value="";
  String radio1="Adhar Card";
  String radio2="Voter Id";
  String radio3="Driving Licence";

  File pickImage;
  File pickImageNew;
  getImageFromCamera()async{
    ImagePicker pick=await ImagePicker();
    final pickedImage=await pick.pickImage(source: ImageSource.camera,maxHeight:600 ,maxWidth: 400,imageQuality: 100,) ;
    if(pickedImage != null){
      if(selector=="profile_image"){
        setState(() {
          pickImage=File(pickedImage.path);
        });
      }
      else if(selector == "identity_proof"){
        setState(() {
          pickImageNew=File(pickedImage.path);
        });
      }
      return null;
    }
    else {
      setState(() {
        pickImage=pickImage;
      });
    }

  }

  getImageFromGallery()async{
    ImagePicker pick=await ImagePicker();
    final pickedImage=await pick.pickImage(source: ImageSource.gallery,maxHeight: 600,maxWidth: 400,imageQuality: 100) ;
    if(pickedImage != null){
      if(selector =="profile_image"){
        setState(() {
          pickImage=File(pickedImage.path);
        });
      }
      else if(selector=="identity_proof"){
        setState(() {
          pickImageNew=File(pickedImage.path);
        });
      }
      return null;
    }
    else {
      setState(() {
        pickImage=pickImage;
      });
    }

  }

  //  File _image;
  // final picker = ImagePicker();
  //
  // Future getImage()async{
  //
  //  PickedFile pickedFile1 = await picker.getImage(source: ImageSource.camera,);
  //  if(pickedFile1!=null){
  //    // setState(() {
  //    //   _image =File(pickedFile1.path);
  //    // });
  //    Directory appDirectory = await getApplicationDocumentsDirectory();
  //    File newImage = File(appDirectory.path + 'fileName');
  //    newImage.writeAsBytes(File(pickedFile1.path).readAsBytesSync());
  //
  //    setState(() {
  //      _image = newImage;
  //      print(newImage.path + ' test');
  //    });
  //  }
  //  else{
  //    setState(() {
  //      _image=_image;
  //    });
  //  }
  //
  //
  //   // else if(status.isDenied){
  //   //   PickedFile pickedFile1 = await picker.getImage(source: ImageSource.camera,);
  //   //   _image =File(pickedFile1.path);
  //   // }
  //   // else{
  //   //   showDialog(
  //   //       builder: (BuildContext context) => CupertinoAlertDialog(
  //   //         title: Text('Camera Permission'),
  //   //         content: Text(
  //   //             'This app needs camera access to take pictures for upload user profile photo'),
  //   //         actions: <Widget>[
  //   //           CupertinoDialogAction(
  //   //             child: Text('Deny'),
  //   //             onPressed: () => Navigator.of(context).pop(),
  //   //           ),
  //   //           CupertinoDialogAction(
  //   //             child: Text('Settings'),
  //   //             onPressed: () => openAppSettings(),
  //   //           ),
  //   //         ],
  //   //       ));
  //   // }
  //
  //
  //   //print(_image);
  // }
  //
  // // Future getImage1()async{
  // //   final pickedFile2 = await picker.getImage(source: ImageSource.gallery);
  // //
  // //   setState(() {
  // //     _image = File(pickedFile2.path);
  // //   });
  // //   print(_image);
  // // }

  String profile_image="";
  convertImage(){
    setState(() {
      profile_image=base64Encode(pickImage.readAsBytesSync());
    });
    print("$profile_image");
  }
  String identity_image="";
  convertImage1(){
    setState(() {
      identity_image=base64Encode(pickImageNew.readAsBytesSync());
    });
    print("$identity_image");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*.1,
                  width:MediaQuery.of(context).size.width*.2,

                  child: Image(image: AssetImage("image/splashscreenlogo.png"),
                    fit: BoxFit.fill,
                  )
              ),
              Text("Add Your Required Images",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 5,),
              Text("To make your profile more attractive and jenuin add",style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
              //Text("from",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)),
              Text("reuired image from Camera/Gallery",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold)),
              //SizedBox(height: 10,),

              Container(
                width: MediaQuery.of(context).size.width*.8,
                height: MediaQuery.of(context).size.height*.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: selector==''?
                    Image(image: NetworkImage("https://us.123rf.com/450wm/dvarg/dvarg1204/dvarg120400070/13238023-camera-and-photos-illustration-on-white-background.jpg?ver=6"),)
                    :
                    selector=="profile_image"?
                        pickImage==null?
                        Image(image: NetworkImage("https://us.123rf.com/450wm/dvarg/dvarg1204/dvarg120400070/13238023-camera-and-photos-illustration-on-white-background.jpg?ver=6"),)
                            :
                        Image.file(pickImage,fit: BoxFit.cover,)
                        :
                        pickImageNew==null?
                        Image(image: NetworkImage("https://us.123rf.com/450wm/dvarg/dvarg1204/dvarg120400070/13238023-camera-and-photos-illustration-on-white-background.jpg?ver=6"),)
                            :
                            Image.file(pickImageNew,fit: BoxFit.cover,)
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.person,color: Colors.grey,),
                ),
                title: Text("Add your profile image",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                selectedTileColor: Colors.grey[100],
                trailing: pickImage== null?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: CircleAvatar(backgroundColor: Colors.white,radius: 9,),):CircleAvatar(backgroundColor: Colors.blue,radius:10,child: Icon(Icons.done,color: Colors.white,size: 15,),),
                onTap: (){
                  setState(() {
                    selector="profile_image";
                    select_value=true;
                    select_value1=false;
                  });
                },
                selected: select_value,
              ),
              ListTile(
                leading: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.assignment_rounded,color: Colors.grey,),
                ),
                title: Text("Add your identity proof",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                selectedTileColor: Colors.grey[100],
                trailing: pickImageNew== null?CircleAvatar(radius: 10,backgroundColor: Colors.blue,child: CircleAvatar(backgroundColor: Colors.white,radius: 9,),):CircleAvatar(backgroundColor: Colors.blue,radius:10,child: Icon(Icons.done,color: Colors.white,size: 15,),),
                onTap: (){
                  setState(() {
                    selector="identity_proof";
                    select_value1=true;
                    select_value=false;
                  });
                },
                selected: select_value1,
              ),
              select_value1!=false?Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      Text("Adhar Card",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
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
                      Text("Voter Id",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
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
                      Text("Driving Licence",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              )

                  :Text(""),
              //Text("$Radio_value"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          if(selector!=''){
                            if(selector=="identity_proof"){
                              if(Radio_value!= ''){
                                getImageFromCamera();
                              }
                            }
                            else{
                              getImageFromCamera();
                            }
                          }
                          },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(width: .4,color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: NetworkImage(
                                "https://icon-library.com/images/material-design-camera-icon/material-design-camera-icon-18.jpg"

                            ),
                              fit: BoxFit.contain
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 2,),
                      Center(child: Text("Camera",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12)))
                    ],
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:(){
                          if(selector !=''){
                            if(selector=="identity_proof"){
                              if(Radio_value!= ''){
                                getImageFromGallery();
                              }
                            }
                            else{
                              getImageFromGallery();
                            }
                          }
                          },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(width: .4,color: Colors.blue),
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(image: NetworkImage(
                                // "https://assets.materialup.com/uploads/0cad3903-9de0-4786-8b32-771e575929c5/screen_shot_2015-02-02_at_3.58.47_pm.png"
                                  "https://sbcs.ac.in/assets/images/1040241.png"
                              ),
                                fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 2,),
                      Center(child: Text("Gallery",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),))
                    ],
                  )
                ],
              ),

              SizedBox(height: 10,),
              pickImage==null || pickImageNew==null?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Add your profile image and identity proof",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                  //Text("then only you can go ahead",style: TextStyle(color: Colors.grey))
                ],
              ):Text(""),
              pickImage==null || pickImageNew==null?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Text("Add your profile image and identity proof",style: TextStyle(color: Colors.grey),),
                  Text("then only you can go ahead..",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold))
                ],
              ):Text(""),SizedBox(height: 10,)

            ],
          ),
        ],
      ),
      floatingActionButton: pickImage==null|| pickImageNew==null?Text(""):FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.done,color: Colors.white,),
        onPressed: ()async{
          if(pickImage!=null && pickImageNew != null){
            await uploadImage();
            await setState(() async{
              sharedlogindata=await SharedPreferences.getInstance();
              sharedlogindata.setString("identitytype", "$Radio_value");
              sharedlogindata.setString("profilepic", "$profile_image");
              sharedlogindata.setBool('login', false);
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) =>
                        HomePage()
                )
            );
          }
        },
      ),
    );
  }
  Future uploadImage()  async{
    convertImage();
    convertImage1();
    String uid=widget.userid;


    // url to registration php script
    var APIURL = "https://marryme.world/vibaha_backend/profileimage.php";
    //json maping user entered details

    Map mapedimage ={
      // 'userid':"$uid",
      // 'image':"$post_img",
      'userid':"$uid",
      'profile_image':"$profile_image",
      'identity_type':"$Radio_value",
      'identity_image':"$identity_image"

    };
    //send  data using http post to our php code
    http.Response reponse = await http.post(Uri.parse(APIURL),body:mapedimage );
    //getting response from php code, here
    var data = jsonDecode(reponse.body);
    print("DATA: ${data}");
    print("$uid");
  }
}
