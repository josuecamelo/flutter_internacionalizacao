import 'package:bytebank/components/localization.dart';
import 'package:bytebank/components/theme.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/container.dart';
import 'screens/dashboard.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(BytebankApp());
}

//alterado

class LogObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print("${cubit.runtimeType} > $change");
    super.onChange(cubit, change);
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // na prática evitar log do genero, pois pode vazar informações sensíveis para o log
    Bloc.observer = LogObserver();

    return MaterialApp(
      theme: bytebankTheme,
      home: LocalizationContainer(child: DashboardContainer()),
    );
  }
}