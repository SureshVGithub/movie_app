part of 'login_validation_bloc.dart';

@immutable
class LoginValidationEvent {}

class LoginValidationPressed extends LoginValidationEvent {
  String email;
  String password;
  BuildContext context;
  LoginValidationPressed({
    required this.email,
    required this.password,
    required this.context,
  });
}
