import 'package:flu_mobx/imc/imc_page.dart';
import 'package:flu_mobx/observables/observable_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ObservableListPage(),
  ));
}
