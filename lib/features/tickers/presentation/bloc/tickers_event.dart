part of 'tickers_bloc.dart';

sealed class TickersEvent extends Equatable {
  const TickersEvent();

  @override
  List<Object> get props => [];
}

final class FetchTickers extends TickersEvent {
  const FetchTickers({this.start});

  final int? start;
}
