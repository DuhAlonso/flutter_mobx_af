import 'package:mobx/mobx.dart';

import '../model/full_name.dart';

class ContadorController {
  // nossa vareavel é uma classe do mobx
  var _counter = Observable<int>(0);

  var _fullName = Observable<FullName>(FullName(first: 'First', last: 'Last'));

  late Action increment;
  late Computed _saudacaoComputed;

  ContadorController() {
    increment = Action(_incrementCounter);
    _saudacaoComputed = Computed(() => 'Olá ${_fullName.value.first}');
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;
  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;
    //! Não pode ser desse jeito
    // _fullName.value.first = 'Eduardo';
    // _fullName.value.last = 'Alonso';
    // ! Opção 01
    // _fullName.value = FullName(first: 'Eduardo', last: 'Alonso');
    // ! Opção 02
    _fullName.value = _fullName.value.copyWith(first: 'João', last: 'Jozé');
  }
}
