// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_bloc/models/product.dart';

abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  Product product;
  AddProductEvent({
    required this.product,
  });
}

class RemoveProductEvent extends ProductEvent {
  Product product;
  RemoveProductEvent({
    required this.product,
  });
}
