import 'package:flutter/material.dart';
import 'package:kro_resources/presentation/base/dimensions.dart';

class KroResponsive extends StatelessWidget {
  const KroResponsive({
    super.key,
    required this.mobile,
    required this.desktop,
  });
  final Widget mobile;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return switch (constraints.maxWidth) {
        < mobileWidth => mobile,
        _ => desktop,
      };
    });
  }
}
