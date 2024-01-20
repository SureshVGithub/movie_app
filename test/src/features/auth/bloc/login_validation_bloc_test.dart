import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/src/features/auth/bloc/login_validation_bloc.dart';

void main() {
  testWidgets('login validation bloc test ...', (tester) async {
    // TODO: Implement test
  });
  test('given login validation class test', () {
    LoginValidationBloc loginValidationBloc = LoginValidationBloc();
  final res=  loginValidationBloc.add(LoginValidationEvent());
  });
}
