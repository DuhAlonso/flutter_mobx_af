import 'package:flu_mobx/contador/contador_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContadorPage extends StatelessWidget {
  final _controller = ContadorController();

  ContadorPage({Key? key}) : super(key: key);

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
            )
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
