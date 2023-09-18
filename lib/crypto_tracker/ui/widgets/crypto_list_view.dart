import 'package:flutter/material.dart';
import '../../data/models/crypto_model.dart';
import 'crypto_tile.dart';

class CryptoListView extends StatelessWidget {
  final List<CryptoModel> cryptos;

  const CryptoListView({super.key, required this.cryptos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        return CryptoTile(crypto: cryptos[index]);
      },
    );
  }
}
