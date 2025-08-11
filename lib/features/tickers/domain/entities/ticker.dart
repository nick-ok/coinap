import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Ticker extends Equatable {
  const Ticker({
    required this.id,
    required this.symbol,
    required this.name,
    required this.priceUsd,
    this.color,
  });

  final String id;
  final String symbol;
  final String name;
  final String priceUsd;
  final Color? color;

  @override
  List<Object?> get props => [id, symbol, name, priceUsd, color];
}
