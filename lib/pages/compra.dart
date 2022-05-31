import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
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
            children:<Widget> [

              Card(
            child: Container(child:  ListTile(
              trailing:Text('$_counter') ,
           
                leading: Image.network(
                    'https://araujo.vteximg.com.br/arquivos/ids/4154178-1000-1000/07898495608381.jpg'),
                title: Text('Vitamina C'),
                subtitle: Text(
                    'Suplemento alimentar com 1g de vitamina c + 10 mg de zinco + 10 mcg de vitamina D'),
               ),),
                
          ),
          const Text('Valor Total'),
          
          IconButton(onPressed: _decrementCounter, icon: Icon(Icons.remove_circle_outline)),
          Text('$_counter') ,
          IconButton(onPressed: _incrementCounter, icon: Icon(Icons.add_circle_outline,)),
             
             
              buildRadios(),
              
              
              
            ],
          ),
      ),
    );
      
    
  }

Widget buildRadios() => Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: unselectedColor,
        ),
        child: Column(
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
        ),
      );
}
