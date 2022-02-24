import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tihrasguinho/src/app_module.dart';
import 'package:tihrasguinho/src/app_widget.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
