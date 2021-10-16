import 'package:bitcoin_ticker_app/networking.dart';

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

class CoinData {
  Future getCoinData(String cryptoCoin, String currency) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: "$baseUrlCoinApi/$cryptoCoin/$currency?apikey=$apiKey");

    var data = await networkHelper.getData();

    print(data);
    return data;
  }
}
