import 'package:flutter/material.dart';

class Versao extends StatelessWidget {
  const Versao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.pink.shade900,
        title: const Text('Versão do DrogaLive'),
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
            const Card(
              color: Color.fromARGB(246, 214, 214, 214),
              child: ListTile(
                leading: Icon(
                  Icons.api_sharp,
                  color: Colors.black,
                ),
                title: Text('Versão: 2.3.13'),
                textColor: Color.fromARGB(255, 3, 3, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
