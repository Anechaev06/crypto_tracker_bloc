import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/crypto_list_bloc.dart';

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrencies'),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        builder: (context, state) {
          if (state is CryptoListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoListLoaded) {
            final cryptos = state.cryptos;
            if (cryptos.isEmpty) {
              return const Center(
                  child: Text('No cryptocurrencies available.'));
            }
            return ListView.builder(
              itemCount: cryptos.length,
              itemBuilder: (context, index) {
                final crypto = cryptos[index];
                return ListTile(
                  title: Text(crypto.name),
                  subtitle: Text(crypto.symbol),
                  trailing: Text('\$${crypto.price.toStringAsFixed(2)}'),
                );
              },
            );
          } else if (state is CryptoListError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
