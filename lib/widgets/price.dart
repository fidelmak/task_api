import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:http/http.dart' as http;

import '../const/const.dart'; // Assuming primaryColor is defined in const.dart

class PriceList extends StatefulWidget {
  @override
  State<PriceList> createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  Map<String, dynamic> cryptoPrices = {};

  FutureOr<Map<String, dynamic>> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,solana,tron,ethereum&vs_currencies=usd'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cryptocurrency prices');
    }
  }

  @override
  FutureOr<void> initState() async {
    super.initState();
    try {
      final prices = await fetchCryptoPrices();
      setState(() {
        cryptoPrices = prices;
      });
    } catch (error) {
      print('Error fetching prices: $error');
      // You may want to handle this error more gracefully, like displaying an error message to the user.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Bitcoin'),
          subtitle: Text('price'),
          leading: Icon(CryptoFontIcons.BTC),
          trailing: Text(
            ' \$  ${cryptoPrices.containsKey('bitcoin') ? cryptoPrices['bitcoin']['usd'] : 'Loading...'}',
            style:
                TextStyle(fontSize: 30, color: Colors.amber), // Removed const
          ),
          textColor: primaryColor, // Assuming primaryColor is defined
          iconColor: Colors.amber,
          contentPadding:
              EdgeInsets.all(15), // Changed margin to contentPadding
          onTap: () {},
        ),
        // Repeat the same ListTile structure for other cryptocurrencies
      ],
    );
  }
}
