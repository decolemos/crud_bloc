import 'dart:math';

import 'package:crud_bloc/blocs/product_bloc.dart';
import 'package:crud_bloc/blocs/product_events.dart';
import 'package:crud_bloc/blocs/product_state.dart';
import 'package:crud_bloc/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final ProductBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ProductBloc();
    bloc.add(LoadProductEvent());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  String randomProductName() {
    final rand = Random();
    return [
      "Monitor",
      "Cooler",
      "Gabinete",
      "SSD M2",
    ].elementAt(rand.nextInt(4));
  }

  double randomProductPrice() {
    final rand = Random();
    return [
      100.00,
      350.50,
      120.00,
      449.99
    ].elementAt(rand.nextInt(4));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de produtos"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              bloc.add(AddProductEvent(product: Product(name: randomProductName(), price: randomProductPrice())));
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: bloc,
        builder: (context, state) {
          if(state is ProductInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is ProductSuccessState) {
            final productList = state.products;
            return ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ProductList(
                  productsList: productList,
                  index: index,
                  bloc: bloc,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}