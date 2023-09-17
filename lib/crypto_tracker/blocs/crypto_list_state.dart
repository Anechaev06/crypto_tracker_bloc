part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {
  const CryptoListState();

  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoModel> cryptos;

  const CryptoListLoaded({required this.cryptos});

  @override
  List<Object?> get props => [cryptos];
}

class CryptoListError extends CryptoListState {
  final String message;

  const CryptoListError(this.message);

  @override
  List<Object?> get props => [message];
}
