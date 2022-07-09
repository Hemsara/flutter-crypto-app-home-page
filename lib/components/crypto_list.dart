import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/constants.dart';
import '../api/crypto_api.dart';
import '../models/coin.dart';
import 'crypto_currency.dart';
import 'title.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: pageHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(text: "Popular Cryptos"),
          FutureBuilder<List<Coin>>(
              future: CryptoApi.getCoins(limit: 25),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading"));
                } else if (snapshot.hasData) {
                  List<Coin> coins = snapshot.data!;
                  return Column(
                    children: coins
                        .map((coin) => CryptoCurrency(
                              coin: coin,
                            ))
                        .toList(),
                  );
                }
                return const Text("Something went wrong");
              }),
        ],
      ),
    );
  }
}
