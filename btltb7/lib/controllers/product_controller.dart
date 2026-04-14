import 'package:btltb7/data/models/product,dart';
import 'package:btltb7/data/repository/product_repository.dart';


class ProductController {
  final ProductRepository repo;

  ProductController(this.repo);

  Future<Product> fetchProduct() {
    return repo.getProduct();
  }
}
