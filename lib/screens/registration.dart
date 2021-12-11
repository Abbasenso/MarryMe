import 'dart:convert';

import 'package:f_matrimony/screens/registration1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
class Registration extends StatefulWidget {
  //const Registration({Key? key}) : super(key: key);
  String spid="";
  Registration(sp){
    spid=sp;
  }



  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final k1= GlobalKey<FormState>();
  String profilefor="";
  String firstname="";
  String lastname="";
  String gender="";
  String religion="";
  String community="";
  String username='';
  String password='';
  String confirmpassword='';
  TextEditingController profile =TextEditingController();
  TextEditingController first_name =TextEditingController();
  TextEditingController last_name =TextEditingController();
  TextEditingController gen =TextEditingController();
  TextEditingController rel =TextEditingController();
  TextEditingController com =TextEditingController();
  TextEditingController user_name=TextEditingController();
  TextEditingController pass_word=TextEditingController();
  TextEditingController confirm_password=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData().then((value) {
      //debugPrint('type-->$value');
      logindata=value;
      print("registration:$logindata");

      // do functions requiring value parameter
    });
  }
  var logindata=[];
  dynamic fetchData() async {
    final url="https://feonnaaherbals.com/vibaha_backend/registrationdatafetch.php";
    var _userData=[];
    try {
      final response = await http.get(Uri.parse(url));
      //debugPrint(response.body);
      final jsonData = jsonDecode(response.body) as List;
      // setState(() {
      //  userData= jsonData;
      // });
      _userData=jsonData;
      //print(_userData);
      return _userData;
    }
    catch (err) {
      print(err);
    }
  }


  @override
  Widget build(BuildContext context) {
    String sponsorid=widget.spid;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("F-Shaadi",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,),),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: Center(child: Text("Login >",style: TextStyle(color: Colors.blue),)),
      //     )
      //   ],
      // ),
      body: ListView(
        children: [
          Form(
            key: k1,
            child: Column(
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
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Let's set up your account,",style: TextStyle(color: Colors.black,fontSize: 17,),),
                      Text("While we find Matches for you!",style: TextStyle(color: Colors.black,fontSize: 17,),)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("All fields are mendatory",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                                ),
                              ],
                            )),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: TextFormField(
                              validator: (value){
                                if(user_name.text.length<=0){
                                  return 'Please enter your username';
                                }
                                else if(!logindata.isEmpty){
                                  for(var i=0;i<logindata.length;i++){
                                    if(logindata[i]["username"]==user_name.text){
                                      return 'Username already has been taken! Try another ';
                                    }
                                  }

                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: user_name,
                              decoration: InputDecoration(
                                labelText: "UserName",
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
                                  username=user_name.text;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: TextFormField(
                              validator: (value){
                                if(pass_word.text.length<=0){
                                  return 'Please enter your password';
                                }
                                else if(pass_word.text.length<8){
                                  return 'To short! Minimum 8 characters required';
                                }
                                // else if( !password.characters.contains('@')||!password.characters.contains('_')||!password.characters.contains('!')||!password.characters.contains('#')||!password.characters.contains('%')||!password.characters.contains('^')||!password.characters.contains('&')||!password.characters.contains('*')){
                                //   return 'Not Strong! Use(!,@,#,%,^,&,*)to make strong ';
                                // }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: pass_word,
                              decoration: InputDecoration(
                                labelText: "Password",
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
                                  password=pass_word.text;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: TextFormField(
                              validator: (value){
                                if(confirm_password.text.length<=0){
                                  return 'Please enter your confirm password';
                                }
                                else if(confirm_password.text != pass_word.text){
                                  return 'Not Match with password!';
                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: confirm_password,
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
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
                                  confirmpassword=confirm_password.text;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10,)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey,width: 1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("All fields are mendatory",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                                ),
                              ],
                            )),


                        SizedBox(height: 5,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Stack(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(profile.text==''){
                                      return 'Please choose a option';
                                    }
                                    return null;
                                  },
                                  enableInteractiveSelection: false,
                                  controller: profile,
                                  onChanged: (value){
                                    setState(() {
                                      profilefor=profile.text;
                                    });
                                  },
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    labelText: "Profile For",
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
                                              profilefor = newValue!;
                                              profile.text=newValue;
                                            });
                                          },
                                          items: <String>['Self', 'Son', 'Daughter', 'Brother','Sister','Friend','Relative']
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
                        ),


                        SizedBox(height: 15,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: TextFormField(
                              validator: (value){
                                if(first_name.text.length<=0){
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: first_name,
                              decoration: InputDecoration(
                                labelText: "First Name",
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
                                  firstname=first_name.text;
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: TextFormField(
                              validator: (value){
                                if(last_name.text.length<=0){
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                              enableInteractiveSelection: false,
                              controller: last_name,
                              decoration: InputDecoration(
                                labelText: "Last Name",
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
                                  lastname=last_name.text;
                                });
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 15,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Stack(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(gen.text==''){
                                      return 'Please choose your gender';
                                    }
                                    return null;
                                  },
                                  enableInteractiveSelection: false,
                                  autofocus: false,
                                  controller: gen,
                                  onChanged: (_){
                                    setState(() {
                                      gen.text="$gender";
                                    });
                                  },
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    labelText: "Gender",
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
                                        //value: gender,
                                        icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.black),
                                        underline: Container(color: Colors.white,),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            gender = newValue!;
                                            gen.text=newValue;
                                          });
                                        },
                                        items: <String>['Male','Female']
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
                        ),

                        SizedBox(height: 15,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Stack(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(rel.text==''){
                                      return 'Please choose your religion';
                                    }
                                    return null;
                                  },
                                  enableInteractiveSelection: false,
                                  controller: rel,
                                  onChanged: (_){
                                    setState(() {
                                      rel.text=religion;
                                    });
                                  },
                                  cursorColor: Colors.white,
                                  cursorRadius: Radius.circular(10),
                                  decoration: InputDecoration(
                                    labelText: "Religion",
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
                                        //value: religion,
                                        icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.black),
                                        underline: Container(color: Colors.white,),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            religion = newValue!;
                                            rel.text=newValue;
                                          });
                                        },
                                        items: <String>['Hindu','Muslim','Christian','Jain','Sikh','Buddhist','Parsi','Jewish','Other','No Religion','Spiritual-not religious']
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
                        ),


                        SizedBox(height: 15,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.06,
                            child: Stack(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(com.text==''){
                                      return 'Please choose your community';
                                    }
                                    return null;
                                  },
                                  enableInteractiveSelection: false,
                                  controller: com,
                                  onChanged: (_){
                                    setState(() {
                                      com.text=community;
                                    });
                                  },
                                  cursorColor: Colors.white,
                                  cursorRadius: Radius.circular(10),
                                  decoration: InputDecoration(
                                    labelText: "Community",
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
                                    // errorBorder: OutlineInputBorder(
                                    //   borderSide: BorderSide(
                                    //     color: Colors.red,
                                    //     width: 1.0,
                                    //   ),
                                    // )
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
                                        //value: religion,
                                        icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.black),
                                        underline: Container(color: Colors.white,),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            community = newValue!;
                                            com.text=newValue;
                                          });
                                        },
                                        items: <String>['Hindi','Marathi','Punjabi','Bengali','Gugarati','Urdu','Telugu','Kannada','English'
                                        'Tamil','Odia','Marwari','Aka','Arabic','Arunachali','Assamese','Awadhi','Baluchi','Bhojpuri','Bhutia',
                                          'Brahui','Brij','Burmese','Chattisgarhi','Chinese','Coorgi','Dogri','French','Garhwali','Garo',
                                          'Haryanavi','Himachali/Pahari','Hindko','Kakbarak','Kanauji','Kashmiri','Khandesi','Khasi',
                                          'Konkani','Koshali','Kumaoni','Kutchi','Ladakhi','Lepcha','Magahi','Maithili','Malay','Malayalam',
                                          'Manipuri','Miji','Mizo','Monpa','Nepali','Pashto','Persian','Rajasthani','Russian','Sanskrit','Santhali',
                                          'Seraiki','Sindhi','Sinhala','Sourashtra','Spanish','Swedish','Tagalog','Tulu','Other'
                                        ]
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
                        ),
                        SizedBox(height: 10,)
                      ],

                    ),
                  ),
                ),
                // Container(
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.only(right: 20),
                //           child: Text("All fields are mendatory",style: TextStyle(color: Colors.grey,fontSize: 12,)),
                //         ),
                //       ],
                //     )),
                //
                //
                // SizedBox(height: 5,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: Stack(
                //       children: [
                //         TextFormField(
                //           validator: (value){
                //             if(profile.text==''){
                //               return 'Please choose a option';
                //             }
                //             return null;
                //           },
                //           enableInteractiveSelection: false,
                //           controller: profile,
                //           onChanged: (value){
                //             setState(() {
                //               profilefor=profile.text;
                //             });
                //           },
                //           cursorColor: Colors.white,
                //           decoration: InputDecoration(
                //             labelText: "Profile For",
                //             focusedBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //                 width: 1.0,
                //               ),
                //             ),
                //           ),
                //           //keyboardType: TextInputType.none,
                //           readOnly: true,
                //         ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 10),
                //                 child:Text("")
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(right: 10),
                //                 child: DropdownButton<String>(
                //                   //value: profilefor,
                //                   icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //                   iconSize: 24,
                //                   elevation: 16,
                //                   style: const TextStyle(color: Colors.black),
                //                   underline: Container(color: Colors.white,),
                //                   onChanged: (String? newValue) {
                //                     setState(() {
                //                       profilefor = newValue!;
                //                       profile.text=newValue;
                //                     });
                //                   },
                //                   items: <String>['Self', 'Son', 'Daughter', 'Brother','Sister','Friend','Relative']
                //                       .map<DropdownMenuItem<String>>((String value) {
                //                     return DropdownMenuItem<String>(
                //                       value: value,
                //                       child: Text(value),
                //                     );
                //                   }).toList(),
                //                 ),
                //               ),
                //             ],
                //           )
                //       ],
                //     ),
                //   ),
                // ),
                //
                //
                // SizedBox(height: 15,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: TextFormField(
                //       validator: (value){
                //         if(first_name.text.length<=0){
                //           return 'Please enter your first name';
                //         }
                //         return null;
                //       },
                //       enableInteractiveSelection: false,
                //       controller: first_name,
                //       decoration: InputDecoration(
                //         labelText: "First Name",
                //         focusedBorder: OutlineInputBorder(
                //           //borderRadius: BorderRadius.circular(25.0),
                //           borderSide: BorderSide(
                //             color: Colors.blue,
                //           ),
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //           //borderRadius: BorderRadius.circular(25.0),
                //           borderSide: BorderSide(
                //             color: Colors.grey,
                //             width: 1.0,
                //           ),
                //         ),
                //       ),
                //       keyboardType: TextInputType.name,
                //       onChanged: (value){
                //         setState(() {
                //           firstname=first_name.text;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                //
                // SizedBox(height: 15,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: TextFormField(
                //       validator: (value){
                //         if(last_name.text.length<=0){
                //           return 'Please enter your last name';
                //         }
                //         return null;
                //       },
                //       enableInteractiveSelection: false,
                //       controller: last_name,
                //       decoration: InputDecoration(
                //         labelText: "Last Name",
                //         focusedBorder: OutlineInputBorder(
                //           //borderRadius: BorderRadius.circular(25.0),
                //           borderSide: BorderSide(
                //             color: Colors.blue,
                //           ),
                //         ),
                //         enabledBorder: OutlineInputBorder(
                //           //borderRadius: BorderRadius.circular(25.0),
                //           borderSide: BorderSide(
                //             color: Colors.grey,
                //             width: 1.0,
                //           ),
                //         ),
                //       ),
                //       keyboardType: TextInputType.name,
                //       onChanged: (value){
                //         setState(() {
                //           lastname=last_name.text;
                //         });
                //       },
                //     ),
                //   ),
                // ),
                //
                // SizedBox(height: 15,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: Stack(
                //       children: [
                //         TextFormField(
                //           validator: (value){
                //             if(gen.text==''){
                //               return 'Please choose your gender';
                //             }
                //             return null;
                //           },
                //           enableInteractiveSelection: false,
                //           autofocus: false,
                //           controller: gen,
                //           onChanged: (_){
                //             setState(() {
                //               gen.text="$gender";
                //             });
                //           },
                //           cursorColor: Colors.white,
                //           decoration: InputDecoration(
                //             labelText: "Gender",
                //             focusedBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //                 width: 1.0,
                //               ),
                //             ),
                //           ),
                //           //keyboardType: TextInputType.none,
                //           readOnly: true,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Padding(
                //                 padding: const EdgeInsets.only(left: 10),
                //                 child:Text("")
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(right: 10),
                //               child: DropdownButton<String>(
                //                 //value: gender,
                //                 icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //                 iconSize: 24,
                //                 elevation: 16,
                //                 style: const TextStyle(color: Colors.black),
                //                 underline: Container(color: Colors.white,),
                //                 onChanged: (String? newValue) {
                //                   setState(() {
                //                     gender = newValue!;
                //                     gen.text=newValue;
                //                   });
                //                 },
                //                 items: <String>['Male','Female']
                //                     .map<DropdownMenuItem<String>>((String value) {
                //                   return DropdownMenuItem<String>(
                //                     value: value,
                //                     child: Text(value),
                //                   );
                //                 }).toList(),
                //               ),
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //
                // SizedBox(height: 15,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: Stack(
                //       children: [
                //         TextFormField(
                //           validator: (value){
                //             if(rel.text==''){
                //               return 'Please choose your religion';
                //             }
                //             return null;
                //           },
                //           enableInteractiveSelection: false,
                //           controller: rel,
                //           onChanged: (_){
                //             setState(() {
                //               rel.text=religion;
                //             });
                //           },
                //           cursorColor: Colors.white,
                //           cursorRadius: Radius.circular(10),
                //           decoration: InputDecoration(
                //             labelText: "Religion",
                //             focusedBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //                 width: 1.0,
                //               ),
                //             ),
                //           ),
                //           //keyboardType: TextInputType.none,
                //           readOnly: true,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Padding(
                //                 padding: const EdgeInsets.only(left: 10),
                //                 child:Text("")
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(right: 10),
                //               child: DropdownButton<String>(
                //                 //value: religion,
                //                 icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //                 iconSize: 24,
                //                 elevation: 16,
                //                 style: const TextStyle(color: Colors.black),
                //                 underline: Container(color: Colors.white,),
                //                 onChanged: (String? newValue) {
                //                   setState(() {
                //                     religion = newValue!;
                //                     rel.text=newValue;
                //                   });
                //                 },
                //                 items: <String>['Hindu','Muslim','Christian','Jain','Sikh','Buddhist','Parsi','Jewish','Other','No Religion','Spiritual-not religious']
                //                     .map<DropdownMenuItem<String>>((String value) {
                //                   return DropdownMenuItem<String>(
                //                     value: value,
                //                     child: Text(value),
                //                   );
                //                 }).toList(),
                //               ),
                //             ),
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                //
                //
                // SizedBox(height: 15,),
                //
                //
                // Padding(
                //   padding: const EdgeInsets.only(left: 20,right: 20),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height*.06,
                //     child: Stack(
                //       children: [
                //         TextFormField(
                //           validator: (value){
                //             if(com.text==''){
                //               return 'Please choose your community';
                //             }
                //             return null;
                //           },
                //           enableInteractiveSelection: false,
                //           controller: com,
                //           onChanged: (_){
                //             setState(() {
                //               com.text=community;
                //             });
                //           },
                //           cursorColor: Colors.white,
                //           cursorRadius: Radius.circular(10),
                //           decoration: InputDecoration(
                //             labelText: "Community",
                //             focusedBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.blue,
                //               ),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               //borderRadius: BorderRadius.circular(25.0),
                //               borderSide: BorderSide(
                //                 color: Colors.grey,
                //                 width: 1.0,
                //               ),
                //             ),
                //             // errorBorder: OutlineInputBorder(
                //             //   borderSide: BorderSide(
                //             //     color: Colors.red,
                //             //     width: 1.0,
                //             //   ),
                //             // )
                //           ),
                //           //keyboardType: TextInputType.none,
                //           readOnly: true,
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Padding(
                //                 padding: const EdgeInsets.only(left: 10),
                //                 child:Text("")
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(right: 10),
                //               child: DropdownButton<String>(
                //                 //value: religion,
                //                 icon: const Icon(Icons.arrow_drop_down,color: Colors.blue,size: 30,),
                //                 iconSize: 24,
                //                 elevation: 16,
                //                 style: const TextStyle(color: Colors.black),
                //                 underline: Container(color: Colors.white,),
                //                 onChanged: (String? newValue) {
                //                   setState(() {
                //                     community = newValue!;
                //                     com.text=newValue;
                //                   });
                //                 },
                //                 items: <String>['Hindi','Marathi','Punjabi','Bengali','Gugarati','Urdu','Telugu','Kannada','English'
                //                 'Tamil','Odia','Marwari','Aka','Arabic','Arunachali','Assamese','Awadhi','Baluchi','Bhojpuri','Bhutia',
                //                   'Brahui','Brij','Burmese','Chattisgarhi','Chinese','Coorgi','Dogri','French','Garhwali','Garo',
                //                   'Haryanavi','Himachali/Pahari','Hindko','Kakbarak','Kanauji','Kashmiri','Khandesi','Khasi',
                //                   'Konkani','Koshali','Kumaoni','Kutchi','Ladakhi','Lepcha','Magahi','Maithili','Malay','Malayalam',
                //                   'Manipuri','Miji','Mizo','Monpa','Nepali','Pashto','Persian','Rajasthani','Russian','Sanskrit','Santhali',
                //                   'Seraiki','Sindhi','Sinhala','Sourashtra','Spanish','Swedish','Tagalog','Tulu','Other'
                //                 ]
                //                     .map<DropdownMenuItem<String>>((String value) {
                //                   return DropdownMenuItem<String>(
                //                     value: value,
                //                     child: Text(value),
                //                   );
                //                 }).toList(),
                //               ),
                //             ),
                //
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){
                    if(k1.currentState!.validate()){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder:
                              (context) =>
                              Registration1(widget.spid,profilefor,firstname,lastname,gender,religion,community,username,password)
                          ));}},
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
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.red,Colors.yellow]
                        )
                    ),
                    child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
                  ),
                ),
                SizedBox(height: 5,)

              ],
            ),
          ),
        ],
      ),
    );
  }

}
