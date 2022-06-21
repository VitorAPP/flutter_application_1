import 'package:flutter/material.dart';
class Privacidade extends StatefulWidget {
  const Privacidade({Key? key}) : super(key: key);

  @override
  _PrivacidadeState createState() => _PrivacidadeState();
}

class _PrivacidadeState extends State<Privacidade> {

late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor:  Colors.pink.shade900,
        title: const Text('Dados de Privacidade e Segurança'),
        actions: <Widget>[
          Icon(
            Icons.security_outlined,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
    
    );
  }
}
