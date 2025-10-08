// shared/network/end_points.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_screen.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/shared/network/local/cashe_helper.dart';


const LOGIN = 'login';

String uId = '';

void Logout (context) {
  CacheHelper.removeData(key: 'uId',).then((value) {
    if(value) {
      navigateAndFinish(context, login_screen());
    }
  });
}