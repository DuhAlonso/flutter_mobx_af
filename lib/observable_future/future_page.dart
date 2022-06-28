import 'package:flu_mobx/observable_future/future_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({Key? key}) : super(key: key);

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  final _controller = FutureController();

  @override
  void initState() {
    _controller.buscarNome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.buscarNome();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Observer(
        builder: (_) {
          return FutureBuilder<String>(
            future: _controller.nome,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const SizedBox.shrink();
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return Center(
                      child: Text(snapshot.data!),
                    );
                  }
                  return const Center(
                    child: Text('Nome não encontrado'),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
