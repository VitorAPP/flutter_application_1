
import 'package:flutter/material.dart';


class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height / 1.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
               Text(
                "Sem produtos adicionados no momento!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            
            
          ],
        ),
      ),
    );
  }
}
