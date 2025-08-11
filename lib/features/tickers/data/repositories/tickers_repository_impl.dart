import 'package:coincap/core/failure.dart';
import 'package:coincap/core/utils/typedefs.dart';
import 'package:coincap/features/tickers/data/datasources/tickers_remote_datasource.dart';
import 'package:coincap/features/tickers/domain/entities/ticker.dart';
import 'package:coincap/features/tickers/domain/repositories/tickers_repository.dart';
import 'package:dartz/dartz.dart';

class TickersRepositoryImpl implements TickersRepository {
  TickersRepositoryImpl(this.datasource);

  final TickersRemoteDatasource datasource;

  @override
  FutureResponse<List<Ticker>> getAllTickers({
    required int start,
    required int limit,
  }) async {
    try {
      final tickers = await datasource.getTickers(start, limit);

      return Right(tickers);
    } on ServerFailure {
      return const Left(ServerFailure('Failed to get tickers'));
    } catch (err) {
      return const Left(ServerFailure('Failed to get tickers'));
    }
  }
}
