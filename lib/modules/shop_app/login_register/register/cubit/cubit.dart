// modules/shop_app/login_register/register/cubit/cubit.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/model/user_model/user_models.dart';
import 'package:shop_appp/modules/shop_app/login_register/register/cubit/states.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  
  //************************************** */ UserRegister
  void userReigster({
    required String name,
    required String birthday,
    required String emailaddress,
    required String password,
    required String phone,
  }) {
    void userCreate({
      required String name,
      required String birthday,
      required String emailaddress,
      required String password,
      required String phone,
      required String uId,
    }) {
      ShopUserModel model = ShopUserModel(
        name: name,
        birthday: birthday,
        emailaddress: emailaddress,
        password: password,
        phone: phone,
        uId: uId,
        photo: 'https://a.top4top.io/p_351043yxl1.jpg'
      );
    }

    emit(ShopRegisterLoadingState());
    
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailaddress, password: password).then((value) async {

            // إنشاء نموذج المستخدم مع الكود
            ShopUserModel model = ShopUserModel(
              name: name,
              birthday: birthday,
              emailaddress: emailaddress,
              password: password,
              phone: phone,
              photo: 'https://a.top4top.io/p_351043yxl1.jpg',
              uId: value.user!.uid,
            );

            // حفظ المستخدم في Firestore
            FirebaseFirestore.instance
                .collection('users')
                .doc(value.user!.uid)
                .set(model.toMap())
                .then((_) {
                  emit(ShopCreateuserSuccessState());
                })
                .catchError((error) {
                  emit(ShopCreateuserErrorState(error: error.toString()));
                })
        .catchError((error) {
          emit(ShopRegisterErrorState(error: error.toString()));
        });
  

        });

  }

  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPassword = true;

  //************************************** */ Change user
  void ChangePasswordEyee() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye_outlined : Icons.visibility_off;
    emit(ShopRegisterChangePasswordState());
  }
  }