import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/core/navigation/navigation_service.dart';

void main() {
  group('NavigationService', () {
    test('navigatorKey should be initialized', () {
      final navigationService = NavigationService();
      expect(navigationService.navigatorKey, isNotNull);
    });
  });
}
