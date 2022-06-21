import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/carteira_model.dart';
import 'package:flutter_application_1/pages/conta.dart';
import 'package:flutter_application_1/widget/vazia_list.dart';

class Compra extends StatefulWidget {
  const Compra({Key? key}) : super(key: key);

  @override
  _CompraState createState() => _CompraState();
}

class _CompraState extends State<Compra> {
  Compra cliente = const Compra();
  static const values = <String>['Dinheiro', 'Cartão', 'Pix'];
  String selectedValue = values.first;
  final selectedColor = const Color.fromRGBO(255, 119, 102, 10);
  final unselectedColor = Colors.black;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  double somaTotalValorCarteira() {
    double somaValor = 0;
    for (CarteiraModels carteiraModel in carteiraModels) {
      somaValor = somaValor + carteiraModel.valor;
    }
    return somaValor;
  }

  int numOfItems = carteiraModels.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 119, 102, 10),
        title: const Text('Compra'),
        actions: const <Widget>[
          Icon(
            Icons.shopping_cart,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topText(width, height),
            carteiraModels.isEmpty
                ? EmptyList()
                : Column(children: [
                    mainListView(width, height),
                    const SizedBox(
                      height: 12,
                    ),
                    bottominfo(width, height),
                    buildRadios(width, height),
                  ])
          ],
        ),
      )),
    );
  }

  int id = 1;
  buildRadios(width, height) {
    return Container(
      width: width,
      height: height / 6,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Container(
                      width: MediaQuery.of(context).size.width * (1 / 3),
                      child: Row(
                        children: [
                          SizedBox(width: width / 10),
                          Radio(
                            activeColor: selectedColor,
                            value: 1,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                id = 1;
                              });
                            },
                          ),
                          const Text(
                            "Dinheiro",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )
                        ],
                      )),
                  flex: 1),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * (1 / 3),
                      child: Row(
                        children: [
                          SizedBox(width: width / 10),
                          Radio(
                            activeColor: selectedColor,
                            value: 2,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                id = 2;
                              });
                            },
                          ),
                          const Text(
                            "Cartão",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      )),
                  flex: 1),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * (1 / 3),
                      child: Row(
                        children: [
                          SizedBox(width: width / 10),
                          Radio(
                            activeColor: selectedColor,
                            value: 3,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                id = 3;
                              });
                            },
                          ),
                          const Text(
                            "Pix",
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      )),
                  flex: 1),
            ],
          ),
          SizedBox(height: height / 15),
          materialButton(width, height)
        ],
      ),
      /*Column(
          children: values.map(
            (value) {
              final selected = this.selectedValue == value;
              final color = selected ? selectedColor : unselectedColor;

              return RadioListTile<String>(
                
                value: value,
                groupValue: selectedValue,
                
                title: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
                activeColor: selectedColor,
                onChanged: (value) =>
                    setState(() => this.selectedValue = value.toString()),
              );
            },
          ).toList(),
        ),*/
    );
  }

//Componete top
  topText(width, height) {
    return Container(
      width: width,
      height: height / 10,
      padding: EdgeInsets.symmetric(horizontal: width / 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Meu Carrinho",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          Text(
            "Total: ${numOfItems} itens",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

//componete meio lista produto
  mainListView(width, height) {
    return Container(
      width: width,
      height: height / 2.0,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: carteiraModels.length,
          itemBuilder: (ctx, index) {
            CarteiraModels ctmodel = carteiraModels[index];

            return Card(
              child: ListTile(
                leading: Image.asset(
                  ctmodel.imgR,
                  fit: BoxFit.cover,
                  width: 60,
                  height: 60,
                ),
                title: Text(ctmodel.nome),
                subtitle: Text("\R\$${ctmodel.valor.toStringAsFixed(2)}"),
                isThreeLine: true,
                trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                    splashColor: Colors.red,
                    tooltip: 'Remover do carrinho de compras',
                    onPressed: () {
                      ctmodel.qtdeRemedio--;
                      setState(() {
                        ctmodel.qtdeRemedio--;
                        carteiraModels.remove(ctmodel);
                        numOfItems = carteiraModels.length;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 600),
                          content: Icon(Icons.remove_shopping_cart_outlined,
                              color: Color.fromARGB(255, 49, 159, 98))));
                    }),
              ),
            );
          }),
    );
  }

//componete valor total do produto
  bottominfo(width, height) {
    return Container(
      width: width,
      height: height / 20,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width / 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Text(
                  "\R\$${somaTotalValorCarteira().toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //componete botão de finalizar compra
  materialButton(width, height) {
    return MaterialButton(
      minWidth: width / 1.2,
      height: height / 15,
      color: const Color.fromRGBO(255, 119, 102, 10),
      onPressed: () {},
      child: const Text(
        "Finalizar Compra",
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
