import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/constants/regex_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'login_validation_event.dart';
part 'login_validation_state.dart';

class LoginValidationBloc
    extends Bloc<LoginValidationEvent, LoginValidationState> {
  LoginValidationBloc() : super(LoginValidationInitial()) {
    on<LoginValidationPressed>(_loginValidatePressed);
  }
  void _loginValidatePressed(
      LoginValidationPressed event, Emitter<LoginValidationState> emit) {
    emit(LoginValidateLoading());
    String email = event.email;
    String password = event.password;
    BuildContext context = event.context;
    final regexEmail = RegExp(RegexValidation.email);
    if (email.isEmpty) {
      emit(LoginValidationFailure(
          error: AppLocalizations.of(context).emptyEmail));
    } else if (!regexEmail.hasMatch(email)) {
      emit(LoginValidationFailure(
          error: AppLocalizations.of(context).invalidEmail));
    } else if (password.isEmpty) {
      emit(LoginValidationFailure(
          error: AppLocalizations.of(context).emptyPassword));
    } else if (password.length < 6) {
      emit(LoginValidationFailure(
          error:
              AppLocalizations.of(context).passwordShouldContainSixCharacters));
    } else {
      emit(LoginValidationSuccess());
    }
  }
}
