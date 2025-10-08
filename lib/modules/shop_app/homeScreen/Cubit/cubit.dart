// modules/shop_app/homeScreen/Cubit/cubit.dart
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/categories/categories_screen.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/favorites/favorites_screen.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/products/products_screen.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/profile.dart';
import 'package:shop_appp/modules/shop_app/model/Home_model/home_model.dart';
import 'package:shop_appp/shared/network/end_points.dart';
import 'package:shop_appp/modules/shop_app/model/user_model/user_models.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/states.dart';

class ShopLayoutCubit extends Cubit<ShopLayoutStates> {
  ShopLayoutCubit() : super(ShopLayoutInitialState());

  static ShopLayoutCubit get(context) => BlocProvider.of(context);
  //////////////////////////////////////////////////////////// Shop User Model
  
  //////////////////////////////////////////////////////////// Buttom Nvaigation bar
  //************************************** */ Current index
  int currentIndex = 0;
  
  //************************************** */ buttomScreens
  List<Widget> buttomScreen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    PrfileScreen(),
  ];
  
  //************************************** */ Change index
  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeButtomNavState());
  }



// void getNewsData() async {
//   print('getNewsData called');
//   DioHelper.getDate(url: 'products').then((value) {
//      product_modell = Product_Modell.fromJson(value.data);
   
//     print(product_modell!.products[0].title);
//     print('doneeeee');
//     emit(ShopSuccessHomeDataStates());
//   }).catchError((error) {
//     print('ERROR => ${error.toString()}');
//     emit(ShopErrorHomeDataStates(error.toString())); 
//   });


// }
 
 ProductListModel? product_modell;
 ProductListModel? productGrid_modell;
 ProductListModel? productItems_modell;
 ProductListModel? Product_recommended;
//************************************** */ getNew Date
Future<void> getNewsData() async {
    final String response = await rootBundle.loadString('assets/data/CuroselProducts/CarouselSlider.json');
  final data = json.decode(response) as List<dynamic>;
  product_modell = ProductListModel.fromJson(data);
  print('Data 1 has been sended');
  emit(ShopSuccessHomeDataStates());
}

//************************************** */ getNew Grid
Future<void> getNewsDataGrid() async {
  final String response = await rootBundle.loadString('assets/data/GridView/gridproducts.json');
  final data = json.decode(response) as List<dynamic>;
  productGrid_modell = ProductListModel.fromJson(data);
  
  print(productGrid_modell!.products[0].title);
    print('Data 2 has been sended');
    emit(ShopSuccessHomeDataStates());
}
//************************************** */ getNew Item
Future<void> getItems() async {
  final String response = await rootBundle.loadString('assets/data/ItemsProducts/items.json');
  final data = json.decode(response) as List<dynamic>;
  productItems_modell = ProductListModel.fromJson(data);
  
  print(productItems_modell!.products[0].category);
    print('Data 3 has been sended');
    emit(ShopSuccessHomeDataStates());
}
//************************************** */ getNew Recommended
Future<void> getRecommended() async {
  final String response = await rootBundle.loadString('assets/data/RecomProduct/recomended.json');
  final data = json.decode(response) as List<dynamic>;
  Product_recommended = ProductListModel.fromJson(data);
  
  print(Product_recommended!.products[0].category);
    print('Data 4 has been sended');
    emit(ShopSuccessHomeDataStates());
}

}
///////////////////////////////////////
// GET USER 
