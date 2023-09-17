import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/crypto_list_bloc.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListBloc, CryptoListState>(
      builder: (context, state) {
        if (state is CryptoListLoading) {
          return const CircularProgressIndicator();
        } else if (state is CryptoListLoaded) {
          final cryptos = state.cryptos;
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
          return Text(state.message);
        }
        return Container(); // Default empty state
      },
    );
  }
}
