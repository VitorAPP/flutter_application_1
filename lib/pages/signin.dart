import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SignIn> {
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
                'Bem-vindo de volta!',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: "Insira seu e-mail"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Insira um e-mail válido";
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
                    const InputDecoration(labelText: "Insira seu número"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^\s*(\d{2}|\d{0})[-. ]?(\d{5}|\d{4})[-. ]?(\d{4})[-. ]?\s*$')
                          .hasMatch(value)) {
                    return "Insira um número válido";
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
                    const InputDecoration(labelText: "Insira seu e-mail"),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                    return "Insira um e-mail válido";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Inscreva-se já",
                    style: TextStyle(fontSize: 22),
                  ),
                  NeumorphicButton(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(20),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        const snackBar =
                            SnackBar(content: Text('Submitting sucessfully.'));
                        _scaffoldKey.currentState!.showSnackBar(snackBar);
                      }
                    },
                    style: const NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.circle(),
                      color: Colors.black,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Já tem conta?"),
                  Text("Esqueceu sua senha?")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
