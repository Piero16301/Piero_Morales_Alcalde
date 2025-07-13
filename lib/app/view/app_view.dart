import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:piero_morales_alcalde/l10n/l10n.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => MaterialApp.router(
        title: AppProperties.appName,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationParser: AppRouter.router.routeInformationParser,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: state.locale,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeAnimationCurve: Curves.bounceInOut,
        themeAnimationDuration: AppProperties.themeAnimationDuration,
        themeMode: (state.darkTheme ?? false)
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }
}
