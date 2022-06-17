//import 'dart:convert';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/carteira_model.dart';
import 'package:flutter_application_1/model/remedio.dart';
import 'package:flutter_application_1/pages/carteira.dart';
import 'package:flutter_application_1/pages/four.dart';
import 'package:flutter_application_1/pages/novo.dart';
import 'package:flutter_application_1/pages/config.dart';
import 'package:flutter_application_1/pages/compra.dart';
import 'package:flutter_application_1/pages/pedido.dart';
import 'package:flutter_application_1/pages/dadosPessoa.dart';
import 'package:flutter_application_1/widget/search_widget.dart';
import 'package:flutter_application_1/dado/remedio_dado.dart';

void main() {
  runApp(const MyApp());
}

const String pagePerfil = "Perfil";
const String pageBusca = "Busca";
const String page3 = "Início";

const String title = "DrogaLive";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _pagePerfil;
  late Widget _pageBusca;
  late Widget _page3;
  late Widget _pageCarteira;
  late Widget _novo;
  late Widget _pagePedido;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _pagePerfil = PagePerfil(changePage: _changeTab);
    // _page1 = const Page1();
    _pageBusca = PageBusca(changePage: _changeTab);
    _page3 = Page3(changePage: _changeTab);
    _novo = const Novo();

    //_page4 = const Page4();
    _pages = [
      _pagePerfil,
      _pageBusca,
      _page3,
    ];
    _currentIndex = 0;
    _currentPage = _pagePerfil;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 119, 102, 10),
        title: const Text('DrogaLive'),
        actions: const <Widget>[],
      ),
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _changeTab(index);
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: pagePerfil,
            icon: Icon(Icons.account_circle),
          ),
          BottomNavigationBarItem(
            label: pageBusca,
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: page3,
            icon: Icon(Icons.home),
          ),
        ],
        selectedItemColor: const Color.fromRGBO(255, 119, 102, 10),
        unselectedItemColor: const Color.fromARGB(255, 214, 214, 214),
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            color: Color.fromARGB(255, 4, 32, 56), fontSize: 20.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}

class PagePerfil extends StatelessWidget {
  const PagePerfil({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;

  ElevatedButton butoesPerfil(
      {required BuildContext context,
      required Icon iconeDePerfil,
      required Text textoDoIncone,
      required int x}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(255, 119, 102, 10)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            var cadaum = [
              const Compra(),
              const Pedido(),
              const Novo(),
              const DadosPessoal(),
              const Carteira(),
              const Config()
            ];
            return cadaum[x];
          },
        ));
      },
      child: ListTile(
          leading: iconeDePerfil,
          title: textoDoIncone,
          textColor: Colors.white),
    );
  }

  Container espacamento() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: const Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          '',
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 100),
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Icon(Icons.account_circle, size: 50),
            Text(pagePerfil, style: Theme.of(context).textTheme.headline6),
            const Divider(
              height: 20,
              thickness: 5,
              // indent: 9,
              endIndent: 0,
              color: Colors.black,
            ),
            espacamento(),
            espacamento(),
            butoesPerfil(
                context: context,
                iconeDePerfil:
                    const Icon(Icons.shopping_cart, color: Colors.black),
                textoDoIncone: const Text('Carrinho de Compras'),
                x: 0),
            espacamento(),
            butoesPerfil(
                context: context,
                iconeDePerfil: const Icon(Icons.delivery_dining_sharp,
                    color: Colors.black),
                textoDoIncone: const Text('Acompanhar Pedido'),
                x: 1),
            espacamento(),
            butoesPerfil(
                context: context,
                iconeDePerfil:
                    const Icon(Icons.chat_outlined, color: Colors.black),
                textoDoIncone: const Text('Chats'),
                x: 2),
            espacamento(),
            butoesPerfil(
                context: context,
                iconeDePerfil:
                    const Icon(Icons.draw_outlined, color: Colors.black),
                textoDoIncone: const Text('Dados Pessoais'),
                x: 3),
            espacamento(),
            butoesPerfil(
                context: context,
                iconeDePerfil: const Icon(Icons.account_balance_wallet_outlined,
                    color: Colors.black),
                textoDoIncone: const Text('Carteira'),
                x: 4),
            espacamento(),
            butoesPerfil(
                context: context,
                iconeDePerfil: const Icon(Icons.settings, color: Colors.black),
                textoDoIncone: const Text('Cofigurações'),
                x: 5),
            espacamento(),
          ],
        ),
      ),
    );
  }
}

class PageBusca extends StatefulWidget {
  final void Function(int) changePage;
  const PageBusca({Key? key, required this.changePage}) : super(key: key);
  @override
  _PageBuscaState createState() => _PageBuscaState();
}

class _PageBuscaState extends State<PageBusca> {
  String query = '';
  late List<Remedio> remedios;
  void initState() {
    super.initState();

    remedios = todosRemedios;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildSearch(),
          Expanded(
            child: ListView.builder(
              itemCount: remedios.length,
              itemBuilder: (context, index) {
                final remedio = remedios[index];

                return buildBook(remedio);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBook(Remedio remedio) => ListTile(
        leading: Image.network(
          remedio.imagemRemedio,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
        ),
        title: Text(remedio.nomeRemedio),
        subtitle: Text(remedio.descRemedio),
        isThreeLine: true,
        trailing: IconButton(
            icon: const Icon(
              Icons.add_shopping_cart_outlined,
            ),

            // disabledColor: Colors.blue,
            // focusColor: Colors.blue,
            // hoverColor: Colors.blue,
            splashColor: const Color.fromARGB(255, 49, 159, 98),
            //highlightColor: Colors.blue,

            tooltip: 'adicionar ao carrinho de compras',
            onPressed: () {
              _addParaCarteira(
                  nome: remedio.nomeRemedio,
                  valor: remedio.valorRemedio,
                  imgR: remedio.imagemRemedio,
                  qtdeRemedio: 1);

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Icon(Icons.add_task,
                      color: Color.fromARGB(255, 49, 159, 98))));
            }),
      );
  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Nome do remédio ou descrição',
        onChanged: searchRemedio,
      );

  void searchRemedio(String query) {
    final remedios = todosRemedios.where((remedio) {
      final titleLower = remedio.descRemedio.toLowerCase();
      final authorLower = remedio.nomeRemedio.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.remedios = remedios;
    });
  }

  void _addParaCarteira({
    required String nome,
    required double valor,
    required String imgR,
    required qtdeRemedio,
  }) {
    final addRemedio = CarteiraModel(
      nome: nome,
      valor: valor,
      imgR: imgR,
      qtdeRemedio: qtdeRemedio,
    );
    setState(() {
      carteiraModel.add(addRemedio);
    });
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key, required this.changePage}) : super(key: key);
  final void Function(int) changePage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(page3, style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
            onPressed: () => changePage(1),
            child: const Text('Voltar para principal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  Widget _novo = const Novo();
                  return _novo;
                },
              ));
            },
            child: const Text('Novo anúncio'),
          )
        ],
      ),
    );
  }
}
