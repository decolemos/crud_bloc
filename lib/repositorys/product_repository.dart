import 'package:crud_bloc/models/product.dart';

class ProductRepository {

  final List<Product> _products = [];

  Future<List<Product>> loadProduct() async {
    await Future.delayed(const Duration(seconds: 2));
    _products.addAll([
      Product(name: "Mouse", price: 100.90),
      Product(name: "Teclado", price: 349.00),
      Product(name: "Placa de video", price: 3999.90),
      Product(name: "Fonte de energia", price: 250.00),
      Product(name: "Placa Mãe", price: 649.99),
    ]);
    return _products;
  }

  List<Product> addProduct(Product product) {
    _products.add(product);
    return _products;
  }

  List<Product> removeProduct(Product product) {
    _products.remove(product);
    return _products;
  }

}