// modules/shop_app/layout_sceen/profile/Cubit/states.dart
abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileErrorstate extends ProfileStates {
  final String error;
  ProfileErrorstate(this.error);
}
