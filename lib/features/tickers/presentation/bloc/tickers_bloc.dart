import 'dart:math' as math;
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:coincap/features/tickers/domain/entities/ticker.dart';
import 'package:coincap/features/tickers/domain/repositories/tickers_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

part 'tickers_event.dart';
part 'tickers_state.dart';

const _tickersLimit = 15;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TickersBloc extends Bloc<TickersEvent, TickersState> {
  TickersBloc({required TickersRepository tickersRepository})
    : _repository = tickersRepository,
      super(const TickersState()) {
    on<FetchTickers>(
      _onTickersLoaded,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final TickersRepository _repository;

  Future<void> _onTickersLoaded(
    FetchTickers event,
    Emitter<TickersState> emit,
  ) async {
    if (state.endReached) return;

    final response = await _repository.getAllTickers(
      start: event.start ?? state.tickers.length,
      limit: _tickersLimit,
    );

    response.fold(
      (failure) {
        emit(state.copyWith(status: TickersStatus.failure));
      },
      (data) {
        if (data.isEmpty) {
          return emit(state.copyWith(endReached: true));
        }

        /// Random background color for each element
        final tickersData = data.map(
          (el) => Ticker(
            id: el.id,
            symbol: el.symbol,
            name: el.name,
            priceUsd: el.priceUsd,
            color: Color(
              (math.Random().nextDouble() * 0xFFFFFF).toInt(),
            ).withValues(alpha: 1.0),
          ),
        );

        emit(
          state.copyWith(
            tickers: [...state.tickers, ...tickersData],
            status: TickersStatus.success,
          ),
        );
      },
    );
  }
}
