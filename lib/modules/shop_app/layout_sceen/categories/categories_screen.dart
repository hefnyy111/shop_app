// modules/shop_app/layout_sceen/categories/categories_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/model/Home_model/home_model.dart';
import 'package:shop_appp/shared/componentes/components.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
    
     BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopLayoutCubit.get(context);
        var cubit_productItems = cubit.productItems_modell;
        return ListView.separated(
          itemBuilder: (context, index) => buildCategories(cubit_productItems!.products[index]), 
          separatorBuilder: (context, index) => SizedBox(height: 5.0,),
          itemCount: cubit_productItems?.products.length ?? 0,
          );
      }, 
      );
  }

  Widget buildCategories(ProductModel ItemModel) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
           Container(
            
            color: Color(0xFF2E2E2E),
            height: 130,
            width: 130,
             child: Image(image: NetworkImage(ItemModel.image ?? 'https://b.top4top.io/p_3497i27kh2.png',),
             width: 80.0,
             height: 80.0,
             fit: BoxFit.fill,
             ),
           ),
      
           SizedBox(width: 20.0,),
           Text(ItemModel.category ?? 'Title', style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
           ),
           ),
           Spacer(),
           Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.0,)
        ],
      ),
    );
}