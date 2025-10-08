// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/products/products_screen.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/cubit.dart';

import 'package:shop_appp/shared/network/local/cashe_helper.dart';
import 'package:shop_appp/shared/network/remote/dio_helper.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/home_layout.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/login_register/verify_email/cubit/cubit.dart';

import 'package:shop_appp/modules/shop_app/on_boarding/on_boarding_screend.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /********** */// * Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /********** */
  
  /********** */// * DioHelper & Cashe
  DioHelper.init();
  await CacheHelper.init();
  /********** */

  /********** *///* Run App
  Widget startWidget;
  var uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
      // await CacheHelper.removeData(key: 'uId');
    startWidget = HomeLayout();
  } else {
    startWidget = OnBoardingScreend(); // تأكد من كتابة الاسم صح
  }

  runApp(MyApp(startWidget: startWidget,));
}
  /********** */





class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget, this.phone});
  final String? phone;
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
       providers: [
        BlocProvider(create: (_) => ShopRegisterCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => ShopLayoutCubit()..getNewsData(),
        child: ProductsScreen(),
        ),
        if(phone != null && phone!.isNotEmpty) 
        BlocProvider(create: (_) => verifyCubit(phone!)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: startWidget,
      
        /**********/ // * ColorTheme
        theme: ThemeData(
          primarySwatch: Colors.pink,
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Colors.pinkAccent
          ),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: Colors.pinkAccent),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
            ),
          ),
        ),
        // * ///////// * //////////////////
        //////////////
      ),
    );
  }
}
/***
 * Platform  Firebase App Id
web       1:480078142472:web:8839f9de349076364085bd
android   1:480078142472:android:88fd568e91c35dc74085bd
ios       1:480078142472:ios:946be7b9345b84de4085bd
macos     1:480078142472:ios:946be7b9345b84de4085bd
windows   1:480078142472:web:a71551ec3de62b034085bd
 */