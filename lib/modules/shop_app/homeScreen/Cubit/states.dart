// modules/shop_app/homeScreen/Cubit/states.dart
abstract class ShopLayoutStates {}
/////////////// UserModel
class ShopLayoutInitialState extends ShopLayoutStates {}

class ShopLayoutGetUserLoadingStates extends ShopLayoutStates {}

class ShopLayoutGetUserSuccessStates extends ShopLayoutStates {}

class ShopLayoutGetUserErrorStates extends ShopLayoutStates {
  final String error;
  ShopLayoutGetUserErrorStates(this.error);
}
/////////////// ChangeButtomNavigation
class ShopChangeButtomNavState extends ShopLayoutStates {}

/////////////// HomeData
class ShopLoadingHomeDataStates extends ShopLayoutStates {}

class ShopSuccessHomeDataStates extends ShopLayoutStates {}

class ShopErrorHomeDataStates extends ShopLayoutStates {
  final String error;
  ShopErrorHomeDataStates(this.error);
}

/////////////// Timer
class ShopChangeDeliveryTextState extends ShopLayoutStates {}
/////////////// onBoarding
class ShopChangeOnBoardingState extends ShopLayoutStates {}

