import 'package:flutter/material.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({Key? key}) : super(key: key);

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Observable List'),
      ),
      body: Column(
        children: [
          Expanded(child: ListView()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: () {}, child: Text('Adicionar')),
              TextButton(onPressed: () {}, child: Text('Remover')),
              TextButton(onPressed: () {}, child: Text('Carregar')),
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
