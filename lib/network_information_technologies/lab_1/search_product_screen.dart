import 'package:flutter/material.dart';

class SearchProductScreen extends StatelessWidget {
  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Пошук товару'),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Назва товару для пошуку'),
            ),
            DropdownButton(
              items: [], // додайте власні елементи
              onChanged: (value) {},
            ),
            Slider(
              value: 0,
              onChanged: (value) {},
              min: 0,
              max: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black26,
                elevation: 5.0,
              ),
              onPressed: () {
                // Додайте логіку для обробки натискання кнопки "Пошук"
              },
              child: const Text('Пошук'),
            ),
          ],
        ),
      ),
    );
  }
}
