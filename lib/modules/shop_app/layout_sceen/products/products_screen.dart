// modules/shop_app/layout_sceen/products/products_screen.dart
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/model/Home_model/home_model.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  
    //************************************** */ InitState
  void initState() {
      final cubit = ShopLayoutCubit.get(context);
    super.initState();
    Future.microtask(() {
      if (cubit.currentIndex == 0) {
        cubit.getNewsData();
        cubit.getNewsDataGrid();
        cubit.getItems();
        cubit.getRecommended();
       
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
          //************************************** */ Get cubit
        var cubit_product = ShopLayoutCubit.get(context).product_modell;
        var cubit_productgrid = ShopLayoutCubit.get(context).productGrid_modell;
        var cubit_productItems = ShopLayoutCubit.get(context).productItems_modell;
        var cubit_recommend = ShopLayoutCubit.get(context).Product_recommended;
         
          //************************************** */ ConditionalBuilder
        return ConditionalBuilder(
          condition: cubit_product != null && cubit_productgrid != null && cubit_productItems != null && cubit_recommend != null,
          builder:(context) => productsBuilder(cubit_product!,cubit_productgrid!,cubit_productItems!, cubit_recommend!,),
          fallback:(context) => Center(  child: CircularProgressIndicator(color: Colors.pinkAccent),),
        );
      },
    );
  }

  Widget productsBuilder( ProductListModel model, ProductListModel gridModel,  ProductListModel ItemModel, ProductListModel RecomendedModel
  ) => SingleChildScrollView(
    child: Column(
      children: [
        //************************************** */ LOCATION
        Container(
          height: 40.0,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.pink[400]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                      size: 22.0,
                    ),
                    SizedBox(width: 10.0),
                    Flexible(
                      child: Text(
                        'El-Mahalla - ElRoundabout - Hamdi Shoman Extension',
                        style: TextStyle(color: Colors.white, fontSize: 12.5),
                      ),
                    ),
                    SizedBox(width: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
        //************************************** */ SIZEBOX
        SizedBox(height: 20.0),
        //************************************** */ ITEMS
        Container(
          height: 100.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => buildProductItem(ItemModel.products[index]),
            separatorBuilder: (context, index) => SizedBox(width: 20.0),
            itemCount: 18,
          ),
        ),
        //************************************** */ CarouselSlider
        CarouselSlider(
          items:
              model.products
                  .map(
                    (product) => Image(
                      image: NetworkImage(product.image!),
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  )
                  .toList(),

          options: CarouselOptions(
            height: 200.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        //************************************** */ SIZEBOX
        SizedBox(height: 10.0),
        //************************************** */ ADVERS LINE
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 60.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://h.top4top.io/p_3492s0s2t1.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        //************************************** */ SIZEBOX
        SizedBox(height: 10.0),
        //************************************** */ GRIDVIEW
        Container(
          
          color: Color(0xFF2E2E2E),
          padding: const EdgeInsets.all(7.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('DISCOUNTS', style: TextStyle(color: Colors.white , fontSize: 15.0, fontWeight: FontWeight.w900),),
                ],
              ),
              SizedBox(height: 15.0,),
              GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 1 / 0.99,
              children: List.generate(
                6,
                (index) => buildGirdProduct(gridModel.products[index]),
              ),
            ),
            

            ],
            
          ),
        ),
        //************************************** */ SIZEBOX
        SizedBox(height: 10.0,),
        //************************************** */ ITEMS RECOMENDED
        SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
              SizedBox(height: 10.0,),
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RECOMENED', style: TextStyle(color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.w900),),
                  SizedBox(width: 3.0,),
                  Text('FOR YOU', style: TextStyle(color: const Color.fromARGB(255, 255, 17, 0), fontSize: 22.0, fontWeight: FontWeight.w900),),
                ],
               ),
               SizedBox(height: 10.0,),
               SizedBox( height: 310.0,
                 child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildRecomendedItem(RecomendedModel.products[index], context), 
                  separatorBuilder: (context, index) => SizedBox(width: 20.0,), 
                  itemCount: 6,
                  ),
               ),
              ],
            ),
          ),
        ),
        //************************************** */ SIZE BOX
        SizedBox(height: 10.0,),
        //************************************** */ OFFICAL ITEM
        Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('EXPLORE', style: TextStyle(color: Colors.grey[800], fontSize: 22.0, fontWeight: FontWeight.w900),),
                SizedBox(width:3.0),
                Text('OFFICAL BRAND STORES', style: TextStyle(color: const Color.fromARGB(255, 255, 17, 0), fontSize: 22.0, fontWeight: FontWeight.w900),),

              ],
            ),
            SizedBox(height: 10.0,),
            SizedBox(height: 220,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildOfficialItem(), 
              separatorBuilder: (context, index) => SizedBox(width: 8.0,), 
              itemCount: 15
              ),),
         
          ],
        ),

            
        ),
        SizedBox(height: 15.0,),

      ],
    ),
  );
      






