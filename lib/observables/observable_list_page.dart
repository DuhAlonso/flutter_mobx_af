import 'package:flu_mobx/observables/observable_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({Key? key}) : super(key: key);

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  final _controller = ObservableListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemCount: _controller.products.length,
                  itemBuilder: (context, index) {
                    final productName = _controller.products[index].name;
                    return CheckboxListTile(
                      value: false,
                      onChanged: (_) {},
                      title: Text(productName),
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
