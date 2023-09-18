import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/crypto_model.dart';
import '../data/repositories/crypto_repository.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final CryptoRepository cryptoRepository;

  CryptoListBloc({required this.cryptoRepository})
      : super(CryptoListInitial()) {
    on<LoadCryptos>((event, emit) async {
      emit(CryptoListLoading());
      try {
        final cryptos = await cryptoRepository.fetchCryptos();
        if (cryptos.isEmpty) {
          emit(CryptoListEmpty());
        } else {
          emit(CryptoListLoaded(cryptos: cryptos));
        }
      } catch (e) {
        emit(CryptoListError(
            'Failed to load cryptocurrencies: ${e.toString()}'));
      }
    });
  }
}
