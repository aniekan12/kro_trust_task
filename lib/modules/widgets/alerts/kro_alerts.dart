import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/gen/assets.gen.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/utils/extensions.dart';
import 'package:oktoast/oktoast.dart';

class KroAlerts {
  static show(
      {required String message, required BuildContext context, Widget? icon}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: KroColors.primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon,
          if (icon != null) 8.horizontalGap,
          Text(
            message,
            style: KroBodyTextStyles.medium.copyWith(color: KroColors.white),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );

    showToastWidget(
      toast,
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 2),
    );
  }

  static success(
      {required String message,
      double? offset,
      required BuildContext context}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF63C38F),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          KroAssets.images.svg.success.svg(width: 18),
          8.horizontalGap,
          Text(
            message,
            style: KroBodyTextStyles.medium.copyWith(color: KroColors.white),
          ),
        ],
      ),
    );

    showToastWidget(
      toast,
      position: ToastPosition.top,
      duration: const Duration(seconds: 2),
    );
  }

  static error(
      {required String message,
      double? offset,
      required BuildContext context}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF63C38F),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          KroAssets.images.svg.error.svg(width: 18),
          8.horizontalGap,
          Text(
            message,
            style: KroBodyTextStyles.medium.copyWith(color: KroColors.white),
          ),
        ],
      ),
    );

    showToastWidget(
      toast,
      position: ToastPosition.top,
      duration: const Duration(seconds: 2),
    );
  }

  //success & undo
  static successAndUndo(
      {required String message,
      required Function undoPressed,
      required BuildContext context}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Theme.of(context).highlightColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, color: Theme.of(context).primaryColor),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 12.0,
          ),
          GestureDetector(
            onTap: () {
              undoPressed();
            },
            child: const Text(
              'Undo',
              style: TextStyle(
                  color: Color(0xFF9D98F9),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );

    showToastWidget(
      toast,
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 2),
    );
  }
}
