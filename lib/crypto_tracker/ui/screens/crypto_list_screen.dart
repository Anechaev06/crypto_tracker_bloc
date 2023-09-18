import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../blocs/crypto_list_bloc.dart';
import '../widgets/crypto_list_builder.dart';

final getIt = GetIt.instance;

class CryptoListScreen extends StatelessWidget {
  const CryptoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CryptoListBloc>()..add(LoadCryptos()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Crypto'),
        ),
        body: const CryptoListBuilder(),
      ),
    );
  }
}
