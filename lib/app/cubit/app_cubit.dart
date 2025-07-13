import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:user_repository/user_repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.userRepository) : super(const AppState());

  final UserRepository userRepository;

  Future<void> init() async {
    // Setting the language to the device language if it's not set
    final language = userRepository.getLanguage();
    if (language == null) {
      String deviceLanguage;
      if (!kIsWeb) {
        deviceLanguage = Platform.localeName;
      } else {
        deviceLanguage = 'es_ES';
      }
      await userRepository.saveLanguage(language: deviceLanguage);
    }
    emit(
      state.copyWith(
        locale: Locale(
          userRepository.getLanguage()!.split('_').first,
          userRepository.getLanguage()!.split('_').last,
        ),
      ),
    );

    // Setting the theme to the device theme if it's not set
    final darkTheme = userRepository.getDarkTheme();
    if (darkTheme == null) {
      final deviceBrightness = PlatformDispatcher.instance.platformBrightness;
      await userRepository.saveDarkTheme(
        darkTheme: deviceBrightness == Brightness.dark,
      );
    }
    emit(
      state.copyWith(
        darkTheme: userRepository.getDarkTheme(),
      ),
    );
  }

  Future<void> changeLanguage({String language = 'es_ES'}) async {
    await userRepository.saveLanguage(language: language);
    emit(state.copyWith(locale: Locale(language)));
  }

  Future<void> changeTheme({bool darkTheme = false}) async {
    await userRepository.saveDarkTheme(darkTheme: darkTheme);
    emit(state.copyWith(darkTheme: darkTheme));
  }
}
