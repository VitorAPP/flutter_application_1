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
        backgroundColor: Colors.pink.shade900,
        title: const Text('Dados de Privacidade e Segurança'),
        actions: const <Widget>[
          Icon(
            Icons.security_outlined,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 20,
              thickness: 5,
              // indent: 9,
              endIndent: 0,
              color: Colors.transparent,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  '',
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            const Card(
              color: Color.fromARGB(246, 214, 214, 214),
              child: ListTile(
                leading: Icon(
                  Icons.security_outlined,
                  color: Colors.black,
                ),
                title: Text(
                    "Nossos termos e condições estão disponíveis em 'https://www.drogalive.com/termos'. Para mais informações, contate nosso suporte."),
                textColor: Color.fromARGB(255, 3, 3, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
