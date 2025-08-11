import 'package:coincap/core/utils/typedefs.dart';
import 'package:coincap/features/tickers/domain/entities/ticker.dart';

abstract interface class TickersRepository {
  FutureResponse<List<Ticker>> getAllTickers({
    required int start,
    required int limit,
  });
}
