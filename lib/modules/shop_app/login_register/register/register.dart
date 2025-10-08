// modules/shop_app/login_register/register/register.dart

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/shared/network/end_points.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/home_layout.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_screen.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/cubit/states.dart';
import 'package:shop_appp/modules/shop_app/login_register/verify_email/verify_phone.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ////
  var Fullname = TextEditingController();
  var birthday = TextEditingController();
  var emailaddress = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var password_confirmed = TextEditingController();
  var forKey = GlobalKey<FormState>();
 
  ////

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),

      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        //************************************** */ Listener

        listener: (context, state) {},
        //************************************** */ Builder
        builder: (context, state) {
          var Cubit = ShopRegisterCubit.get(context);
            final passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).{6,}$');
            final passwordText = password.text;
          return Scaffold(
///////////////// APPBAR       
            appBar: AppBar(
              backgroundColor: Colors.black,
        //************************************** */ Leading
              leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context, login_screen());
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.pinkAccent),
              ),
            ),
///////////////// BODY
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
        //************************************** */ Create an accoung
                            Text(
                              'Create a new account!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                textBaseline: TextBaseline.ideographic,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
        //************************************** */ SizeBox
                            SizedBox(height: 20.0),
        //************************************** */ TextForm
                            defaultTextForm(
                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your name!';
                                }
                              },
                              text: 'Full Name',

                              control: Fullname,
                            ),
        //************************************** */ SizeBox
                            SizedBox(height: 13.0),
        //************************************** */ TextForm
                            defaultTextForm(
                              text: 'Birthday',
                              control: birthday,

                              iconSuffix: Icons.date_range_outlined,
                              readOnly: true,
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2000),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),

                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.dark(
                                          background: Colors.black,
                                          primary:
                                              Colors
                                                  .pink, // ⬅ لون الزر واليوم المختار
                                          onPrimary:
                                              Colors
                                                  .black, // ⬅ لون النص على اليوم المختار
                                          onSurface:
                                              Colors
                                                  .white, // ⬅ لون الأيام العادية
                                        ),

                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                Colors
                                                    .pink, // ⬅ لون زر CANCEL و OK
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (picked != null) {
                                  birthday.text =
                                      "${picked.day}/${picked.month}/${picked.year}";
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        ' Please select your birthday!',
                                        style: TextStyle(color: Colors.black),
                                      ),

                                      duration: Duration(seconds: 3),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        218,
                                        215,
                                        215,
                                      ),
                                    ),
                                  );
                                }
                              },

                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please select your birthday!';
                                }
                              },
                            ),
          //************************************** */ SizeBox
                            SizedBox(height: 13.0),
          //************************************** */ TextForm
                            defaultTextForm(
                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email address!';
                                }
                              },
                              text: 'Email Address',
                              keyboard: TextInputType.emailAddress,

                              control: emailaddress,
                            ),
          //************************************** */ SizeBox
                            SizedBox(height: 13.0),
          //************************************** */ TextForm                 
                            defaultTextForm(
                              keyboard: TextInputType.number,
                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your phone number !';
                                } else if(phone.text.length != 10) {
                                   ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              ' The phone number you entered is incorrect.',
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
                                                const Color.fromARGB( 255, 218, 215, 215,
                                                ),
                                          ),
                                        );
                                }
                              },
                              text: 'Phone Number',
                              control: phone,
                              iconPrefix: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                        Text('🇪🇬 +20', style: TextStyle(color: Colors.white ,fontSize: 16)),
                                        SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                              ),
                      
                            ),

                            SizedBox(height: 13.0),
          //************************************** */ TextForm
                            defaultTextForm(
                              obscureText: Cubit.isPassword,
                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your password!';
                                } 
                              },
                              text: 'Password',

                              iconSuffix: Cubit.suffix,
                              Functionn: () {
                                Cubit.ChangePasswordEyee();
                              },
                              control: password,
                            ),
          //************************************** */ SizeBox
                            SizedBox(height: 13.0),
          //************************************** */ TextForm
                            defaultTextForm(
                              obscureText: Cubit.isPassword,
                              validatee: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your confirmed password!';
                                } 
                              },
                              text: 'Confirm Password',

                              iconSuffix: Cubit.suffix,
                              Functionn: () {
                                Cubit.ChangePasswordEyee();
                              },
                              control: password_confirmed,
                            ),
          //************************************** */ TextForm               
                            SizedBox(height: 30.0),
          //************************************** */ ConditionalBuilder
                            ConditionalBuilder(
                              condition: state is! ShopRegisterLoadingState,
                              builder:
                                  (context) => defaultButton(
                                    texxt: 'REGISTER',
                                    Functionn: () {
                              
                                      if (!forKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              ' Please complete all fields.',
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
                                                const Color.fromARGB(   255,  218, 215, 215,
                                                ),
                                          ),
                                        );
                                      } else if (password.text != password_confirmed.text) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              ' Password does not match.',
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
                                                const Color.fromARGB( 255, 218, 215, 215,
                                                ),
                                          ),
                                        );
                                      } else if (!passwordRegex.hasMatch(passwordText)) {
                                   ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Password must be at least 8 characters and include:\n- Uppercase letter\n- Lowercase letter\n- Number\n- Special character.',
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
                                                const Color.fromARGB( 255, 218, 215, 215,
                                                ),
                                          ),
                                        );
                                
                                      
                                      } else  {
                                        navigatorTo(
                                          context,
                                          VerifyEmail(
                                            phone: phone.text,
                                            Fullname: Fullname.text,
                                            birthday: birthday.text,
                                            emailaddress: emailaddress.text,
                                            password: password.text,
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
                            SizedBox(height: 60.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          //************************************** */ SizeBox
                SizedBox(height: 100.0),
          //************************************** */ Container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(0),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
               //************************************** */ Already have an account?
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
               //************************************** */ button        
                      TextButton(
                        onPressed: () {
                          navigatorTo(context, login_screen());
                        },
                        child: Text(
                          'Login',
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
              ],
            ),

            backgroundColor: Colors.black,
          );
        },
      ),
    );
  }
}
