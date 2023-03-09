import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_status/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.man).existsSync(), true);
    expect(File(AppImages.pointer).existsSync(), true);
  });
}
