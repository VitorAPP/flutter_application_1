import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/model/cartao_list.dart';
import 'package:flutter_application_1/model/cartao.dart';

class CartaoFormPage extends StatefulWidget {
  const CartaoFormPage({Key? key}) : super(key: key);

  @override
  _CartaoFormPageState createState() => _CartaoFormPageState();
}

class _CartaoFormPageState extends State<CartaoFormPage> {
  final _numeroCartFocus = FocusNode();
  final _cvvFocus = FocusNode();

  final _dataCartFocus = FocusNode();
  final _dataCartController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  @override
  void initState() {
    super.initState();
    _dataCartFocus.addListener(updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final product = arg as Product;
        _formData['id'] = product.id;
        _formData['nome'] = product.nome;
        _formData['numeroCart'] = product.numeroCart;
        _formData['cvv'] = product.cvv;
        _formData['dataCart'] = product.dataCart;

        _dataCartController.text = product.dataCart;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _numeroCartFocus.dispose();
    _cvvFocus.dispose();

    _dataCartFocus.removeListener(updateImage);
    _dataCartFocus.dispose();
  }

  void updateImage() {
    setState(() {});
  }

  bool isValiddataCart(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpg') ||
        url.toLowerCase().endsWith('.jpeg');
    return isValidUrl && endsWithFile;
  }

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    _formKey.currentState?.save();

    Provider.of<ProductList>(
      context,
      listen: false,
    ).saveProduct(_formData);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário do Cartão'),
        backgroundColor: Colors.pink.shade900,
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _formData['nome']?.toString(),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_numeroCartFocus);
                },
                onSaved: (nome) => _formData['nome'] = nome ?? '',
                validator: (_nome) {
                  final nome = _nome ?? '';

                  if (nome.trim().isEmpty) {
                    return 'Nome é obrigatório';
                  }

                  if (nome.trim().length < 8) {
                    return 'Nomes devem ter 8 caracteres';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['numeroCart']?.toString(),
                decoration:
                    const InputDecoration(labelText: 'Número do Cartão'),
                textInputAction: TextInputAction.next,
                focusNode: _numeroCartFocus,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_cvvFocus);
                },
                onSaved: (numeroCart) =>
                    _formData['numeroCart'] = numeroCart ?? '',
                validator: (_numeroCart) {
                  final numeroCartString = _numeroCart ?? '';
                  final numeroCart = double.tryParse(numeroCartString) ?? -1;

                  if (numeroCart <= 0) {
                    return 'Informe um número válido.';
                  }

                  return null;
                },
              ),
              TextFormField(
                initialValue: _formData['cvv']?.toString(),
                decoration: const InputDecoration(labelText: 'CVV'),
                focusNode: _cvvFocus,
                keyboardType: TextInputType.multiline,
                onSaved: (cvv) => _formData['cvv'] = int.parse(cvv ?? ''),
                validator: (_cvv) {
                  final cvv = _cvv ?? '';

                  if (cvv.trim().isEmpty) {
                    return 'CVV é obrigatório.';
                  }

                  if (cvv.trim().length < 3) {
                    return 'CVV precisa no mínimo de 3 dígitos.';
                  }

                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Data do Cartão'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: _dataCartFocus,
                      controller: _dataCartController,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (dataCart) =>
                          _formData['dataCart'] = dataCart ?? '',
                      validator: (_dataCart) {
                        final dataCart = _dataCart ?? '';

                        if (dataCart.trim().isEmpty) {
                          return 'Data é obrigatória';
                        }

                        if (!RegExp(r'^\d{2}/\d{2}$')
                            .hasMatch(dataCart.trim())) {
                          return 'Data inválida (formato: dd/mm)';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
