// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_bloc/models/product.dart';

abstract class ProductState {
  List<Product> products;
  ProductState({
    required this.products,
  });
}

class ProductInitialState extends ProductState {
  ProductInitialState() : super(products: []);
}

class ProductSuccessState extends ProductState {
  ProductSuccessState({required List<Product> products}) : super(products: products);
}

class ProductErrorState extends ProductState {
  String errorMessage;
  ProductErrorState({
    required this.errorMessage, required super.products,
  });
}
