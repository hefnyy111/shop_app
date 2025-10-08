// modules/shop_app/layout_sceen/profile/profile/Cubit/cubit.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/model/user_model/user_models.dart';
import 'package:shop_appp/shared/network/local/cashe_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

 static  ProfileCubit get(context) => BlocProvider.of(context);


ShopUserModel? model;
  //************************************** */ GET USER DATA

  void getUserData() {
    emit(ProfileLoadingState());
    final currentUserId = CacheHelper.getData(key: 'uId');

  if (currentUserId == null) {
    emit(ProfileErrorstate('No logged in user'));
    return;
  } 
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .get()
        .then((value) {
        model = ShopUserModel.fromJson(value.data()!);
          print('datttttttttttt');
          print(value.data());
          print(model!.emailaddress);
          emit(ProfileSuccessState());
        })
        .catchError((error) {
          print(error.toString());
          emit(ProfileErrorstate(error.toString()));
        });
  }
  
}