import 'package:flu_mobx/model/product_model.dart';
import 'package:flu_mobx/modelo_observable/model/product_store.dart';
import 'package:mobx/mobx.dart';
part 'modelo_observable_controller.g.dart';

class ModeloObservableController = ModeloObservableControllerBase
    with _$ModeloObservableController;

abstract class ModeloObservableControllerBase with Store {
  // ObservableList products = ObservableList();
// ! Também pode ser desse jeito

  @observable
  var products = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductStore(product: ProductModel(name: 'Computador'), selected: false),
      ProductStore(product: ProductModel(name: 'Mouse'), selected: false),
      ProductStore(product: ProductModel(name: 'Teclado'), selected: false),
      ProductStore(product: ProductModel(name: 'Celular'), selected: false),
      ProductStore(product: ProductModel(name: 'WebCam'), selected: false),
    ];
    products.addAll(productsData);
  }

  @action
  void addProduct() {
    products.add(ProductStore(
        product: ProductModel(name: 'Computador'), selected: false));
  }

  @action
  void removeProduct() {
    products.removeAt(0);
  }

  @action
  void selectedProduct(int index) {
    var productSelected = products[index].selected;
    products[index].selected = !productSelected;
  }
}
