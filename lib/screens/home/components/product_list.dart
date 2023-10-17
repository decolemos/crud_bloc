// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud_bloc/blocs/product_events.dart';
import 'package:flutter/material.dart';

import 'package:crud_bloc/blocs/product_bloc.dart';
import 'package:crud_bloc/models/product.dart';

class ProductList extends StatelessWidget {

  final List<Product> productsList;
  final int index;
  final ProductBloc bloc;

  const ProductList({
    Key? key,
    required this.productsList,
    required this.index,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: ClipRRect(
            child: Text(productsList[index].name.substring(0, 1)),
          ),
        ),
        title: Text(productsList[index].name),
        subtitle: Text("R\$${productsList[index].price.toString()}"),
        trailing: IconButton(
          onPressed: () {
            bloc.add(RemoveProductEvent(product: productsList[index]));
          }, 
          icon: const Icon(Icons.delete),
          color: Colors.red,
        ),
      ),
    );
  }
}
