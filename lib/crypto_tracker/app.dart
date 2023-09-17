import 'package:crypto_tracker_bloc/core/routes/app_routes.dart';
import 'package:crypto_tracker_bloc/core/themes/app_theme.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/ui/screens/crypto_list_screen.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/blocs/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key); // changed super.key to key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: _buildHome(),
    );
  }

  Widget _buildHome() {
    return BlocProvider(
      create: (context) => getIt<CryptoListBloc>(),
      child: const CryptoListScreen(),
    );
  }
}
