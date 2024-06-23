import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kro_trust_task/common/di/app_module.dart';
import 'package:kro_trust_task/core/observer/kro_bloc_observer.dart';
import 'package:kro_trust_task/kro_entry_point.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injector();
  Bloc.observer = KroBlocObserver();

  runApp(const KroEntryPoint());
}
