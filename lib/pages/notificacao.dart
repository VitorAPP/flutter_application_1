import 'package:flutter/material.dart';

class Notificacao extends StatefulWidget {
  const Notificacao({Key? key}) : super(key: key);
  _State createState() => _State();
}

class _State extends State<Notificacao> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        title: const Text('Notificações e alertas'),
        actions: const <Widget>[
          Icon(
            Icons.notifications_active_outlined,
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
            Card(
              color: const Color.fromARGB(246, 214, 214, 214),
              child: SwitchListTile(
                  title: const Text("Promoções e descontos especiais"),
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
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
            Card(
              color: const Color.fromARGB(246, 214, 214, 214),
              child: SwitchListTile(
                  title: const Text("Notificações push para mensagens diretas"),
                  value: isSwitched2,
                  onChanged: (value) {
                    setState(() {
                      isSwitched2 = value;
                    });
                  }),
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
            Card(
              color: const Color.fromARGB(246, 214, 214, 214),
              child: SwitchListTile(
                  title: const Text("E-mails para pedidos confirmados"),
                  value: isSwitched3,
                  onChanged: (value) {
                    setState(() {
                      isSwitched3 = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
