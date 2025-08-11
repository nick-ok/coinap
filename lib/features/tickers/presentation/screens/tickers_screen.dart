import 'package:coincap/core/config/configure_dio.dart';
import 'package:coincap/features/tickers/data/datasources/tickers_remote_datasource.dart';
import 'package:coincap/features/tickers/data/repositories/tickers_repository_impl.dart';
import 'package:coincap/features/tickers/presentation/bloc/tickers_bloc.dart';
import 'package:coincap/features/tickers/presentation/widgets/tickers_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickersScreen extends StatelessWidget {
  TickersScreen({super.key});

  static const path = '/tickers';

  final tickersRepository = TickersRepositoryImpl(
    TickersRemoteDatasource(httpClient: configureDio()),
  );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => tickersRepository,
      child: Scaffold(
        body: BlocProvider(
          create: (_) =>
              TickersBloc(tickersRepository: tickersRepository)
                ..add(const FetchTickers()),
          child: const TickersList(),
        ),
      ),
    );
  }
}
