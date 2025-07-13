import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:user_repository/user_repository.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required UserRepository userRepository,
    super.key,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(value: _userRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (_) => AppCubit(_userRepository),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
