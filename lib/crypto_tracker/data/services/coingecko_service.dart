// coingecko_service.dart (unchanged)
import 'dart:convert';
import 'package:crypto_tracker_bloc/crypto_tracker/data/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class CoinGeckoService {
  static const String baseUrl = 'https://api.coingecko.com/api/v3';

  Future<List<CryptoModel>> fetchCryptos() async {
    try {
      final response =
          await http.get(Uri.parse('$baseUrl/coins/markets'), headers: {
        'Accept': 'application/json',
      });

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
      throw Exception('Failed to load cryptocurrencies, $e');
    }
  }
}
