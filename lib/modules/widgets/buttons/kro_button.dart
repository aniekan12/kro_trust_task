import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';

enum KroIconAlignment { left, right }

class KroButton extends StatelessWidget {
  factory KroButton.primary({
    required String title,
    required void Function() onTap,
    Widget? icon,
    ValueNotifier<bool>? state,
    bool isLoading = false,
    Color? textColor,
    EdgeInsets? padding,
    bool isExpanded = false,
  }) =>
      KroButton._(
        title: title,
        onTap: onTap,
        icon: icon,
        state: state,
        isLoading: isLoading,
        textColor: textColor,
        padding: padding,
        isExpanded: isExpanded,
        backgroundColor: KroColors.primary,
      );

  const KroButton._(
      {super.key,
      required this.title,
      required this.onTap,
      this.icon,
      this.state,
      this.isLoading = false,
      this.backgroundColor = KroColors.primary,
      this.textColor,
      this.padding,
      this.isExpanded = false});

  final String title;
  final void Function() onTap;
  final Widget? icon;
  final ValueNotifier<bool>? state;
  final bool isLoading;
  final Color backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: state ?? ValueNotifier<bool>(true),
        builder: (context, state, child) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                padding: padding,
                shadowColor: KroColors.transparent,
                minimumSize: Size(isExpanded ? double.infinity : 600, 50),
                backgroundColor: backgroundColor,
                maximumSize: Size(isExpanded ? double.infinity : 800, 50),
                disabledBackgroundColor: backgroundColor.withOpacity(0.5),
                disabledForegroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                foregroundColor: textColor ?? KroColors.black,
              ),
              onPressed: (!state || isLoading) ? null : onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: KroBodyTextStyles.small.copyWith(color: textColor),
                  )
                ],
              ));
        });
  }
}
