import 'package:flutter/material.dart';
import 'package:crypto_tracker_bloc/core/routes/app_routes.dart';
import 'package:crypto_tracker_bloc/core/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
