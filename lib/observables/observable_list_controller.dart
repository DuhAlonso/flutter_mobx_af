import 'package:flu_mobx/model/product_model.dart';
import 'package:mobx/mobx.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase
    with _$ObservableListController;

abstract class ObservableListControllerBase with Store {
  @observable
  // ObservableList products = ObservableList();
  // ! Também pode ser desse jeito
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
