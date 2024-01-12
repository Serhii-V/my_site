import 'package:flutter/material.dart';

import 'lab_1/lab_1.dart';

class NetworkInformationTechnologiesScreen extends StatelessWidget {
  const NetworkInformationTechnologiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мережні інформаційні технології'),
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
                    MaterialPageRoute(builder: (context) => const Lab1Screen()),
                  );
                },
                child: const Text('Лабораторна робота № 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
