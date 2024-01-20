import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/theme/dark_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app/src/utils/local_store/local_store.dart';

import '../../../l10n/bloc/localization_bloc.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../theme/light_theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).settings,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).changeLanguage),
                      IconButton(
                          onPressed: () {
                            LocalStore localStore = LocalStore();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    actionsAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    title: const Text('Choose language'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();

                                            context
                                                .read<LocalizationBloc>()
                                                .add(LoacalizationChanged(
                                                    selectedLanguage: 'en'));
                                          },
                                          child: const Text('English'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            context
                                                .read<LocalizationBloc>()
                                                .add(LoacalizationChanged(
                                                    selectedLanguage: 'hi'));
                                          },
                                          child: const Text('Hindi'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            // localStore.setLanguageSelected('kn');

                                            context
                                                .read<LocalizationBloc>()
                                                .add(LoacalizationChanged(
                                                    selectedLanguage: 'kn'));
                                          },
                                          child: const Text('Kannada'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();

                                            context
                                                .read<LocalizationBloc>()
                                                .add(LoacalizationChanged(
                                                    selectedLanguage: 'tl'));
                                          },
                                          child: const Text('Telugu'),
                                        ),
                                      ],
                                    ));
                              },
                            );
                          },
                          icon: const Icon(Icons.translate)),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<ThemeBloc, ThemeData>(
                builder: (context, themeData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context).theme),
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: AnimatedToggleSwitch<ThemeData>.dual(
                          current: themeData,
                          first: lightTheme,
                          second: darkTheme,
                          spacing: 10,
                          style: const ToggleStyle(
                            borderColor: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1.5),
                              ),
                            ],
                          ),
                          borderWidth: 5.0,
                          height: 20,
                          onChanged: (b) {
                            BlocProvider.of<ThemeBloc>(context)
                                .add(ThemeSwitchEvent());
                            themeData = b;
                          },
                          styleBuilder: (b) => ToggleStyle(
                              indicatorColor:
                                  b == darkTheme ? Colors.black : Colors.white),
                          iconBuilder: (value) => value == darkTheme
                              ? const Icon(Icons.nightlight)
                              : const Icon(Icons.sunny),
                          textBuilder: (value) => value == darkTheme
                              ? const Center(child: Text('Dark'))
                              : const Center(child: Text('Light')),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(
                flex: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    LocalStore().setEmail('');
                    GoRouter.of(context).push("/login");
                    print('logout');
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  )),
              const Spacer(),
              Text(LocalStore().getEmail() ?? '-'),
              const Spacer()
            ],
          ),
        ));
  }
}
