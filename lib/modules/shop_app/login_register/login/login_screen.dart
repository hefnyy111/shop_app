// modules/shop_app/login_register/login/login_screen.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/shared/network/end_points.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/cubit/states.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_other.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_password.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/register.dart';
import 'package:shop_appp/modules/shop_app/on_boarding/on_boarding_screend.dart';

class login_screen extends StatelessWidget {
  var emailaddress = TextEditingController();

  var forKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext content) => ShopLoginCubit(),

      child: BlocConsumer<ShopLoginCubit, ShopLoginState>(
        //************************************** */ Listener
        listener: (context, state) {},

        //************************************** */ Builder
        builder: (context, state) {
          var Cubitt = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              //************************************** */ Leading
              leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context, OnBoardingScreend());
                },
                icon: Icon(Icons.close, color: Colors.pinkAccent),
              ),
            ),
            //************************************** */ Body
            body: Column(
              children: [
                //************************************** */ Expanded
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: forKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //************************************** */ SizeBox
                            SizedBox(height: 20.0),
                            //************************************** */ Image
                            Image(
                              image: NetworkImage(
                                'https://l.top4top.io/p_3472fl4kz1.png',
                              ),
                            ),
                            //************************************** */ SizeBox
                            SizedBox(height: 10.0),
                            //************************************** */ Text
                            Text(
                              'Log in to your beauty world',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                textBaseline: TextBaseline.ideographic,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                            //************************************** */ SizeBox
                            SizedBox(height: 20.0),
                            //************************************** */ Email
                            defaultTextForm(
                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email address!';
                                }
                              },
                              keyboard: TextInputType.emailAddress,
                              text: 'Email address',

                              control: emailaddress,
                            ),
                            //************************************** */ SizeBox
                            SizedBox(height: 15.0),
                            //************************************** */ ConditionalBuilder
                            ConditionalBuilder(
                              condition: state is! ShopLoginLoadingState,
                              builder:
                                  (context) => defaultButton(
                                    texxt: 'Continue to log in',
                                    iconn: Icons.arrow_forward,
                                    Functionn: () {
                                      if (forKey.currentState!.validate()) {
                                        navigatorTo(
                                          context,
                                          LoginPassword(
                                            email: emailaddress.text,
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please complete this fields.',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),

                                            duration: Duration(seconds: 3),
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            backgroundColor:
                                                const Color.fromARGB(
                                                  255,
                                                  218,
                                                  215,
                                                  215,
                                                ),
                                          ),
                                        );
                                      } 
                                    },
                                  ),
                              fallback:
                                  (context) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                            ),
                            //************************************** */ SizeBox
                            SizedBox(height: 15.0),
                            //************************************** */ Other Login now
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    'Other login now',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 1.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            //************************************** */ SizeBox
                            const SizedBox(height: 20),
                            //************************************** */ ButtonImages
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    login_other(
                                      NetworkImage(
                                        'https://a.top4top.io/p_3472si9ji2.png',
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    login_other(
                                      NetworkImage(
                                        'https://c.top4top.io/p_34729e5qf4.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //************************************** */ SizeBox
                SizedBox(height: 30.0),
                //************************************** */ Don't have an account
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[900]),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //************************************** */ Text Don't
                        Text(
                          'Don\'t hava a new account',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //************************************** */ Register
                        TextButton(
                          onPressed: () {
                            navigatorTo(context, Register());
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.black,
          );
        },
      ),
    );
  }
}
