// modules/shop_app/layout_sceen/search/search_screen.dart
import 'package:flutter/material.dart';
import 'package:shop_appp/shared/componentes/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
                backgroundColor: Colors.black,
   
      ),
        body: Center(child: Text_layout(title: 'Search')),
    );
  }
}