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
        backgroundColor: const Color.fromRGBO(255, 119, 102, 10),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFffffff),
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
              const Text(
                'Bem-vindo ao DrogaLive!',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Enter your name"),
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
                decoration:
                    const InputDecoration(labelText: "Enter your number"),
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
                decoration:
                    const InputDecoration(labelText: "Enter your email"),
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
                    margin: const EdgeInsets.only(top: 12),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: Text('Submitting sucessfully.'));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                    style: const NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.circle(),
                      color: Colors.blue,
                    ),
                    child: NeumorphicIcon(
                      Icons.arrow_forward_sharp,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    // onPressed: ,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
