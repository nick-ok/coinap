import 'package:coincap/core/config/theme.dart';
import 'package:coincap/core/router/router_config.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routerConfig, theme: theme);
  }
}