//************************************** */ PRODUCT GRID
Widget buildGirdProduct(ProductModel model) => Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
 
      // ✅ شريط التصنيف (مثل: Fashion deals)
      Container(
         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(     
          color: Colors.pinkAccent , // تقدر تغير اللون حسب نوع التصنيف
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Text(
           'DISCOUNT',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 11.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
 
      // ✅ صورة المنتج
      ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(0)),
        child: Image.network(
          model.image!,
          height: 100.0,
          width: double.infinity,
         fit: BoxFit.contain,
        ),
      ),
 
      // ✅ عنوان المنتج
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Text(
          model.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(height: 5.0,),
      // price
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
        child: Row(
          children: [
            Text(
              model.oldPrice!.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                    decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: 3.0,),
            Text(
              model.price!.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                 fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 3.0,),
             Text(
              'EGP',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
 );
}

//************************************** */ PRODUCT ITEMS
Widget buildProductItem(ProductModel model1) => Container(
  child: Column(
    children: [
      Container(
        decoration: BoxDecoration(shape: BoxShape.rectangle),
        child: Image.network(
          model1.image!,
          fit: BoxFit.cover,
          width: 40.0,
          height: 40.0,
        ),
      ),
      SizedBox(height: 6.0),
      Text(
        model1.category!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 10.0,
        ),
      ),
    ],
  ),
);

//************************************** */ RECOMENDED ITEMS
Widget buildRecomendedItem(ProductModel model1, BuildContext context) => Container(
  width: 150.0,

  decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
        blurRadius: 4,
        offset: Offset(0, 3),
          ),
        ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Stack(
        children: [
          ClipRRect(
          child: Image.network(
            model1.image!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 160.0,
          ),
        ),
         Positioned(
          top: 8.0,
          right: 10.0,
           child: IconButton(
               
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
         ),
        ],
       
      ),    
      SizedBox(height: 13.0),
    
      Text(
          model1.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 15.0,
          ),
        ),      
      SizedBox(height: 5.0),
      Row(
        children: [
          Text(model1.rating!.rate.toString(), style: TextStyle(color: Colors.black, fontSize: 15.0,),),
          SizedBox(width: 2.0,),
          Icon(Icons.star, color: Colors.pinkAccent, size: 15.0,),
          SizedBox(width: 3.5,),
          Text('${model1.rating!.count.toString()}K', style: TextStyle(color: Colors.black, fontSize: 15.0,),),
        ],
      ),
      SizedBox(height: 5.0,),
      Row(
        children: [
          Text('EGP', style: TextStyle(fontSize: 16.0, color: Colors.black87,),),
          SizedBox(width: 3.0),
          Text('${model1.price ?? 'Price'}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16.0),),
        ],
      ),
      SizedBox(height: 4.0),
      Row(
        children: [
          Icon(Icons.local_shipping, color: Colors.blue, size: 14.0,),
          SizedBox(width: 4,),
          SizedBox(height: 20,
          child: AnimatedTextKit(
            repeatForever: true,
            pause: Duration(seconds: 1),
            animatedTexts: [
              RotateAnimatedText('Free Delivery',
              textStyle: TextStyle(color: Colors.black, fontSize: 14.0,),), 
               RotateAnimatedText('Fast Shipping',
              textStyle: TextStyle(color: Colors.black, fontSize: 14.0,),), 
               RotateAnimatedText('Express Delivery',
              textStyle: TextStyle(color: Colors.black, fontSize: 14.0,),), 
               RotateAnimatedText('Delivery Included',
              textStyle: TextStyle(color: Colors.black, fontSize: 14.0,),), 
            ],
            ),),
        ],
      ), 
    ],
  ),
);

//************************************** */ EXPLORE OFFICAL
Widget buildOfficialItem() => Container(
  decoration: BoxDecoration(
    color: Colors.white,

    border: Border.all(color: Colors.grey.shade300),
  ),
  padding: EdgeInsets.all(1.5),
  child: Column(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              'https://cityupload.io/2025/08/evaaa.png',
              width: 58,
              height: 61,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 2),
          Container(
        color: Colors.grey[400],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eva',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Visit the store >',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),  
        ],
      ),
      SizedBox(height: 5.0,),
       Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              'https://cityupload.io/2025/08/evaaa.png',
              width: 58,
              height: 61,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 2),
          Container(
        color: Colors.grey[400],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eva',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Visit the store >',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),  
        ],
      ),
      SizedBox(height: 5.0,),
       Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              'https://cityupload.io/2025/08/evaaa.png',
              width: 58,
              height: 61,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 2),
          Container(
        color: Colors.grey[400],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Eva',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Visit the store >',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),  
        ],
      ),
    ],
  ),
);