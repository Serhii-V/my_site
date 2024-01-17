import 'dart:async';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:rxdart/rxdart.dart';
import '../../models/supplier.dart';
import '../../models/categories.dart';
import '../../models/employee.dart';
import '../../models/product.dart';

class AddProductState {
  AddProductState(this.categories, this.suppliers, this.employees);
  final List<Categories> categories;
  final List<Supplier> suppliers;
  final List<Employee> employees;
}

class AddProductBloc {
  BehaviorSubject<AddProductState> blocState =
      BehaviorSubject<AddProductState>();

  Future<void> init() async {
    final categories = await getCategories();
    final suppliers = await getSuppliers();
    final employees = await getEmployees();
    blocState.add(
      AddProductState(
          categories.map((e) => Categories.fromParseObject(e)).toList(),
          suppliers.map((e) => Supplier.fromParseObject(e)).toList(),
          employees.map((e) => Employee.fromParseObject(e)).toList()),
    );
  }

  Future<void> addProductInToDB(Product product) async {
    final parseProduct = product.getAddProductParseObject();
    final ParseResponse response = await parseProduct.save();
    if (response.success) {
      final parseObject = response.result;
      final String objectId = parseObject.get('objectId');
      final parseTransaction = product.getTransactionParseObject(objectId);
      await parseTransaction.save();
    }
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
}
