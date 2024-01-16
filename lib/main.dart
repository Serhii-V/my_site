import 'package:flutter/material.dart';
import 'package:my_site/security_constants.dart';

import 'network_information_technologies/network_information_technologies_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  await Parse().initialize(
      SecurityConstants.keyApplicationId, SecurityConstants.keyParseServerUrl,
      clientKey: SecurityConstants.keyClientKey, debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мій Веб-сайт для навчання'),
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const NetworkInformationTechnologiesScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                      elevation: 5.0,
                    ),
                    child: const Text('Мережні інформаційні технології'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Додайте логіку для переходу на іншу сторінку навчальної дисципліни
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black26,
                      elevation: 5.0,
                    ),
                    child: const Text('Навчальна дисципліна 2'),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Студент групи УС-101 Мз Сергій Вовкотруб',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '   Ласкаво просимо на сайт, присвячений результатам моєї самостійної роботи під час навчання за спеціальністю 122 -1 "Інформаційні управляючі системи та технології". Тут ви знайдете детальні звіти, описи проектів та інші матеріали, які відображають мій професійний ріст та здобуті знання.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
