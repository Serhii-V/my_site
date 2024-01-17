import 'package:flutter/material.dart';
import '../course_work/screens/inventory_product/inventory_product_screen.dart';
import '../course_work/screens/add_product/add_product_bloc.dart';
import '../course_work/screens/inventory_product/inventory_product_bloc.dart';
import '../course_work/screens/sale_product/sale_product_bloc.dart';
import '../course_work/screens/sale_product/sale_product_screen.dart';

import 'screens/add_product/add_product_screen.dart';

class CourseWorkMainScreen extends StatefulWidget {
  const CourseWorkMainScreen({super.key});

  @override
  State<StatefulWidget> createState() => CourseWorkMainScreenState();
}

class CourseWorkMainScreenState extends State<CourseWorkMainScreen> {
  final AddProductBloc addProductBloc = AddProductBloc();
  final SaleProductBloc saleProductBloc = SaleProductBloc();
  final InventoryProductBloc inventoryProductBloc = InventoryProductBloc();


  @override
  void initState() {
    addProductBloc.init();
    saleProductBloc.init();
    inventoryProductBloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('КУРСОВА РОБОТА'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey.shade800, Colors.blueGrey.shade600],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  elevation: 5.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddProductScreen(
                              bloc: addProductBloc,
                            )),
                  );
                },
                child: const Text('Додати товар'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  elevation: 5.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SaleProductScreen(
                              bloc: saleProductBloc,
                            )),
                  );
                },
                child: const Text('Видача товару'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  elevation: 5.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  InventoryProductScreen(bloc: inventoryProductBloc,)),
                  );
                },
                child: const Text('Залишок товару'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
