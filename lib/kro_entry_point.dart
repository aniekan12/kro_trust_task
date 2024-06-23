import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:oktoast/oktoast.dart';

class KroEntryPoint extends StatefulWidget {
  const KroEntryPoint({super.key});

  @override
  State<KroEntryPoint> createState() => _KroEntryPointState();
}

class _KroEntryPointState extends State<KroEntryPoint> {
  final _router = locator.get<GoRouter>();
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
