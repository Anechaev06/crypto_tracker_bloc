import 'package:crypto_tracker_bloc/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/app.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const App());
}
