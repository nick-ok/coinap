part of 'tickers_bloc.dart';

enum TickersStatus { initial, success, failure }

final class TickersState extends Equatable {
  const TickersState({
    this.status = TickersStatus.initial,
    this.tickers = const <Ticker>[],
    this.endReached = false,
  });

  final TickersStatus status;
  final List<Ticker> tickers;
  final bool endReached;

  TickersState copyWith({
    TickersStatus? status,
    List<Ticker>? tickers,
    bool? endReached,
    int? start,
  }) {
    return TickersState(
      status: status ?? this.status,
      tickers: tickers ?? this.tickers,
      endReached: endReached ?? this.endReached,
    );
  }

  @override
  List<Object> get props => [status, tickers, endReached];
}
