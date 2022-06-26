import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flu_mobx/imc/imc_controller.dart';
import 'package:flu_mobx/imc/widgets/imc_gauges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({Key? key}) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final TextEditingController pesoEC = TextEditingController();
  final TextEditingController alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _controller = ImcController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    final reactionError =
        reaction<bool>((_) => _controller.hasError, (hasError) {
      if (hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(_controller.error ?? 'Erro!!')));
      }
    });
    super.initState();

    reactionDisposer.add(reactionError);
  }

  @override
  void dispose() {
    reactionDisposer.forEach((disposer) => disposer());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC com MobX'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Observer(
                  builder: (_) {
                    return ImcGauges(
                      imc: _controller.imc,
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      child: _controller.imc == 0.0
                          ? const Text('')
                          : Text(
                              'Seu IMC é de ${_controller.imc.toStringAsFixed(2)}'),
                    );
                  },
                ),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'PESO obrigatório!';
                    }
                  },
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  decoration: InputDecoration(
                    labelText: 'PESO',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'ALTURA obrigatório!';
                    }
                  },
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'pt_BR',
                      symbol: '',
                      decimalDigits: 2,
                      turnOffGrouping: true,
                    )
                  ],
                  decoration: InputDecoration(
                    labelText: 'Altura',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var formValid = formKey.currentState?.validate() ?? false;

                    if (formValid) {
                      var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR', decimalDigits: 2);
                      double peso = formatter.parse(pesoEC.text) as double;
                      double altura = formatter.parse(alturaEC.text) as double;
                      _controller.calculateImc(peso: peso, altura: altura);
                    }
                  },
                  child: const Text(
                    'Calcular IMC',
                    style: TextStyle(fontSize: 17),
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
