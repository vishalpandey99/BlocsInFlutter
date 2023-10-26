

import 'package:checktest/screens/sign_in/bloc/sign_in_event.dart';
import 'package:checktest/screens/sign_in/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {

  SignInBloc() : super(SignInInitialState()){

    on<SignInTextChangedEvent>((event, emit){
      if(event.emailValue == "" && EmailValidator.validate(event.emailValue) == false){
        emit(SignInErrorState("Please enter a valid address"));
      }
      else if(event.passwordValue.length<8){
        emit(SignInErrorState("Please Enter a Valid Password"));
      }
      else
        {
          emit( SignInvalidState());
        }
    });
    on<SignInSubmittedEvent>((event, emit){
       emit(SignInLoadingstate());
    });
  }
}