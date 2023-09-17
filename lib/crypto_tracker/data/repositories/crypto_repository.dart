import '../models/crypto_model.dart';
import '../services/coingecko_service.dart';

class CryptoRepository {
  final CoinGeckoService coinGeckoService;

  CryptoRepository({required this.coinGeckoService});

  Future<List<CryptoModel>> fetchCryptos() async {
    try {
      final cryptos = await coinGeckoService.fetchCryptos();
      // Implement caching or other data processing here if needed
      return cryptos;
    } catch (e) {
      throw Exception('Failed to load cryptocurrencies');
    }
  }
}
