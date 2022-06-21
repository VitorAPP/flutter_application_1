import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/carteira_model.dart';
import 'package:flutter_application_1/widget/vazia_list.dart';

class Compra extends StatefulWidget {
  const Compra({Key? key}) : super(key: key);

  @override
  _CompraState createState() => _CompraState();
}

class _CompraState extends State<Compra> {
  Compra cliente = Compra();
  static const values = <String>['Dinheiro', 'Cartão', 'Pix'];
  String selectedValue = values.first;
  final selectedColor = Color.fromRGBO(255, 119, 102, 10);
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
        backgroundColor: Color.fromRGBO(255, 119, 102, 10),
        title: const Text('Compra'),
        actions: <Widget>[
          Icon(
            Icons.shopping_cart,
            size: 50,
            color: Colors.black,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topText(width, height),
            carteiraModels.isEmpty
                ? EmptyList()
                : Column(children: [
                    mainListView(width, height),
                    SizedBox(
                      height: 12,
                    ),
                    bottominfo(width, height),
                    buildRadios(width, height),
                  ])
          ],
        ),
      ),
    );
  }

  int id = 1;
  buildRadios(width, height) {
    return Container(
      width: width,
      height: height / 7,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
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
              Text(
                  "Dinheiro",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize:18),
                ),
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
              Text(
                  "Cartão",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
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
             Text(
                  "Pix",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
            ],
          ),
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
            "Total ${numOfItems} Items",
            style: TextStyle(
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
                subtitle: Text("\R\$${ctmodel.valor}"),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Text(
                  "\R\$${somaTotalValorCarteira()}",
                  style: TextStyle(
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
    return  MaterialButton(
        minWidth: width / 1.2,
        height: height / 15,
        color:Color.fromRGBO(255, 119, 102, 10),
        onPressed: () {},
        child: Text(
          "Finalizar Compra",
          style: TextStyle(color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
        ),
      
    );
  }
}
