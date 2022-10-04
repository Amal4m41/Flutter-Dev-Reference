import 'package:bitcoin_ticker_app/networking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const baseUrlCoinApi = "https://rest.coinapi.io/v1/exchangerate";
const apikey = "16A3B103-4E17-4298-90CD-0B776C56E590#";

class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = Map();

    for (String crypto in cryptoList) {
      http.Response response = await http
          .get(Uri.parse("$baseUrlCoinApi/$crypto/$currency?apikey=$apikey"));

      if (response.statusCode == 200) {
        String body = response.body;

        //Parses the string and returns the resulting Json object
        Map<String, dynamic> decodedJson = jsonDecode(body);
        cryptoPrices[crypto] =
            (decodedJson["rate"] as double).toStringAsFixed(2);
      } else {
        print(response.statusCode);
      }
    }

    return cryptoPrices;
  }
}
