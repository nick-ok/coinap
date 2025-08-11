import 'package:coincap/core/utils/typedefs.dart';
import 'package:coincap/features/tickers/domain/entities/ticker.dart';

class TickerDto extends Ticker {
  const TickerDto({
    required super.id,
    required super.symbol,
    required super.name,
    required super.priceUsd,
    super.color,
    this.nameId,
    this.rank,
    this.percentChange24h,
    this.percentChange1h,
    this.percentChange7d,
    this.priceBtc,
    this.marketCapUsd,
    this.cSupply,
    this.tSupply,
    this.mSupply,
  });

  final String? nameId;
  final int? rank;
  final String? percentChange24h;
  final String? percentChange1h;
  final String? percentChange7d;
  final String? priceBtc;
  final String? marketCapUsd;
  final String? cSupply;
  final String? tSupply;
  final String? mSupply;

  factory TickerDto.fromJson(DataMap json) {
    return TickerDto(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      priceUsd: json['price_usd'] as String,
      nameId: json['nameid'] as String?,
      rank: json['rank'] as int?,
      percentChange24h: json['percent_change_24h'] as String?,
      percentChange1h: json['percent_change_1h'] as String?,
      percentChange7d: json['percent_change_7d'] as String?,
      priceBtc: json['price_btc'] as String?,
      marketCapUsd: json['market_cap_usd'] as String?,
      cSupply: json['csupply'] as String?,
      tSupply: json['tsupply'] as String?,
      mSupply: json['msupply'] as String?,
    );
  }

  DataMap toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'color': color,
      'nameid': nameId,
      'rank': rank,
      'price_usd': priceUsd,
      'percent_change_24h': percentChange24h,
      'percent_change_1h': percentChange1h,
      'percent_change_7d': percentChange7d,
      'price_btc': priceBtc,
      'market_cap_usd': marketCapUsd,
      'csupply': cSupply,
      'tsupply': tSupply,
      'msupply': mSupply,
    };
  }
}
