import 'package:coincap/core/utils/format_price.dart';
import 'package:coincap/features/tickers/domain/entities/ticker.dart';
import 'package:coincap/features/tickers/presentation/widgets/tickers_list_item_leading.dart';
import 'package:flutter/material.dart';

class TickersListItem extends StatelessWidget {
  const TickersListItem({required this.ticker, super.key});

  final Ticker ticker;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TickersListItemLeading(color: ticker.color ?? Colors.grey),
      title: Text(ticker.name),
      trailing: Text(
        formatPrice(price: ticker.priceUsd),
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
