import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/crypto_model.dart';
import '../data/repositories/crypto_repository.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final CryptoRepository cryptoRepository;

  CryptoListBloc({required this.cryptoRepository}) : super(CryptoListLoading());

  Stream<CryptoListState> mapEventToState(CryptoListEvent event) async* {
    if (event is LoadCryptos) {
      yield CryptoListLoading();
      try {
        final cryptos = await cryptoRepository.fetchCryptos();
        yield CryptoListLoaded(cryptos: cryptos);
      } catch (e) {
        yield CryptoListError(
            'Failed to load cryptocurrencies: ${e.toString()}');
      }
    }
  }
}
