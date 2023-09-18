part of 'crypto_list_bloc.dart';

class CryptoListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoModel> cryptos;

  CryptoListLoaded({required this.cryptos});

  @override
  List<Object?> get props => [cryptos];
}

class CryptoListError extends CryptoListState {
  final String message;

  CryptoListError(this.message);

  @override
  List<Object?> get props => [message];
}

class CryptoListEmpty extends CryptoListState {}
