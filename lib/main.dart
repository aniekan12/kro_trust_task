import 'package:flutter/material.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/kro_entry_point.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  runApp(const KroEntryPoint());
}
