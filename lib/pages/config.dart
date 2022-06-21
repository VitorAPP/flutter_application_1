import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/notificacao.dart';
import 'package:flutter_application_1/pages/novo.dart';
import 'package:flutter_application_1/pages/versao.dart';

class Config extends StatelessWidget {
  const Config({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 119, 102, 10),
        title: const Text('Configurações'),
        actions: const <Widget>[
          Icon(
            Icons.settings,
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(246, 214, 214, 214)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Notificacao();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black,
                ),
                title: Text('Notificações e alertas'),
                textColor: Color.fromARGB(255, 3, 3, 3),
              ),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(246, 214, 214, 214)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Versao();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.api_sharp,
                  color: Colors.black,
                ),
                title: Text('Verificar versão do aplicativo'),
                textColor: Colors.black,
              ),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(246, 214, 214, 214)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Novo();
                    // return MyApp();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.search_outlined,
                  color: Colors.black,
                ),
                title: Text('Limpar histórico de busca'),
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
