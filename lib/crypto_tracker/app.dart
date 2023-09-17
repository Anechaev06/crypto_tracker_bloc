import 'package:crypto_tracker_bloc/crypto_tracker/ui/screens/crypto_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_tracker_bloc/core/routes/app_routes.dart';
import 'package:crypto_tracker_bloc/core/themes/app_theme.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/data/repositories/crypto_repository.dart';
import 'blocs/crypto_list_bloc.dart';

final getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) =>
            CryptoListBloc(cryptoRepository: getIt<CryptoRepository>()),
        child: const CryptoListScreen(),
      ),
    );
  }
}
