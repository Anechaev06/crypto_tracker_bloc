import 'package:flutter/material.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/screens/crypto_detail_screen.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/screens/crypto_list_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.cryptoList:
        return MaterialPageRoute(
          builder: (_) => const CryptoListScreen(),
        );
      case AppRoutes.cryptoDetail:
        return MaterialPageRoute(
          builder: (_) => const CryptoDetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const CryptoListScreen(),
        );
    }
  }
}

class AppRoutes {
  static const String home = '/';
  static const String cryptoList = '/cryptoList';
  static const String cryptoDetail = '/cryptoDetail';
}
