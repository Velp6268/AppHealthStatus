import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:health_status/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.maks).existsSync(), true);
    expect(File(AppImages.tim).existsSync(), true);
    expect(File(AppImages.vitalya).existsSync(), true);
    expect(File(AppImages.city).existsSync(), true);
    expect(File(AppImages.man).existsSync(), true);
    expect(File(AppImages.nikita).existsSync(), true);
    expect(File(AppImages.pointer).existsSync(), true);
  });
}
