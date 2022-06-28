import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  var nome = Future.value('').asObservable();

  Future<void> buscarNome() async {
    nome = Future.delayed(const Duration(seconds: 2), () => 'Eduardo Alonso')
        .asObservable();
  }
}
