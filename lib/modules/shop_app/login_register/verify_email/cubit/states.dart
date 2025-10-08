// shop_app/login_register/verify_email/cubit/states.dart
abstract class verifyState {}

class verifyInitialState extends verifyState {}

class verifyTimerTickState  extends verifyState {
  final int secondsLeft;
  verifyTimerTickState(this.secondsLeft);
}


class verifyLoadintState extends verifyState {}

class verifyTimerFinishedState  extends verifyState {} 



class CodeVerifiedLoadingState extends verifyState {}

class CodeVerifiedSuccessState extends verifyState {}

class CodeVerificationErrorState extends verifyState {
  final String error;
  CodeVerificationErrorState({required this.error});
}


class ResendCodeSuccessState extends verifyState {}

class ResendCodeErrorState extends verifyState {
  ResendCodeErrorState(data);
}