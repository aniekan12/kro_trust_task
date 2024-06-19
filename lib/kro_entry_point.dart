import 'package:flutter/material.dart';

class KroEntryPoint extends StatefulWidget {
  const KroEntryPoint({super.key});

  @override
  State<KroEntryPoint> createState() => _KroEntryPointState();
}

class _KroEntryPointState extends State<KroEntryPoint> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router();
  }
}
