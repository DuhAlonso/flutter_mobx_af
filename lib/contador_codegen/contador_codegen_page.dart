import 'package:flu_mobx/contador_codegen/contador_codegen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ContadorCodegGenPage extends StatefulWidget {
  const ContadorCodegGenPage({Key? key}) : super(key: key);

  @override
  State<ContadorCodegGenPage> createState() => _ContadorCodegGenPageState();
}

class _ContadorCodegGenPageState extends State<ContadorCodegGenPage> {
  final _controller = ContadorCodeGenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    //auto run dica escutando as variaveis que estão sendo usadas dentro dele
    // e tambem roda logo quando foi criado
    final autorunDisposer = autorun((_) {
      print('-----------------auto run ------------------');
      print(_controller.fullName.first);
    });

    // reaction nós falamos para o mobx qual atributo observavel que queremos observar
    final reactionDiposer = reaction((_) => _controller.counter, (counter) {
      print('-----------------reaction ------------------');
      print(counter);
    });

    final whenDisposer =
        when((_) => _controller.fullName.first == 'Eduardo', () {
      print('-----------------reaction ------------------');
      print(_controller.fullName.first);
    });
    reactionDisposer.add(autorunDisposer);
    reactionDisposer.add(reactionDiposer);
  }

  @override
  void dispose() {
    reactionDisposer.forEach((reaction) => reaction());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(builder: (_) {
              return Text(
                '${_controller.counter}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            Observer(
              builder: (_) {
                return Text(_controller.fullName.first);
              },
            ),
            Observer(
              builder: (_) {
                return Text(_controller.fullName.last);
              },
            ),
            Observer(
              builder: (_) {
                return Text(_controller.saudacao);
              },
            ),
            TextButton(
                onPressed: () => _controller.changeName(),
                child: Text('MudarNome')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
