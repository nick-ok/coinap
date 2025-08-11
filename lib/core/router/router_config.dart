import 'package:coincap/features/tickers/presentation/screens/tickers_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter routerConfig = GoRouter(
  initialLocation: TickersScreen.path,
  routes: [
    GoRoute(
      path: TickersScreen.path,
      builder: (context, state) => TickersScreen(),
    ),
  ],
);
