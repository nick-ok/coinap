import 'package:coincap/core/failure.dart';
import 'package:coincap/core/utils/typedefs.dart';
import 'package:coincap/features/tickers/data/dto/ticker_dto.dart';
import 'package:coincap/features/tickers/domain/entities/ticker.dart';
import 'package:dio/dio.dart';

class TickersRemoteDatasource {
  TickersRemoteDatasource({required Dio httpClient}) : _httpClient = httpClient;

  final Dio _httpClient;

  Future<List<Ticker>> getTickers(int start, int limit) async {
    final response = await _httpClient.get(
      '/tickers',
      queryParameters: {'start': start, 'limit': limit},
    );

    if (response.statusCode == 200) {
      final List data = (response.data as DataMap)['data'] as List;

      return data.map((el) => TickerDto.fromJson(el as DataMap)).toList();
    } else {
      throw const ServerFailure('Failed to get tickers');
    }
  }
}
