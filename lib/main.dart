import 'package:flutter/material.dart';
import 'package:task/src/app.dart';
import 'package:task/src/core/dependency_injection/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MainApp());
}
