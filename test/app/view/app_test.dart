import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
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
    late MockUser mockUser;

    setUpAll(() async {
      setupFirebaseAuthMocks();
    });

    setUp(() {
      mockUserApi = MockUserApi();
      userRepository = UserRepository(userApi: mockUserApi);
      mockUser = MockUser();

      // Mock FirebaseAuth.instance to return a user (authenticated state)
      when(() => mockUser.uid).thenReturn('test-uid');
      when(() => mockUser.email).thenReturn('test@example.com');
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(AppPage(userRepository: userRepository));
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
