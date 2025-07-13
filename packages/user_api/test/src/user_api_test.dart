// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:user_api/user_api.dart';

class TestUserApi implements IUserApi {
  @override
  bool? getDarkTheme() => false;

  @override
  String? getLanguage() => 'es_ES';

  @override
  Future<void> saveDarkTheme({bool darkTheme = false}) => Future.value();

  @override
  Future<void> saveLanguage({String language = 'es_ES'}) => Future.value();
}

void main() {
  group('UserApi', () {
    test('can be instantiated', () {
      expect(TestUserApi(), isNotNull);
    });
  });
}
