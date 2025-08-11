import 'dart:developer';

import 'package:coincap/app/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

void bootstrap() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    log(error.toString(), stackTrace: stack);

    return true;
  };

  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}
