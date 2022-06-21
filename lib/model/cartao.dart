import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String nome;
  final double numeroCart;
  final double cvv;
  final String dataCart;
  bool isFavorite;

  Product({
    required this.id,
    required this.nome,
    required this.numeroCart,
    required this.cvv,
    required this.dataCart,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
