import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/ultis/app_routes.dart';
import 'package:flutter_application_1/model/cartao_list.dart';
import 'package:flutter_application_1/model/cartao.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
            Icons.credit_card,
            color: Colors.black,
          ),
          title:Container(
          child:Row(children: [
Text("Numero do cartão  "),
Text(" Data de Vencimento"), 
          ],)
      ),
      subtitle:Container(
          child:Row(children: [
Text(product.numeroCart.toString()),
Text("             "),
Text(product.dataCart), 
          ],)
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
               Navigator.of(context).pushNamed(
                  AppRoutes.CARTAO_FORM,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Cartão'),
                    content: Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () => Navigator.of(ctx).pop(false),
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(ctx).pop(true),
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value ?? false) {
                    Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).removeProduct(product);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
