import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/novo.dart';

class Carteira extends StatelessWidget {
  const Carteira({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 119, 102, 10),
        title: const Text('Carteira'),
        actions: const <Widget>[
          Icon(
            Icons.account_balance_wallet_outlined,
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
                    Widget _novo = Novo();
                    return _novo;
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.add_card_rounded,
                  color: Colors.black,
                ),
                title: Text('Cartão de credito'),
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
                    Widget _carteira = Carteira();
                    return _carteira;
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black,
                ),
                title: Text('Dinheiro'),
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
                    Widget _novo = Novo();
                    return _novo;
                    // return MyApp();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.pix_outlined,
                  color: Colors.black,
                ),
                title: Text('Pix'),
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
