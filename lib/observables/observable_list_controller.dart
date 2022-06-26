import 'package:flu_mobx/model/product_model.dart';
import 'package:mobx/mobx.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase
    with _$ObservableListController;

abstract class ObservableListControllerBase with Store {
  var products = <ProductModel>[];
}
