import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/carteira.dart';
import 'package:flutter_application_1/pages/four.dart';
import 'package:flutter_application_1/pages/novo.dart';
import 'package:flutter_application_1/pages/compra.dart';
import 'package:flutter_application_1/pages/pedido.dart';
import 'package:flutter_application_1/pages/dadosPessoa.dart';

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
    _pageBusca = const PageBusca();
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
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.location_pin,
        //     color: Colors.white,
        //   ),
        //   tooltip: 'Local',
        //   onPressed: null,
        // ),
        backgroundColor: Color.fromRGBO(255, 119, 102, 10),
        title: Text('DrogaLive'),
        actions: <Widget>[
          /* IconButton(
            icon: const Icon(Icons.qr_code),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('QR')));
            },
          ),*/
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Pesquisa',
            onPressed:
                null, /*() {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return _pageBusca;
                },
              ));
            },*/
          ),
        ],
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
        selectedItemColor: Color.fromRGBO(255, 119, 102, 10),
        unselectedItemColor: const Color.fromARGB(255, 214, 214, 214),
      ),
      /*  drawer: Drawer(
        child: Container(
          margin: const EdgeInsets.only(top: 0.0),
          
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
            color: Color.fromRGBO(255, 119, 102, 10),
          ),
                
                accountEmail: Text("xpto@mail.com"),
                accountName: Text("Eri"),
                currentAccountPicture: CircleAvatar(
                  child: Text("ER"),
                 
                  
                ),
              ),
              _navigationItemListTitle(pagePerfil, 0),
              _navigationItemListTitle(pageBusca, 1),
              _navigationItemListTitle(page3, 2),
              _navigationItemListTitle(pageCarteira, 3),
              //  _navigationItemListTitle(page4, 3),
              SizedBox(height: 50),
              Divider(),
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(flex: 2, child: Icon(Icons.output_outlined)),
                  Expanded(
                      flex: 9,
                      child: Text('Sair',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          textAlign: TextAlign.left)),
                ],
              ),
            ],
          ),
        ),
      ),*/
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title',
        style: TextStyle(color: Color.fromARGB(255, 4, 32, 56), fontSize: 20.0),
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

