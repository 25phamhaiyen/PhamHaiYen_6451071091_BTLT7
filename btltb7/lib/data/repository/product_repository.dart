import 'package:btltb7/data/models/product,dart';
import 'package:btltb7/data/services/product_service.dart';


class ProductRepository {
  final ProductService service;

  ProductRepository(this.service);

  Future<Product> getProduct() async {
    final data = await service.fetchProduct();
    return Product.fromJson(data);
  }
}
