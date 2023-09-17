import 'package:get_it/get_it.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/data/services/coingecko_service.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/data/repositories/crypto_repository.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/blocs/crypto_list_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  _registerServices();
  _registerRepositories();
  _registerBlocs();
}

void _registerServices() =>
    getIt.registerLazySingleton<CoinGeckoService>(() => CoinGeckoService());

void _registerRepositories() => getIt.registerLazySingleton<CryptoRepository>(
    () => CryptoRepository(coinGeckoService: getIt<CoinGeckoService>()));

void _registerBlocs() => getIt.registerFactory<CryptoListBloc>(
    () => CryptoListBloc(cryptoRepository: getIt<CryptoRepository>()));
