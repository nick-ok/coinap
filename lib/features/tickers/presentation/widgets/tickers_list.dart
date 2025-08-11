import 'package:coincap/features/tickers/presentation/bloc/tickers_bloc.dart';
import 'package:coincap/features/tickers/presentation/widgets/tickers_list_bottom_loader.dart';
import 'package:coincap/features/tickers/presentation/widgets/tickers_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Implement pagination when scrolling down, display the next 15 elements
class TickersList extends StatefulWidget {
  const TickersList({super.key});

  @override
  State<TickersList> createState() => _TickersListState();
}

class _TickersListState extends State<TickersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<TickersBloc>().add(const FetchTickers(start: 1));
      },
      child: BlocBuilder<TickersBloc, TickersState>(
        builder: (context, state) {
          switch (state.status) {
            case TickersStatus.failure:
              return const Center(child: Text('FAILURE'));
            case TickersStatus.success:
              if (state.tickers.isEmpty) {
                return const Center(child: Text('No data'));
              }

              return ListView.builder(
                itemCount: state.tickers.length,
                controller: _scrollController,
                itemBuilder: (context, int index) {
                  return index >= state.tickers.length
                      ? const TickersListBottomLoader()
                      : TickersListItem(ticker: state.tickers[index]);
                },
              );
            case TickersStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<TickersBloc>().add(const FetchTickers());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.8);
  }
}
