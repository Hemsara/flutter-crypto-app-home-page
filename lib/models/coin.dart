class Coin {
  final String uuid;
  final String symbol;
  final String name;
  final String? color;
  final String iconUrl;
  final double price;
  final double change;

  Coin(
      {required this.uuid,
      required this.symbol,
      required this.name,
      required this.color,
      required this.iconUrl,
      required this.price,
      required this.change});

  factory Coin.fromJson(Map<String, dynamic> parsedJson) {
    return Coin(
        uuid: parsedJson['uuid'],
        symbol: parsedJson['symbol'],
        name: parsedJson['name'],
        color: parsedJson['color'],
        iconUrl: parsedJson['iconUrl'],
        price: double.parse(parsedJson['price']),
        change: double.parse(parsedJson['change']));
  }
}
