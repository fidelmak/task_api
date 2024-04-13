import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wx_tile/wx_tile.dart';

import 'package:cryptofont/cryptofont.dart';
import 'package:http/http.dart' as http;
import 'package:task_api/const/const.dart';

class PriceList extends StatefulWidget {
  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  Map<String, dynamic> cryptoPrices = {};

  Future<Map<String, dynamic>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,solana,tron,ethereum&vs_currencies=usd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cryptocurrency prices');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCryptoPrices().then((prices) {
      setState(() {
        cryptoPrices = prices;
      });
    }).catchError((error) {
      print('Error fetching prices: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WxListTile(
          title: const Text('Bitcoin'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("BTC")),
          trailing: Text(
            ' \$  ${cryptoPrices.containsKey('bitcoin') ? cryptoPrices['bitcoin']['usd'] : 'Loading...'}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
        WxListTile(
          title: const Text('Ethereum'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("ETH")),
          trailing: Text(
            ' \$  ${cryptoPrices.containsKey('ethereum') ? cryptoPrices['ethereum']['usd'] : 'Loading...'}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
        WxListTile(
          title: const Text('Solana'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("SOL")),
          trailing: Text(
            ' \$  ${cryptoPrices.containsKey('solana') ? cryptoPrices['solana']['usd'] : 'Loading...'}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
        WxListTile(
          title: const Text('Tron'),
          subtitle: const Text('price'),
          leading: Icon(CryptoFontIcons.fromSymbol("TRX")),
          trailing: Text(
            ' \$  ${cryptoPrices.containsKey('tron') ? cryptoPrices['tron']['usd'] : 'Loading...'}',
            style: const TextStyle(fontSize: 30, color: Colors.amber),
          ),
          textColor: primaryColor,
          iconColor: Colors.amber,
          margin: const EdgeInsets.all(15),
          onTap: () {},
        ),
      ],
    );
  }
}
