part of 'login_validation_bloc.dart';

@immutable
class LoginValidationState {}

class LoginValidationInitial extends LoginValidationState {}

class LoginValidateLoading extends LoginValidationState {}

class LoginValidationSuccess extends LoginValidationState {}

class LoginValidationFailure extends LoginValidationState {
  String error;
  LoginValidationFailure({
    required this.error,
  });
}
