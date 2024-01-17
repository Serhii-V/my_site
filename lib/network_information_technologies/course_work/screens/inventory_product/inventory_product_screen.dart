import 'package:flutter/material.dart';
import 'inventory_product_bloc.dart';

class InventoryProductScreen extends StatefulWidget {
  const InventoryProductScreen({super.key, required this.bloc});

  final InventoryProductBloc bloc;

  @override
  State<InventoryProductScreen> createState() => _InventoryProductScreenState();
}

class _InventoryProductScreenState extends State<InventoryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Додати товар'),
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
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Назва товару',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'Введіть назву товару',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Ціна',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Введіть ціну',
                    hintStyle: TextStyle(color: Colors.grey[300]),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Кількість',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'Введіть кількість',
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       'Вжити до:  ${"${selectedDate.toLocal()}".split(' ')[0]}',
                //       style: const TextStyle(color: Colors.white),
                //     ),
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.black26,
                //         elevation: 5.0,
                //       ),
                //       onPressed: () => _selectDate(context),
                //       child: const Text(
                //         'Виберіть дату',
                //         style: TextStyle(color: Colors.white),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 20.0),
                // CheckboxListTile(
                //   activeColor: Colors.white12,
                //   title: const Text(
                //     'Зберігається  холодильнику?',
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: Colors.white,
                //     ),
                //   ),
                //   value: isNeedCold,
                //   onChanged: (value) {
                //     setState(() {
                //       isNeedCold = !isNeedCold;
                //     });
                //   },
                // ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black26,
                    elevation: 5.0,
                  ),
                  onPressed: () {
                    // Додайте логіку для обробки натискання кнопки "Додати"
                  },
                  child: const Text('Додати'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
