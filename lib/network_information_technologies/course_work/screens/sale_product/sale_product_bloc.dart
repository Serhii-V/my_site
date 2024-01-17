import 'dart:async';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/supplier.dart';
import '../../models/categories.dart';
import '../../models/employee.dart';
import '../../models/product.dart';

class SaleProductState {
  SaleProductState(
    this.categories,
    this.suppliers,
    this.employees,
    this.products,
  );
  final List<Categories> categories;
  final List<Supplier> suppliers;
  final List<Employee> employees;
  final List<Product> products;
}

class SaleProductBloc {
  BehaviorSubject<SaleProductState> blocState =
      BehaviorSubject<SaleProductState>();

  Future<void> init() async {
    final categories = await getCategories();
    final suppliers = await getSuppliers();
    final employees = await getEmployees();
    final products = await getProducts();
    final state = SaleProductState(
      categories.map((e) => Categories.fromParseObject(e)).toList(),
      suppliers.map((e) => Supplier.fromParseObject(e)).toList(),
      employees.map((e) => Employee.fromParseObject(e)).toList(),
      products.map((e) => Product.fromParseObject(e)).toList(),
    );
    blocState.add(state);
  }

  Future<void> addProductInToDB(Product product) async {
    final parseProduct = product.getAddProductParseObject();
    parseProduct.save();
  }

  Future<List<ParseObject>> getCategories() async {
    QueryBuilder<ParseObject> queryCategories =
        QueryBuilder<ParseObject>(ParseObject('Categories'));
    final ParseResponse apiResponse = await queryCategories.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<ParseObject>> getProducts() async {
    QueryBuilder<ParseObject> queryCategories =
        QueryBuilder<ParseObject>(ParseObject('Products'));
    final ParseResponse apiResponse = await queryCategories.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<ParseObject>> getEmployees() async {
    QueryBuilder<ParseObject> queryEmployees =
        QueryBuilder<ParseObject>(ParseObject('Employees'));
    final ParseResponse apiResponse = await queryEmployees.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<List<ParseObject>> getSuppliers() async {
    QueryBuilder<ParseObject> querySuppliers =
        QueryBuilder<ParseObject>(ParseObject('Suppliers'));
    final ParseResponse apiResponse = await querySuppliers.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  Future<void> submitProduct({
    required String productName,
    required int quantity,
    required String deliveredBy,
    required String receivedBy,
  }) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
