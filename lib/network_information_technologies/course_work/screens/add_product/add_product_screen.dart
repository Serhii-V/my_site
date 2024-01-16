import 'package:flutter/material.dart';
import 'package:my_site/network_information_technologies/course_work/modeles/employee.dart';
import 'package:my_site/network_information_technologies/course_work/modeles/product.dart';
import 'package:my_site/network_information_technologies/course_work/modeles/supplier.dart';

import '../../modeles/categories.dart';
import 'add_product_bloc.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key, required this.bloc});

  final AddProductBloc bloc;

  @override
  State<StatefulWidget> createState() => AddProductScreenState();
}

class AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  late Categories selectedCategory;
  late Supplier selectedDeliveredBy;
  late Employee selectedReceivedBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('На цій сторінці можна додати продукт '),
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
        child: StreamBuilder<AddProductState>(
            stream: widget.bloc.blocState,
            builder: (context, snapshot) {
              final state = snapshot.data;
              if (state != null) {
                selectedCategory = state.categories.first;
                selectedReceivedBy = state.employees.first;
                selectedDeliveredBy = state.suppliers.first;
              }
              return state != null
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButtonFormField(
                                dropdownColor: Colors.grey,
                                value: selectedCategory,
                                onChanged: (value) {
                                  selectedCategory = value as Categories;
                                },
                                items: state.categories.map((category) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Text(
                                      category.categoriesName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                    labelText: 'Виберіть категорію продукту'),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: productNameController,
                                decoration: InputDecoration(
                                  labelText: 'Назва продукту',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.grey[300]),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: quantityController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Введіть кількість одиниць',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.grey[300]),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField(
                                dropdownColor: Colors.grey,
                                value: selectedDeliveredBy,
                                onChanged: (value) {
                                  selectedDeliveredBy = value as Supplier;
                                },
                                items: state.suppliers.map((person) {
                                  return DropdownMenuItem(
                                    value: person,
                                    child: Text(
                                      '${person.supplierName} ${person.contactPerson} ${person.phoneNumber}.',
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                    labelText: 'Виберіть постачальника'),
                              ),
                              const SizedBox(height: 8),
                              DropdownButtonFormField(
                                dropdownColor: Colors.grey,
                                value: selectedReceivedBy,
                                onChanged: (value) {
                                  selectedReceivedBy = value as Employee;
                                },
                                items: state.employees.map((person) {
                                  return DropdownMenuItem(
                                    value: person,
                                    child: Text(
                                      person.employeeName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                    labelText: 'Received By'),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  widget.bloc.addProductInToDB(Product(
                                      productName: productNameController.text,
                                      supplierId: selectedDeliveredBy.objectId,
                                      categoryId: selectedCategory.objectId,
                                      employeeId: selectedReceivedBy.objectId,
                                      balance:
                                          int.parse(quantityController.text)));
                                  Navigator.pop(context);
                                },
                                child: const Text('Додати'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
