import 'package:coincap/features/tickers/domain/entities/ticker.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const ticker = Ticker(
    id: '90',
    symbol: 'BTC',
    name: 'Bitcoin',
    priceUsd: '1.00',
  );

  group('Ticker entity tests', () {
    test('has right props', () {
      expect(ticker.props, ['90', 'BTC', 'Bitcoin', '1.00', null]);
    });

    test('equatable works and instances are equal', () {
      const ticker1 = Ticker(
        id: '1',
        symbol: 'BTC',
        name: 'Bitcoin',
        priceUsd: '1.00',
      );

      const ticker2 = Ticker(
        id: '1',
        symbol: 'BTC',
        name: 'Bitcoin',
        priceUsd: '1.00',
      );

      expect(ticker1, ticker2);
    });

    test('equatable works and instances are not equal', () {
      const ticker1 = Ticker(
        id: '1',
        symbol: 'BTC',
        name: 'Bitcoin',
        priceUsd: '1.00',
      );

      const ticker2 = Ticker(
        id: '2',
        symbol: 'BTC',
        name: 'Bitcoin',
        priceUsd: '1.00',
      );

      expect(ticker1, isNot(ticker2));
    });
  });
}
