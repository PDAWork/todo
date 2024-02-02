import 'package:flutter/material.dart';
import 'package:todo_p1/di/service.dart';
import 'package:todo_p1/features/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
