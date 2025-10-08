// modules/shop_app/login_register/login/login_password.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/shared/network/local/cashe_helper.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/home_layout.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/cubit/states.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_screen.dart';

class LoginPassword extends StatelessWidget {
  final String email;
  LoginPassword({required this.email});

  @override
  Widget build(BuildContext context) {
    var password = TextEditingController();
    var forKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        //************************************** */ Listener
        listener: (context, state) {
          //
          if (state is ShopLoginSuccessState) {
            navigateAndFinish(context, HomeLayout());
          }
          //
          if (state is ShopLoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(' Data entry error!',
                style: TextStyle(
                  color: Colors.black,
                ),),
                duration: Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.white,
              ),
            );
          }
          //
          if(state is ShopLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(context, HomeLayout());
            });
          }
        },
        //************************************** */ Builder
        builder: (context, state) {
          var cubit = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  navigatorTo(context, login_screen());
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.pinkAccent),
              ),
            ),
            backgroundColor: Colors.black,
            body: Column(
              children: [
        //************************************** */ Expanded
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: forKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
        //************************************** */ SizeBox
                          SizedBox(height: 20.0),
        //************************************** */ Image
                          Image.network(
                            'https://l.top4top.io/p_3472fl4kz1.png',
                          ),
        //************************************** */ SizeBox
                          SizedBox(height: 10.0),
        //************************************** */ Text
                          Text(
                            'Log in to your beauty world',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
        //************************************** */ SizeBox
                          SizedBox(height: 20.0),
        //************************************** */ Button
                          defaultTextForm(
                            validatee: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            text: 'Password',

                            control: password,
                          ),
        //************************************** */ SizeBox
                          SizedBox(height: 15.0),
        //************************************** */ ConitionalBuilder 
                          ConditionalBuilder(
                            condition: state is! ShopLoginLoadingState,
                            builder: (context) => defaultButton(
                              texxt: 'LOGIN',
                              Functionn: () {
                                if (forKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: email,
                                    password: password.text,
                                  );
         
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        ' Please complete all fields',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      duration: Duration(seconds: 3),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  );
                                }
                              },
                            ),
                            fallback: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
           //************************************** */ SizeBox
                          SizedBox(height: 15.0),
                        ],
                      ),
                    ),
                  ),
                ),
           //************************************** */ SizeBox
                SizedBox(height: 30.0),
              ],
            ),
          );
        },
      ),
    );
  }
}