import 'package:bitcoin_ticker_app/constants;.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PriceScreen extends StatefulWidget {
  final CoinData coinData = CoinData();

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String dropDownValueCurrency = "USD";
  late CoinData coinData;

  Map<String, String> priceList = Map<String, String>();
  String bPrice = "🔃";
  String lPrice = "🔃";
  String ePrice = "🔃";

  // Future<void> getExchangeRate() async {
  //   for (String crypto in cryptoList) {
  //     var data = await coinData.getCoinData(crypto, dropDownValueCurrency);
  //     double rate = data["rate"];
  //     priceList[crypto] = rate.toStringAsFixed(2);
  //   }
  // }
  //
  // List<PriceCard> getListOfCards() {
  //   List<PriceCard> cards = [];
  //   for (String crypto in cryptoList) {
  //     cards.add(PriceCard(text: "1 $crypto = $dropDownValueCurrency"));
  //   }
  //   return cards;
  // }

  void updateUI(String userSelectedCurrency) async {
    var b = await coinData.getCoinData("BTC", userSelectedCurrency);
    var e = await coinData.getCoinData("ETH", userSelectedCurrency);
    var l = await coinData.getCoinData("LTC", userSelectedCurrency);

    setState(() {
      bPrice = (b["rate"] as double).toStringAsFixed(2);
      ePrice = (e["rate"] as double).toStringAsFixed(2);
      lPrice = (l["rate"] as double).toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();
    coinData = widget.coinData;
    updateUI(dropDownValueCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // children: getListOfCards(),
              children: [
                PriceCard(text: "1 BTC = $bPrice $dropDownValueCurrency"),
                PriceCard(text: "1 ETH = $ePrice $dropDownValueCurrency"),
                PriceCard(text: "1 LTC = $lPrice $dropDownValueCurrency"),
              ],
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: Platform.isAndroid
                  ? AndroidDropDownWidget(
                      defaultValue: dropDownValueCurrency,
                      list: currenciesList,
                      action: (String? value) async {
                        print(value);

                        if (value != null) {
                          updateUI(value);
                          setState(() {
                            bPrice = "🔃";
                            lPrice = "🔃";
                            ePrice = "🔃";
                            dropDownValueCurrency = value;
                          });
                        }
                      },
                    )
                  : IosPicker(
                      list: currenciesList,
                      action: (int index) {
                        setState(() {
                          dropDownValueCurrency = currenciesList[index];
                          print(currenciesList[index]);
                        });
                      },
                    )),
        ],
      ),
    );
  }
}

// List<DropdownMenuItem<String>> getDropDownMenuItemValues(
//     List<String> listValues) {
//   List<DropdownMenuItem<String>> dropDownList = [];
//   for (String value in listValues) {
//     dropDownList.add(
//       DropdownMenuItem(
//         child: Text(value),
//         value: value,
//       ),
//     );
//   }
//
//   return dropDownList;
// }

class AndroidDropDownWidget extends StatelessWidget {
  final String defaultValue;
  final List<String> list;
  final ActionAndroidDropdown action;

  const AndroidDropDownWidget(
      {required this.defaultValue, required this.action, required this.list});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: defaultValue,
      onChanged: action,
      items: list
          .map((String currency) =>
              DropdownMenuItem(child: Text(currency), value: currency))
          .toList(),
      // items: getDropDownMenuItemValues(currenciesList),
      // items: [
      //   DropdownMenuItem(
      //     child: Text("USD"), //This is what the user sees.
      //     value:
      //         "USD", //This is the value that is passed to the onChanged method callback.
      //   ),
      //   DropdownMenuItem(
      //     child: Text("INR"), //This is what the user sees.
      //     value:
      //         "INR", //This is the value that is passed to the onChanged method callback.
      //   ),
      // ],
    );
  }
}

class IosPicker extends StatelessWidget {
  final List<String> list;
  final ActionIosPicker action;

  const IosPicker({required this.list, required this.action});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 40,
      onSelectedItemChanged: action,
      children: list.map((e) => Text(e)).toList(),
    );
  }
}

class PriceCard extends StatelessWidget {
  final String text;

  PriceCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
