import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart'; // Import GetIt
import '../../blocs/crypto_list_bloc.dart';

final getIt = GetIt.instance;

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CryptoListBloc>()..add(LoadCryptos()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cryptocurrencies'),
        ),
        body: BlocBuilder<CryptoListBloc, CryptoListState>(
          builder: (context, state) {
            if (state is CryptoListLoading) {
              return const Center(child: CircularProgressIndicator());
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
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
