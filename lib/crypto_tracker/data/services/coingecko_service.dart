import 'dart:convert';
import 'package:crypto_tracker_bloc/crypto_tracker/data/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class CoinGeckoService {
  static const _baseApiUrl = "https://api.coingecko.com/api/v3";

  Future<List<CryptoModel>> fetchCryptos() async {
    try {
      const url =
          '$_baseApiUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        final cryptos = jsonList
            .map((json) => CryptoModel(
                  id: json['id'],
                  name: json['name'],
                  symbol: json['symbol'],
                  price: json['current_price'].toDouble(),
                ))
            .toList();
        return cryptos;
      } else {
        throw Exception('Failed to load cryptocurrencies');
      }
    } catch (e) {
      throw Exception('Failed to load cryptocurrencies: $e');
    }
  }
}
