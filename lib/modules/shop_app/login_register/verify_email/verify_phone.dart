// modules/shop_app/login_register/verify_email/verify_phone.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/cubit.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/home_layout.dart';
import 'package:shop_appp/modules/shop_app/login_register/login/login_screen.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/register.dart';
import 'package:shop_appp/modules/shop_app/login_register/verify_email/cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/login_register/verify_email/cubit/states.dart';


class VerifyEmail extends StatelessWidget {
  //************************************** */ Variables
  final String phone;
  final String Fullname;
  final String birthday;
  final String emailaddress;
  final String password;
  var forKey2 = GlobalKey<FormState>();
  //************************************** */ Constractor
  VerifyEmail({required this.phone , required this.Fullname, required this.birthday, required this.emailaddress, required this.password });

  @override
  Widget build(BuildContext context) {
    //************************************** */ Variabels
    var forKey = GlobalKey<FormState>();
    var code = TextEditingController();
    //************************************** */ BlocProvider
    //// BlockProvider
    return BlocProvider(
      create: (BuildContext context) => verifyCubit(phone)..phoneAuth(context)..startTimer(context,),
       
      child: BlocConsumer<verifyCubit, verifyState> (
        listener: (context, state) {
          if(state is CodeVerifiedSuccessState) {
          //************************************** */ Get data
            ShopRegisterCubit.get(context).userReigster(
    name: Fullname,
    birthday: birthday,
    emailaddress: emailaddress,
    password: password,
    phone: phone,
  );

          //************************************** */ Message info
             defaultMessageInfo(
              context: context,
              title: 'Succesfully',
              body: 'Done created you account! \n Please back to login your account',
              ButtonName: 'OK',
              Iconn: Icons.check,
              Functionnn: () {
                navigatorTo(context, login_screen());
              },
            );
          //************************************** */ 

          }
        },
        builder: (context, state) {
          //************************************** */ Get cubit
          var model = ProfileCubit.get(context).model;
          var cubit = verifyCubit.get(context);

          final verify = verifyCubit.get(context); 
          final registerCubit = ShopRegisterCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  navigatorTo(context, Register());
                },
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.pinkAccent),
              ),
            ),
            body: Container(
              color: Colors.black,
              child: Column(
                children: [
         //************************************** */ Expanded
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: forKey,
                        child: Column(
                          children: [
        //************************************** */ Form                    
                            Form(
                              key: forKey2,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
        //************************************** */ SizeBox
                                      SizedBox(height: 20.0),
        //************************************** */ Container
                                      Container(
                                        width: 100.0,
                                        height: 100.0,
                                        child: Image(
                                          image: NetworkImage(
                                            'https://e.top4top.io/p_34795qmx81.png',
                                          ),
                                        ),
                                      ),
        //************************************** */ SizeBox
                                      SizedBox(height: 50.0),
        //************************************** */ Text
                                      Text(
                                        'Check your phone number',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          textBaseline: TextBaseline.ideographic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22.0,
                                          color: Colors.white,
                                        ),
                                      ),
        //************************************** */ SizeBox
                                      SizedBox(height: 10.0),
        //************************************** */ Text
                                      Text(
                                        'Enter 6-character code we sent to',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          textBaseline: TextBaseline.ideographic,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.5,
                                          color: const Color.fromARGB(255, 218, 218, 218),
                                        ),
                                      ),
        //************************************** */ SizeBox
                                      SizedBox(height: 5.0),
        //************************************** */ Row Resend code
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '$phone',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              textBaseline: TextBaseline.ideographic,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            'to log in.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              textBaseline: TextBaseline.ideographic,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0,
                                              color: const Color.fromARGB( 255, 218, 218, 218,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                       //************************************** */ SizeBox 
                                      SizedBox(height: 20.0),
                                      //************************************** */ TextForm
                                      defaultTextForm(
                                        text: '6-character code',
                                        control: code,
                                        validatee: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please emter your code';
                                          } else if (value.length != 6) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Please enter a 6-digit code.',
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
                                          // } else if (value.length.toString() != '123456') {
                                          //        ScaffoldMessenger.of(context).showSnackBar(
                                          //       SnackBar(
                                          //         content: Text(
                                          //           'Please enter a 6-digit code.',
                                          //           style: TextStyle(color: Colors.black),
                                          //         ),
                                          //         duration: Duration(seconds: 3),
                                          //         behavior: SnackBarBehavior.floating,
                                          //         shape: RoundedRectangleBorder(
                                          //           borderRadius: BorderRadius.circular(10),
                                          //         ),
                                          //         backgroundColor: Colors.white,
                                          //       ),
                                          //     );
                                          }
                                
                                        },
                                        
                                      ),
                                      //************************************** */ SizeBox
                                      SizedBox(height: 15.0),
                                      //************************************** */ ConditionalBuilder
                                      ConditionalBuilder(
                                        condition: state is! CodeVerifiedLoadingState,
                                        builder: (context) => 
                                          defaultButton(
                                          Functionn: () async {
                                            if (!forKey.currentState!.validate()) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'The code your entered is invalid, Please try again.',
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
                                          
                                            } else {
                                              cubit.sentCode(code.text, context);
                                              
                                            }
                                          },
                                          texxt: 'Log in',
                                        
                                          ),
                                        fallback: (context) => Center(child: CircularProgressIndicator(),),
                                      ),
                                      //************************************** */ SizeBox
                                      SizedBox(height: 15.0),
                                      //************************************** */ Don't recive
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if (state is verifyTimerTickState)
                                            Row(
                                              children: [
                                                // Text
                                                Text(
                                                  "Don't receive the code?",
                                                  style: TextStyle(
                                                    color: const Color.fromARGB(255,218,218,218,),
                                                    fontSize: 16.5,
                                                  ),
                                                ),
                                                // text
                                                Text(
                                                  ' Resend in ${state.secondsLeft} sec',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.5,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            )
                                          else if (state is verifyTimerFinishedState || state is verifyLoadintState)
                                            ConditionalBuilder(
                                              condition: state is! verifyLoadintState,
                                              builder:
                                                  (context) => TextButton(
                                                    onPressed: () {
                                                      cubit.resendCode(context);
                                                    },
                                                    child: Text(
                                                      'Resend Code',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                        
                                              fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.pinkAccent,),)
                                              
                                            ),
                                        ],
                                      ),
                                        
                                    ],
                                  ),
                                ),
                              ),
                            ),
                                        
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                  //************************************** */ SizeBox
                        SizedBox(height: 100.0),
                  //************************************** */ Container
                  Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.grey[900]),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      navigateAndFinish(context, login_screen());
                                    },
                                    child: Text(
                                      'Log in to different account ?',
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
            ),
          );
        },
      ),
    );
  }
}
