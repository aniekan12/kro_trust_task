import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kro_trust_task/common/gen/fonts.gen.dart';
import 'package:kro_trust_task/common/theme/typography/kro_header_text_styles.dart';

void main() {
  group('KroHeaderTextStyles', () {
    test('small TextStyle should have correct properties', () {
      expect(KroHeaderTextStyles.small.fontFamily, KroFonts.plusJakartaSans);
      expect(KroHeaderTextStyles.small.fontSize, 14);
      expect(KroHeaderTextStyles.small.fontWeight, FontWeight.w500);
    });

    test('extraSmall TextStyle should have correct properties', () {
      expect(
          KroHeaderTextStyles.extraSmall.fontFamily, KroFonts.plusJakartaSans);
      expect(KroHeaderTextStyles.extraSmall.fontSize, 12);
      expect(KroHeaderTextStyles.extraSmall.fontWeight, FontWeight.w500);
    });

    test('large TextStyle should have correct properties', () {
      expect(KroHeaderTextStyles.large.fontFamily, KroFonts.plusJakartaSans);
      expect(KroHeaderTextStyles.large.fontSize, 24);
      expect(KroHeaderTextStyles.large.fontWeight, FontWeight.w600);
    });

    test('medium TextStyle should have correct properties', () {
      expect(KroHeaderTextStyles.medium.fontFamily, KroFonts.plusJakartaSans);
      expect(KroHeaderTextStyles.medium.fontSize, 18);
      expect(KroHeaderTextStyles.medium.fontWeight, FontWeight.w600);
    });
  });
}
