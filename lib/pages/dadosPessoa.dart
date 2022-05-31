import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/novo.dart';


class DadosPessoal extends StatelessWidget {
  const DadosPessoal({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 119, 102, 10),
        title: const Text('DadosPessoal'),
        actions: <Widget>[
          Icon(
            Icons.draw_outlined,
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
              color: Colors.white,
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
                  primary: Color.fromRGBO(255, 119, 102, 10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    Widget _novo = Novo();
                    return _novo;
                  },
                ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ),
                title: Text('Editar dados Pessoais'),
                textColor: Colors.white,
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
                  primary: Color.fromRGBO(255, 119, 102, 10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    Widget _carteira = DadosPessoal();
                    return _carteira;
                  },
                ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                title: Text('Adicionar Endereço'),
                textColor: Colors.white,
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
                  primary: Color.fromRGBO(255, 119, 102, 10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    Widget _novo = Novo();
                    return _novo;
                   // return MyApp();
                  },
                ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.security_outlined,
                  color: Colors.black,
                ),
                title: Text('Privacidade e Segurança'),
                textColor: Colors.white,
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
                  primary: Color.fromRGBO(255, 119, 102, 10)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    Widget _novo = Novo();
                    return _novo;
                   // return MyApp();
                  },
                ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.dangerous_outlined,
                  color: Colors.black,
                ),
                title: Text('Encerrar sessão'),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
