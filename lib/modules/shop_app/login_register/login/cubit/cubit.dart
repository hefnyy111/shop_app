// modules/shop_app/login_register/login/cubit/cubit.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_appp/modules/shop_app/login_register/login/cubit/states.dart';

class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  
//************************************** */ UserLogin
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email ,  
      password: password
      ).then((value) {
       
           print(value.user?.email);
           print(value.user?.updatePassword(password));
           print(value.user?.uid);

 emit(ShopLoginSuccessState(value.user!.uid));
      }).catchError((error) {
          emit(ShopLoginErrorState(error: error.toString()));
      }); 
  }

  //************************************** */ ChangePassword
  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPassword = true;
  
  void ChangePasswordEyee() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(ShopChangePasswordState());
  }

}