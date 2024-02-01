import 'package:flutter_test/flutter_test.dart';
import 'package:ecotown/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MenuDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
