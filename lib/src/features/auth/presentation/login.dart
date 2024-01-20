import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/features/auth/bloc/login_validation_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/src/utils/local_store/local_store.dart';
import '../../../../l10n/bloc/localization_bloc.dart';
import '../../../widgets/app_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginValidationBloc, LoginValidationState>(
      listener: (context, state) {
        if (state is LoginValidationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        if (state is LoginValidationSuccess) {
          GoRouter.of(context).push("/");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppLocalizations.of(context).loginSuccess,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          );
        }
        // TODO: implement listener
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        // LocalStore localStore = LocalStore();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actionsAlignment: MainAxisAlignment.spaceEvenly,
                              title: const Text('Choose language'),
                              // content: Text('This is a simple dialog.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // localStore.setLanguageSelected('en');

                                    context.read<LocalizationBloc>().add(
                                        LoacalizationChanged(
                                            selectedLanguage: 'en'));
                                  },
                                  child: const Text('English'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // localStore.setLanguageSelected('hi');
                                    context.read<LocalizationBloc>().add(
                                        LoacalizationChanged(
                                            selectedLanguage: 'hi'));
                                  },
                                  child: const Text('Hindi'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // localStore.setLanguageSelected('kn');

                                    context.read<LocalizationBloc>().add(
                                        LoacalizationChanged(
                                            selectedLanguage: 'kn'));
                                  },
                                  child: const Text('Kannada'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    // localStore.setLanguageSelected('tl');

                                    context.read<LocalizationBloc>().add(
                                        LoacalizationChanged(
                                            selectedLanguage: 'tl'));
                                  },
                                  child: const Text('Telugu'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.translate));
                },
              ),
            ],
            title: Text(AppLocalizations.of(context).login),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                AppTextField(
                  textInputType: TextInputType.emailAddress,
                  suffix: const Icon(Icons.mail),
                  hintText: AppLocalizations.of(context).emailHintText,
                  controller: emailController,
                ),
                const Spacer(),
                AppTextField(
                  textInputType: TextInputType.text,
                  suffix: const Icon(Icons.key),
                  hintText: AppLocalizations.of(context).passwordHintText,
                  controller: passwordController,
                ),
                const Spacer(flex: 15),
                ElevatedButton(
                  onPressed: () {
                    LocalStore().setEmail(emailController.text);
                    context
                        .read<LoginValidationBloc>()
                        .add(LoginValidationPressed(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                  },
                  child: Text(AppLocalizations.of(context).submit),
                )
                // Container(),
              ],
            ),
          )),
    );
  }
}
