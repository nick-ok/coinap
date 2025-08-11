import 'package:coincap/features/tickers/domain/entities/ticker.dart';

class TestData {
  static const List<Ticker> tickers = [
    Ticker(id: '0', symbol: 'symbol0', name: 'name0', priceUsd: '1.00'),
    Ticker(id: '1', symbol: 'symbol1', name: 'name1', priceUsd: '2.00'),
    Ticker(id: '2', symbol: 'symbol2', name: 'name2', priceUsd: '3.00'),
  ];
}
