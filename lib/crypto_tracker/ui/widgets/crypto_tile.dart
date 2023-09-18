import 'package:flutter/material.dart';
import '../../data/models/crypto_model.dart';

class CryptoTile extends StatelessWidget {
  final CryptoModel crypto;

  const CryptoTile({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(crypto.name),
      subtitle: Text(crypto.symbol),
      trailing: Text('\$${crypto.price.toStringAsFixed(2)}'),
    );
  }
}
