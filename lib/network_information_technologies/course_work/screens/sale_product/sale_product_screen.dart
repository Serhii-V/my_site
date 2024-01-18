import 'package:flutter/material.dart';
import 'package:my_site/network_information_technologies/course_work/screens/sale_product/sale_product_bloc.dart';

import '../../models/product.dart';

class SaleProductScreen extends StatefulWidget {
  const SaleProductScreen({super.key, required this.bloc});

  final SaleProductBloc bloc;

  @override
  State<SaleProductScreen> createState() => _SaleProductScreenState();
}

class _SaleProductScreenState extends State<SaleProductScreen> {
  bool isCartView = false;
  List<Product> products = [];
  final List<Product> selectedProducts = [];

  @override
  void initState() {
    widget.bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Text(isCartView ? "Обрані продукти" : "Список продуктів"),
          actions: [
            IconButton(
              icon: Icon(isCartView ? Icons.list : Icons.shopping_cart),
              onPressed: () {
                setState(() {
                  isCartView = !isCartView;
                });
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey.shade800, Colors.blueGrey.shade600],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: isCartView ? buildCartView() : buildProductListView(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Додати'),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }

  Widget buildProductListView() {
    return StreamBuilder<SaleProductState>(
        stream: widget.bloc.blocState,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const SizedBox.shrink();
          }
          final products = snapshot.data!.products;
          return ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 5,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final currentProduct = products[index];
              final selected = selectedProducts.contains(currentProduct);
              return Card(
                child: ListTile(
                  onTap: () {
                    setState(() {
                      if (selected) {
                        selectedProducts.remove(currentProduct);
                      } else {
                        selectedProducts.add(currentProduct);
                      }
                    });
                  },
                  title: Text(currentProduct.productName),
                  tileColor: selected ? Colors.purple : Colors.white,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                      ),
                      Text(currentProduct.balance.toString()),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  Widget buildCartView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(products[index].toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                const Text("1"),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
