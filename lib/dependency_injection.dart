import 'package:get_it/get_it.dart';
import 'package:crypto_tracker_bloc/crypto_tracker/data/repositories/crypto_repository.dart';
import 'crypto_tracker/blocs/crypto_list_bloc.dart';
import 'crypto_tracker/data/services/coingecko_service.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerLazySingleton<CoinGeckoService>(() => CoinGeckoService());

  getIt.registerLazySingleton<CryptoRepository>(
      () => CryptoRepository(coinGeckoService: getIt<CoinGeckoService>()));

  getIt.registerFactory<CryptoListBloc>(
      () => CryptoListBloc(cryptoRepository: getIt<CryptoRepository>()));
}
