import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/common/gen/fonts.gen.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';

void main() {
  group('KroBodyTextStyles', () {
    test('small TextStyle should have correct properties', () {
      expect(KroBodyTextStyles.small.fontFamily, KroFonts.plusJakartaSans);
      expect(KroBodyTextStyles.small.fontSize, 12);
      expect(KroBodyTextStyles.small.fontWeight, FontWeight.w400);
    });

    test('extraSmall TextStyle should have correct properties', () {
      expect(KroBodyTextStyles.extraSmall.fontFamily, KroFonts.plusJakartaSans);
      expect(KroBodyTextStyles.extraSmall.fontSize, 10);
      expect(KroBodyTextStyles.extraSmall.fontWeight, FontWeight.w300);
    });

    test('large TextStyle should have correct properties', () {
      expect(KroBodyTextStyles.large.fontFamily, KroFonts.plusJakartaSans);
      expect(KroBodyTextStyles.large.fontSize, 18);
      expect(KroBodyTextStyles.large.fontWeight, FontWeight.w500);
    });

    test('medium TextStyle should have correct properties', () {
      expect(KroBodyTextStyles.medium.fontFamily, KroFonts.plusJakartaSans);
      expect(KroBodyTextStyles.medium.fontSize, 14);
      expect(KroBodyTextStyles.medium.fontWeight, FontWeight.w400);
    });
  });
}
