import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class CryptoPriceWidget extends StatefulWidget {
  @override
  _CryptoPriceWidgetState createState() => _CryptoPriceWidgetState();
}

class _CryptoPriceWidgetState extends State<CryptoPriceWidget> {
  Map<String, dynamic> cryptoPrices = {};
  FutureOr<Map<String, dynamic>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cryptocurrency prices');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPrices();
  }

  FutureOr<void> fetchPrices() async {
    try {
      final Map<String, dynamic> prices = await fetchCryptoPrices();
      setState(() {
        cryptoPrices = prices;
      });
    } catch (e) {
      print('Error fetching prices: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Prices'),
      ),
      body: Center(
        child: cryptoPrices.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Bitcoin Price: \$${cryptoPrices['bitcoin']['usd']}'),
                  Text('Ethereum Price: \$${cryptoPrices['ethereum']['usd']}'),
                ],
              ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CryptoPriceWidget(),
  ));
}
