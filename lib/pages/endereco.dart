import 'package:flutter/material.dart';

class Endereco extends StatefulWidget {
  const Endereco({Key? key}) : super(key: key);

  @override
  _EnderecoState createState() => _EnderecoState();
}

class _EnderecoState extends State<Endereco> {
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
        title: const Text('Dados do Endereço'),
        actions: const <Widget>[
          Icon(
            Icons.home_outlined,
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
            Row(
              children: const [
                Expanded(
                    flex: 9,
                    child: Text('CEP',
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
                    child: Text('71966-700',
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
                    child: Text('Endereço',
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
                    child: Text('QS 07, Lote 01, Taguatinga Sul',
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
                    child: Text('Cidade',
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
                    child: Text('Taguatinga',
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
                    child: Text('Estado',
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
                    child: Text('Brasília - DF',
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
