import 'package:flutter/material.dart';
import 'package:flutter_application_1/ultis/app_routes.dart';
import 'package:flutter_application_1/model/cartao_list.dart';
import 'package:flutter_application_1/componentes/cartao_item.dart';
import 'package:flutter_application_1/model/cartao.dart';
import 'package:provider/provider.dart';

class CartaoPage extends StatelessWidget {
  const CartaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade900,
          title: const Text('Meus Cartões'),
          actions: [
            const Icon(
              Icons.credit_card,
              size: 50,
              color: Colors.black,
            ),
            IconButton(
              icon: const Icon(Icons.add_card_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.CARTAO_FORM,
                );
              },
            ),
          ],
        ),
        body: Card(
          child: Container(
              child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: products.itemsCount,
                  itemBuilder: (ctx, i) => Column(
                    children: [
                      ProductItem(products.items[i]),
                      const Divider(),
                    ],
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
