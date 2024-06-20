import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/theme/color/kro_colors.dart';
import 'package:kro_trust_task/common/theme/typography/kro_body_text_styles.dart';
import 'package:kro_trust_task/utils/extensions.dart';

typedef AppBarTextBuilder = Widget Function(BuildContext context);

class KroAppBar {
  KroAppBar._();

  static PreferredSizeWidget primary({
    required String title,
    List<Widget> actions = const [],
    Color? backgroundColor,
    bool automaticallyImpliesLeading = true,
    double elevation = 0.0,
  }) {
    return _KroPrimaryAppBar(
      title: title,
      actions: actions,
      backgroundColor: backgroundColor,
      automaticallyImpliesLeading: automaticallyImpliesLeading,
      elevation: elevation,
    );
  }
}

class _KroPrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;
  final bool automaticallyImpliesLeading;
  final double elevation;
  final Color? backgroundColor;

  const _KroPrimaryAppBar({
    required this.actions,
    required this.title,
    this.backgroundColor,
    required this.automaticallyImpliesLeading,
    this.elevation = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return _$AppBar(
      title: title,
      backgroundColor: backgroundColor,
      actions: actions,
      centerTitle: true,
      elevation: elevation,
      automaticallyImpliesLeading: automaticallyImpliesLeading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _$AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final bool automaticallyImpliesLeading;
  final Widget? icon;
  final PreferredSize? bottom;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;
  final Color? backgroundColor;
  final double toolbarHeight;
  final double elevation;
  final double leadingWidth;
  final Color? color;

  const _$AppBar({
    this.title,
    this.backgroundColor,
    this.leading,
    this.titleWidget,
    this.toolbarHeight = kToolbarHeight,
    this.automaticallyImpliesLeading = true,
    this.icon,
    this.actions,
    this.leadingWidth = 0.0,
    this.bottom,
    this.color,
    this.centerTitle = true,
    this.elevation = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? KroColors.white,
      elevation: elevation,
      title:
          titleWidget ?? Text(title.orEmpty, style: KroBodyTextStyles.medium),
      automaticallyImplyLeading: automaticallyImpliesLeading,
      actions: actions,
      centerTitle: centerTitle,
      bottom: bottom,
      leadingWidth: leading != null ? leadingWidth : null,
      iconTheme: Theme.of(context).iconTheme.copyWith(color: KroColors.black),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
