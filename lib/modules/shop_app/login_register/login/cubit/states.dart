// shop_app/login/login/cubit/states.dart
abstract class ShopLoginState {}

class ShopLoginInitialState extends ShopLoginState {}

class ShopLoginLoadingState extends ShopLoginState {}

class ShopLoginSuccessState extends ShopLoginState {
  final String uId;
  ShopLoginSuccessState(this.uId); 
}

class ShopLoginErrorState extends ShopLoginState {
  final String error;

  ShopLoginErrorState({required this.error});
}

class ShopChangePasswordState extends ShopLoginState {}