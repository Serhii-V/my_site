import 'package:flutter/material.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<StatefulWidget> createState() => SearchProductScreenState();
}

class SearchProductScreenState extends State<SearchProductScreen> {
  String selectedSubject = 'Овочі-фрукти';

  List<String> subjects = [
    'Овочі-фрукти',
    'Молочна продукція',
    'М\'яо',
    'Хліб',
    'Напої'
  ];

  RangeValues _sliderValues = const RangeValues(20, 200);

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
            const SizedBox(height: 30.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Назва товару для пошуку',
                labelStyle: const TextStyle(color: Colors.white),
                hintText: 'Введіть назву товару для пошуку',
                hintStyle: TextStyle(color: Colors.grey[300]),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30.0),
            DropdownButton<String>(
              value: selectedSubject,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    selectedSubject = newValue;
                  }
                });
              },
              items: subjects.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }).toList(),
              style: const TextStyle(
                color: Colors.red,
              ),
              dropdownColor: Colors.white30,
            ),
            const SizedBox(height: 60.0),
            RangeSlider(
              values: _sliderValues,
              onChanged: (RangeValues values) {
                setState(() {
                  _sliderValues = values;
                });
              },
              labels: RangeLabels(
                _sliderValues.start.toString(),
                _sliderValues.end.toString(),
              ),
              min: 10,
              max: 2000,
              activeColor: Colors.blue, // колір активного діапазону
              inactiveColor: Colors.grey, // колір неактивного діапазону
            ),
            const SizedBox(height: 60.0),
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
