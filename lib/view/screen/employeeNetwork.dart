import 'package:employeenetwork/provider/auth_provider.dart';
import 'package:employeenetwork/utill/color_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class EmployeeNetwork extends StatefulWidget {
  const EmployeeNetwork({Key? key}) : super(key: key);

  @override
  State<EmployeeNetwork> createState() => _EmployeeNetworkState();
}

class _EmployeeNetworkState extends State<EmployeeNetwork> {
  TextEditingController ssidEDTC = TextEditingController();
  TextEditingController pwdEDTC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  bool _isObscure = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20,right: 20,),
              padding: EdgeInsets.only(top: 10,bottom: 20,left: 10,right: 10),
              // width: 350,
              // height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.transparent)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                    alignment: Alignment.topLeft,
                    child: Text("Employee network",
                        style: TextStyle(
                          fontFamily: "DMSans",
                        color: ColorResources.body,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,

                        )),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Flexible(
                                      flex: 1,
                                        child: Text("",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "DMSans",
                                          color: ColorResources.body,),)),
                                    SizedBox(width: 10,),
                                    Flexible(
                                      flex: 4,
                                      child: TextFormField(
                                        // textAlign: TextAlign.center,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 7) {
                                            return "ENTER SSID";
                                          }
                                          return null;
                                        },
                                        controller:ssidEDTC ,
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(8.0),
                                            border: new OutlineInputBorder(),
                                            hintText: "  SSID*"),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        flex: 1,
                                        child: Text("",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "DMSans",
                                          color: ColorResources.body,),)),
                                    SizedBox(width: 10,),

                                    Flexible(
                                      flex: 4,
                                      child: TextFormField(
                                        // textAlign: TextAlign.center,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              value.length < 7) {
                                            return "ENTER PWD";
                                          }
                                          return null;
                                        },
                                        obscureText: true,

                                        controller:pwdEDTC,
                                        decoration: InputDecoration(

                                          contentPadding: const EdgeInsets.all(8.0),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          // suffixIcon: IconButton(
                                          //     icon: Icon(
                                          //       _isObscure
                                          //           ? Icons.visibility_outlined
                                          //           : Icons.visibility_off_outlined,
                                          //       color: Colors.black
                                          //     ),
                                          //     onPressed: () {
                                          //       setState(() {
                                          //         _isObscure = !_isObscure;
                                          //       });
                                          //     }),
                                          // border: new OutlineInputBorder(),
                                          hintText: "  password*",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(width: 10,),


                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){

                      if(ssidEDTC.text == null || pwdEDTC.text ==null){
                        return null;
                      } else {
                        Provider.of<AuthProvider>(context,listen: false).UpdateData("${ssidEDTC.text}", "${pwdEDTC.text}");

                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 40),
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          // Image.asset("assets/images/upload.png",width: 50,height: 50,),
                          // // SizedBox(height: 30,),
                          // Text(
                          //   "SUMBIT",
                          //   style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "DMSans",
                          //     color: ColorResources.body,),
                          // ),
                          Container(
                            padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Submit",
                                  style: TextStyle(
                                    fontFamily: "DMSans",
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    // color: ColorResources.body,
                                      ),
                                    child:  ImageIcon(
                                      AssetImage("assets/images/upload.png"),
                                      color: Colors.black
                                      // Color(0xFF3A5A98),
                                    ),
                                    // Icon(Icons.add,color: Colors.white,)
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
