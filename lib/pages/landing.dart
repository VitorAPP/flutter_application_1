import 'dart:math';
import 'dart:ui';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  _Landing createState() => _Landing();
}

class _Landing extends State<Landing> {
  final formKey = GlobalKey<FormState>();
  String name = "";

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFffffff),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                'Bem-vindo',
                style: TextStyle(fontSize: 30, color: Color(0xFF363F93)),
              ),
              Text(
                'ao DrogaLive!',
                style: TextStyle(fontSize: 30, color: Color(0xFF363f93)),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your name"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                    return "Enter correct name";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.04,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your number"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^\s*(\d{2}|\d{0})[-. ]?(\d{5}|\d{4})[-. ]?(\d{4})[-. ]?\s*$')
                          .hasMatch(value!)) {
                    return "Enter correct phone number";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Enter your email"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2-4}$')
                          .hasMatch(value!)) {
                    return "Enter correct email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 22, color: Colors.blue[900]),
                  ),
                  NeumorphicButton(
                    margin: EdgeInsets.only(top: 12),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: Text('Submitting sucessfully.'));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