/*
  ElevatedButton butoesPerfil({required BuildContext context, required Icon iconeDePerfil, required Text textoDoIncone }) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: Color.fromRGBO(255, 119, 102, 10)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute<void>(
          builder: (BuildContext context) {
            Widget _compra = Compra();
            return _compra;
          },
        ));
      },
      child: ListTile(
          leading: iconeDePerfil,
          title: textoDoIncone, 
          textColor: Colors.white),
    );
  }
  */

  Container espacamento() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
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
    return Center(
      // alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.account_circle, size: 50),
          Text('$pagePerfil', style: Theme.of(context).textTheme.headline6),
          const Divider(
            height: 20,
            thickness: 5,
            // indent: 9,
            endIndent: 0,
            color: Colors.black,
          ),
          espacamento(),
          // butoesPerfil(context: context, iconeDePerfil: Icon(Icons.shopping_cart, color: Colors.black), textoDoIncone: Text('Carrinho de Compras')),

          /* Container(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                '',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.start,
              ),
            ),
          ),*/

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
                  Widget _compra = Compra();
                  return _compra;
                },
              ));
            },
            child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                title: Text('Carrinho de Compras'),
                textColor: Colors.white),
          ),

          espacamento(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 119, 102, 10)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  Widget _pedido = Pedido();
                  return _pedido;
                },
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.delivery_dining_sharp,
                color: Colors.black,
              ),
              title: Text('Acompanha Pedido'),
              textColor: Colors.white,
            ),
          ),
          espacamento(),
          /*MaterialButton(
            color: Color.fromRGBO(255, 119, 102, 10),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  Widget _novo = Novo();
                  return _novo;
                },
              ));
            },
            child: ListTile(leading:Icon(Icons.moped_sharp, color: Colors.black,), title: Text('Acompanha pedido'),textColor: Colors.white, ),
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
                Icons.chat_outlined,
                color: Colors.black,
              ),
              title: Text('Chats'),
              textColor: Colors.white,
            ),
          ),
          espacamento(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 119, 102, 10)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  Widget _dadosPessoal = DadosPessoal();
                  return _dadosPessoal;
                },
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.draw_outlined,
                color: Colors.black,
              ),
              title: Text('Dados Pessoais'),
              textColor: Colors.white,
            ),
          ),
          espacamento(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(255, 119, 102, 10)),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  Widget _carteira = Carteira();
                  return _carteira;
                },
              ));
            },
            child: ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.black,
              ),
              title: Text('Carteira'),
              textColor: Colors.white,
            ),
          ),
          espacamento(),
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
                Icons.settings,
                color: Colors.black,
              ),
              title: Text('Configuraçõs'),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class PageBusca extends StatelessWidget {
  const PageBusca({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: ListTile(
                leading: Image.network(
                    'https://araujo.vteximg.com.br/arquivos/ids/4154178-1000-1000/07898495608381.jpg'),
                title: Text('Vitamina C'),
                subtitle: Text(
                    'Suplemento alimentar com 1g de vitamina c + 10 mg de zinco + 10 mcg de vitamina D'),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'adicionar ao carrinho de compras',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Icon(Icons.add_task,
                              color: Color.fromARGB(255, 49, 159, 98))));
                    })),
          ),
          Card(
            child: ListTile(
                leading: Image.network(
                    'https://araujo.vteximg.com.br/arquivos/ids/4154178-1000-1000/07898495608381.jpg'),
                title: Text('Vitamina C'),
                subtitle: Text(
                    'Suplemento alimentar com 1g de vitamina c + 10 mg de zinco + 10 mcg de vitamina D'),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'adicionar ao carrinho de compras',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Icon(Icons.add_task,
                              color: Color.fromARGB(255, 49, 159, 98))));
                    })),
          ),
          Card(
            child: ListTile(
                leading: Image.network(
                    'https://araujo.vteximg.com.br/arquivos/ids/4154178-1000-1000/07898495608381.jpg'),
                title: Text('Vitamina C'),
                subtitle: Text(
                    'Suplemento alimentar com 1g de vitamina c + 10 mg de zinco + 10 mcg de vitamina D'),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'adicionar ao carrinho de compras',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Icon(Icons.add_task,
                              color: Color.fromARGB(255, 49, 159, 98))));
                    })),
          ),
          Card(
            child: ListTile(
                leading: Image.network(
                    'https://araujo.vteximg.com.br/arquivos/ids/4154178-1000-1000/07898495608381.jpg'),
                title: Text('Vitamina C'),
                subtitle: Text(
                    'Suplemento alimentar com 1g de vitamina c + 10 mg de zinco + 10 mcg de vitamina D'),
                trailing: IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'adicionar ao carrinho de compras',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Icon(Icons.add_task,
                              color: Color.fromARGB(255, 49, 159, 98))));
                    })),
          ),
        ],
      ),
    );
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
          Text('$page3', style: Theme.of(context).textTheme.headline6),
          ElevatedButton(
            onPressed: () => changePage(1),
            child: const Text('Voltar para principal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  Widget _novo = Novo();
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

/*
class PageCarteira extends StatelessWidget {
  const PageCarteira({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 119, 102, 10),
        title: const Text('Carteira'),
        actions: <Widget>[
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
                  Icons.add_card_rounded,
                  color: Colors.black,
                ),
                title: Text('Cartão de credito'),
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
                    Widget _carteira = Carteira();
                    return _carteira;
                  },
                ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.black,
                ),
                title: Text('Dinheiro'),
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
                    return MyApp();
                  },
                ));
              },
              child: ListTile(
                leading: Icon(
                  Icons.pix_outlined,
                  color: Colors.black,
                ),
                title: Text('Pix'),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/