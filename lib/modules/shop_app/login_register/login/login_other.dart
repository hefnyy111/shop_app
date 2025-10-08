// shop_app/login/cubit/login_other.dart
import 'package:flutter/material.dart';

Widget login_other(ImageProvider image1) {
  return Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: image1,
        fit: BoxFit.cover, // أو BoxFit.fill
      ),
      borderRadius: BorderRadius.circular(0),
      border: Border.all(color: Colors.grey),
    ),
  );
}

