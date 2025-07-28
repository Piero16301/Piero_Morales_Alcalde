import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:piero_morales_alcalde/bootstrap.dart';
import 'package:piero_morales_alcalde/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_api_remote/user_api_remote.dart';
import 'package:user_repository/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env file
  try {
    await dotenv.load(fileName: 'assets/.env');
  } on Exception catch (e) {
    // In case .env file is not found, continue with default values
    debugPrint('Warning: .env file not found, using default values: $e');
  }

  // Initialize Firebase with the default options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get SharedPreferences instance
  final preferences = await SharedPreferences.getInstance();

  // Configure User API and User Repository
  final userApi = UserApiRemote(preferences: preferences);
  final userRepository = UserRepository(userApi: userApi);

  // Bootstrap the app
  await bootstrap(() => AppPage(userRepository: userRepository));
}
