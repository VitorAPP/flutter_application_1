import 'package:flutter/material.dart';

class Novo extends StatelessWidget {
  const Novo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo'),
      ),
      body: const Center(
        child: Text(
          'Novo',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
