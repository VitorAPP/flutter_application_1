import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/landing.dart';
import 'package:flutter_application_1/pages/novo.dart';
import 'package:flutter_application_1/pages/conta.dart';
import 'package:flutter_application_1/pages/endereco.dart';
import 'package:flutter_application_1/pages/privacidadeSeguranca.dart';

class DadosPessoal extends StatelessWidget {
  const DadosPessoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.pink.shade900,
        title: const Text('Dados pessoais'),
        actions: const <Widget>[
          Icon(
            Icons.draw_outlined,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
       // margin: const EdgeInsets.symmetric(horizontal: 100),
       // padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 20,
              thickness: 5,
              // indent: 9,
              endIndent: 0,
              color: Colors.black,
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

            /* ElevatedButton(
            
            onPressed: () => changePage(1),
            child: const Text('Voltar para principal'), 
          ),*/

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(246, 214, 214, 214)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Conta();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ),
                title: Text('Editar dados pessoais'),
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
                    return const Endereco();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                title: Text('Adicionar endere??o'),
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
                    return const Privacidade();
                    // return MyApp();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.security_outlined,
                  color: Colors.black,
                ),
                title: Text('Privacidade e Seguran??a'),
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
            const Divider(
              height: 20,
              thickness: 3,
              // indent: 9,
              endIndent: 0,
              color: Colors.black,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary:  Colors.pink.shade900),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return const Landing();
                    // return MyApp();
                  },
                ));
              },
              child: const ListTile(
                leading: Icon(
                  Icons.dangerous_outlined,
                  color: Colors.black,
                ),
                title: Text('Encerrar sess??o'),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
