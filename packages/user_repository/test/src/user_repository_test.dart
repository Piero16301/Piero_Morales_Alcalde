// Not required for test files
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

class MockUserApi extends Mock implements IUserApi {}

void main() {
  group('UserRepository', () {
    late IUserApi userApi;

    setUp(() {
      userApi = MockUserApi();
    });

    test('can be instantiated', () {
      expect(
        UserRepository(userApi: userApi),
        isNotNull,
      );
    });
  });
}
