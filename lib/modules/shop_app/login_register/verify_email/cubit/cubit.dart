// modules/shop_app/login_register/verify_email/cubit/cubit.dart

import 'dart:async'; // ✅ السطر المهم
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/shared/componentes/components.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/home_layout.dart';

import 'states.dart';

class verifyCubit extends Cubit<verifyState> {
  final String number;
  verifyCubit(this.number) : super(verifyInitialState());

  static verifyCubit get(context) => BlocProvider.of(context);
  String? verifyId;
  FirebaseAuth auth = FirebaseAuth.instance;

  //************************************** */ Timer 30 S
  Timer? timer;
  int seconds = 30;

  void startTimer(BuildContext context) {
    seconds = 30;

    emit(verifyTimerTickState(seconds));
    phoneAuth(context);

    timer?.cancel(); // ⛔ لإلغاء أي تايمر سابق
    timer = Timer.periodic(Duration(seconds: 1), (timerr) {
      seconds--;
      if (seconds > 0) {
        emit(verifyTimerTickState(seconds));
      } else {
        timer?.cancel();
        emit(verifyTimerFinishedState());
      }
    });
  }

  //************************************** */ Resend code
  void resendCode(BuildContext context) async {
    emit(verifyLoadintState());

    print('done send your code');
    Future.delayed(Duration(seconds: 2), () {
      phoneAuth(context);
      startTimer(context); // تبدأ العداد من جديد
    });
    // ممكن تبعت كود التحقق هنا
  }

  //************************************** */ cancel
  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }

  //************************************** */ Firebase Phone auth
  void phoneAuth(BuildContext context) async {
    emit(CodeVerifiedLoadingState());
    // String cleanedNumber = rawNumber.trim();
    // if(cleanedNumber.startsWith('0')) {
    //    cleanedNumber = cleanedNumber.substring(1);
    // }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20$number',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        emit(CodeVerificationErrorState(error: e.toString()));
      },
      codeSent: (String verificationId, int? resendToken) async {
        verifyId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> sentCode(String smsCode, BuildContext context) async {
    emit(CodeVerifiedLoadingState());
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId!,
        smsCode: smsCode,
      );

      await auth.signInWithCredential(credential);
      emit(CodeVerifiedSuccessState());
    } catch (e) {
      emit(CodeVerificationErrorState(error: e.toString()));
    }
  }
}
