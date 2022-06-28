import 'package:flu_mobx/modelo_observable/modelo_observable_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ModeloObservablePage extends StatefulWidget {
  const ModeloObservablePage({Key? key}) : super(key: key);

  @override
  State<ModeloObservablePage> createState() => _ModeloObservablePageState();
}

class _ModeloObservablePageState extends State<ModeloObservablePage> {
  final _controller = ModeloObservableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable Modelo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: _controller.products.length,
                  itemBuilder: (context, index) {
                    final productStore = _controller.products[index];
                    return Observer(
                      builder: (_) {
                        return CheckboxListTile(
                          value: productStore.selected,
                          onChanged: (_) {
                            _controller.selectedProduct(index);
                          },
                          title: Text(productStore.product.name),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    _controller.addProduct();
                  },
                  child: Text('Adicionar')),
              TextButton(
                  onPressed: () {
                    _controller.removeProduct();
                  },
                  child: Text('Remover')),
              TextButton(
                  onPressed: () {
                    _controller.loadProducts();
                  },
                  child: Text('Carregar')),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
