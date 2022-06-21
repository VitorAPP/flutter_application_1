import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/novo.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

double _value = 1;

class Pedido extends StatefulWidget {
  const Pedido({Key? key}) : super(key: key);

  @override
  _PedidoState createState() => _PedidoState();
}

class _PedidoState extends State<Pedido> {
  // Pedido cliente = Pedido();
  String apelido = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 119, 102, 10),
          title: const Text('Pedido'),
          actions: const <Widget>[
            Icon(
              Icons.delivery_dining_sharp,
              size: 50,
              color: Colors.black,
            ),
          ],
        ),
        body: Center(
            child: SfSliderTheme(
          data: SfSliderThemeData(
            tickSize: const Size(20.0, 0.0),
            thumbRadius: 22,
            activeDividerRadius: 11,
            inactiveDividerRadius: 12,
            activeTrackHeight: 10,
            inactiveTrackHeight: 7,
            activeDividerStrokeColor: Colors.green,
            activeDividerStrokeWidth: 12,
            activeTrackColor: Colors.green,
            inactiveDividerColor: const Color.fromARGB(202, 207, 216, 220),
            thumbColor: const Color.fromRGBO(255, 119, 102, 10),
          ),
          child: SfSlider.vertical(
            value: _value.toDouble(),
            min: 1,
            max: 4,
            interval: 1,
            //  showLabels: true,
            showDividers: true,
            thumbIcon: const Icon(
              Icons.delivery_dining_sharp,
              color: Colors.green,
              size: 30,
            ),
            inactiveColor: Colors.blueGrey,
            enableTooltip: true,

            stepSize: 1,
            // showTicks: true,

            isInversed: true,
            onChanged: (dynamic newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
        )),
      ),
    );
  }
}
