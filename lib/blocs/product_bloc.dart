import 'package:bloc/bloc.dart';
import 'package:crud_bloc/blocs/product_events.dart';
import 'package:crud_bloc/blocs/product_state.dart';
import 'package:crud_bloc/repositorys/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final _productRepository = ProductRepository();

  ProductBloc() : super(ProductInitialState()) {
    on<LoadProductEvent>(
      (event, emit) async {
        emit(ProductSuccessState(products: await _productRepository.loadProduct()));
      }
    );
    on<AddProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(products: _productRepository.addProduct(event.product))
      )
    );
    on<RemoveProductEvent>(
      (event, emit) => emit(
        ProductSuccessState(products: _productRepository.removeProduct(event.product))
      )
    );
  }
}