import 'package:coincap/core/failure.dart';
import 'package:coincap/features/tickers/data/datasources/tickers_remote_datasource.dart';
import 'package:coincap/features/tickers/data/repositories/tickers_repository_impl.dart';
import 'package:coincap/features/tickers/domain/repositories/tickers_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_data.dart';
import 'tickers_repository_test.mocks.dart';

@GenerateMocks([TickersRemoteDatasource])
void main() {
  late TickersRemoteDatasource tickersRemoteDatasource;
  late TickersRepository tickersRepository;

  setUp(() {
    tickersRemoteDatasource = MockTickersRemoteDatasource();
    tickersRepository = TickersRepositoryImpl(tickersRemoteDatasource);
  });

  group('tickers_repository', () {
    test('Return tickers list if success', () async {
      when(
        tickersRemoteDatasource.getTickers(0, 15),
      ).thenAnswer((_) async => TestData.tickers);

      final response = await tickersRepository.getAllTickers(
        start: 0,
        limit: 15,
      );

      expect(response, isA<Right>());
      expect((response as Right).value, TestData.tickers);
      verify(tickersRepository.getAllTickers(start: 0, limit: 15)).called(1);
    });

    test('Return tickers list if failure', () async {
      when(tickersRemoteDatasource.getTickers(0, 15)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/tickers'),
          response: Response(
            requestOptions: RequestOptions(path: '/tickers'),
            statusCode: 400,
          ),
        ),
      );

      final response = await tickersRepository.getAllTickers(
        start: 0,
        limit: 15,
      );

      expect(response, isA<Left>());
      expect((response as Left).value, isA<ServerFailure>());
      expect(
        (response as Left).value,
        const ServerFailure('Failed to get tickers'),
      );
      verify(tickersRepository.getAllTickers(start: 0, limit: 15)).called(1);
    });
  });
}
