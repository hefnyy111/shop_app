// shop_app/login/register/cubit/states.dart
abstract class ShopRegisterState {}

class ShopRegisterInitialState extends ShopRegisterState {}

class ShopRegisterLoadingState extends ShopRegisterState {}

class ShopRegisterSuccessState extends ShopRegisterState {}

class ShopRegisterErrorState extends ShopRegisterState {
  final String error;

  ShopRegisterErrorState({required this.error});
}

class ShopRegisterChangePasswordState extends ShopRegisterState {}

class ShopCreateuserSuccessState extends ShopRegisterState {}

class ShopCreateuserErrorState extends ShopRegisterState {
  final String error;

  ShopCreateuserErrorState({required this.error});
}
