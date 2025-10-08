// modules/shop_app/homeScreen/home_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/search/search_screen.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_screen.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/register.dart';
import 'package:shop_appp/shared/network/remote/dio_helper.dart';

class HomeLayout extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool showEmailVerification = true;
    return BlocProvider(
      create: (context) => ShopLayoutCubit(),
      child: BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var Cubitt = ShopLayoutCubit.get(context);
          /////////////////////// SCAFOLD
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: Cubitt.currentIndex == 0 ?
             AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              //************************************** */ Search
              title: Container(
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),

                        child: TextField(
                          controller: searchController,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black54,
                              size: 20.0,
                            ),
                            hintText: 'Search for cosmetics',
                            hintStyle: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      )
                     
            ) : null ,
            /////////////////////// BODY
            /// ✅ خليه فاضي مؤقتًا
            body: Cubitt.buttomScreen[Cubitt.currentIndex],

            //************************************** */ BottomNavigationBar
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.black,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.pinkAccent,
              unselectedItemColor: Colors.grey[400],
              selectedFontSize: 14,
              unselectedFontSize: 12,
              showUnselectedLabels: false,
              showSelectedLabels: true,
              iconSize: 28,
              currentIndex: Cubitt.currentIndex,
              onTap: (index) => Cubitt.changeIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        Cubitt.currentIndex == 0
                            ? Icon(Icons.home, key: ValueKey('home_filled'))
                            : Icon(
                              Icons.home_outlined,
                              key: ValueKey('home_outlined'),
                            ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child:
                        Cubitt.currentIndex == 1
                            ? Icon(Icons.apps, key: ValueKey('apps_filled'))
                            : Icon(
                              Icons.dashboard_outlined,
                              key: ValueKey('apps_outlined'),
                            ),
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child:
                        Cubitt.currentIndex == 2
                            ? Icon(Icons.favorite, key: ValueKey('fav_filled'))
                            : Icon(
                              Icons.favorite_border,
                              key: ValueKey('fav_outlined'),
                            ),
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child:
                        Cubitt.currentIndex == 3
                            ? Icon(
                              Icons.settings,
                              key: ValueKey('settings_filled'),
                            )
                            : Icon(
                              Icons.settings_outlined,
                              key: ValueKey('settings_outlined'),
                            ),
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
