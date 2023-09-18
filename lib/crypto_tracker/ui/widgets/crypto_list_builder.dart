import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/crypto_list_bloc.dart';
import 'crypto_list_view.dart';

class CryptoListBuilder extends StatelessWidget {
  const CryptoListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListBloc, CryptoListState>(
      builder: (context, state) {
        if (state is CryptoListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CryptoListLoaded) {
          return CryptoListView(cryptos: state.cryptos);
        } else if (state is CryptoListError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
