import 'package:flutter/material.dart';

class Conta extends StatefulWidget {
  const Conta({Key? key}) : super(key: key);

  @override
  _ContaState createState() => _ContaState();
}

class _ContaState extends State<Conta> {
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
        title: const Text('Dados da conta'),
        actions: const <Widget>[
          Icon(
            Icons.account_circle_outlined,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 100),
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Icon(Icons.account_circle, size: 50),
            Text('Perfil', style: Theme.of(context).textTheme.headline6),
            const Divider(
              height: 20,
              thickness: 5,
              // indent: 9,
              endIndent: 0,
              color: Colors.black,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('Nome',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('João',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            const Divider(
              color: Colors.white,
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('Sobrenome',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('Silva',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('Número de telefone',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('61922334455',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('E-mail',
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('joão.silva2022@gmail.com',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                        textAlign: TextAlign.left)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
