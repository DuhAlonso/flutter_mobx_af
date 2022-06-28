import 'package:flu_mobx/model/product_model.dart';
import 'package:mobx/mobx.dart';
part 'modelo_observable_controller.g.dart';

class ModeloObservableController = ModeloObservableControllerBase
    with _$ModeloObservableController;

abstract class ModeloObservableControllerBase with Store {
  // ObservableList products = ObservableList();
// ! Também pode ser desse jeito

  @observable
  var products = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Mouse'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Celular'),
      ProductModel(name: 'WebCam'),
    ];
    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(ProductModel(name: 'Computador'));
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }
}
