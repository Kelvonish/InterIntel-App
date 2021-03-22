import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:interintel/models%20and%20data/registerUser.dart';
import 'package:interintel/views/design.dart';
import 'package:interintel/views/menudesign.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();
  bool _load = false;
  String name;
  String email;
  String phone;
  bool isEmail(String string) {
    // Null or empty string is invalid
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 30.0),
                    child: Text(
                      "Info",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.centerLeft,
                          colors: [Color(0xfffbb448), Color(0xfff7892b)])),
                ),
                Positioned(
                    top: 120,
                    left: 50,
                    //alignment: Alignment.topLeft,
                    child: Image.asset(
                      "assets/info.png",
                      width: 200,
                    )),
                Positioned(
                  top: -MediaQuery.of(context).size.height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer(),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          name = val;
                        },
                        validator: (value) =>
                            value.isEmpty ? "Name cannot be empty" : null,
                        obscureText: false,
                        style: style,
                        decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 15),
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          email = val;
                        },
                        validator: (value) => isEmail(value.trim())
                            ? null
                            : "Please enter a valid email",
                        style: style,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 15),
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (val) {
                          phone = val;
                        },
                        validator: (value) => value.length < 10
                            ? "Please enter a number that is atleast 10 digits"
                            : null,
                        style: style,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 15),
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      _load
                          ? Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Color(0xfff7892b),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    _load = true;
                                  });
                                  bool success =
                                      await registerUser(name, email, phone);
                                  if (success) {
                                    setState(() {
                                      _load = false;
                                    });
                                    _formKey.currentState?.reset();
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.SUCCES,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'Success',
                                      desc: 'User is added',
                                      btnOkOnPress: () {
                                        Navigator.of(context).push(
                                            PageTransition(
                                                type: PageTransitionType
                                                    .rippleRightUp,
                                                child: Design()));
                                      },
                                    )..show();
                                  } else {
                                    setState(() {
                                      _load = false;
                                    });
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'Failed',
                                      desc: 'User is not added',
                                      showCloseIcon: true,
                                    )..show();
                                  }
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey.shade200,
                                          offset: Offset(2, 4),
                                          blurRadius: 5,
                                          spreadRadius: 2)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xfffbb448),
                                          Color(0xfff7892b)
                                        ])),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            )
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
