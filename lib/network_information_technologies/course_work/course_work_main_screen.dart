import 'package:flutter/material.dart';
import 'package:my_site/network_information_technologies/course_work/screens/add_product/add_product_bloc.dart';

import 'screens/add_product/add_product_screen.dart';

class CourseWorkMainScreen extends StatelessWidget {
  const CourseWorkMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProductBloc bloc = AddProductBloc();
    bloc.init();
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
                              bloc: bloc,
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SearchProductScreen()),
                  // );
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SearchProductScreen()),
                  // );
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
