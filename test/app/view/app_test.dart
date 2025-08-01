import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:piero_morales_alcalde/app/app.dart';
import 'package:piero_morales_alcalde/home/home.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

import '../../helpers/firebase_test_setup.dart';
import '../../helpers/mock_classes.dart';

void main() {
  group('App', () {
    late IUserApi mockUserApi;
    late UserRepository userRepository;

    setUpAll(() async {
      setupFirebaseAuthMocks();
    });

    setUp(() {
      mockUserApi = MockUserApi();
      userRepository = UserRepository(userApi: mockUserApi);
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(AppPage(userRepository: userRepository));

      await tester.pump();

      expect(find.byType(MaterialApp), findsOneWidget);

      for (var i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
