import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Product extends Equatable {
  const Product({
    required this.productName,
    required this.supplierId,
    required this.categoryId,
    required this.balance,
    required this.employeeId,
    this.objectId,
  });
  final String? objectId;
  final String productName;
  final String supplierId;
  final String categoryId;
  final String employeeId;
  final int balance;

  factory Product.fromParseObject(ParseObject parseObject) {
    final objectId = parseObject.get('objectId');
    final productName = parseObject.get('productName');
    final supplierId = parseObject.get('supplierId');
    final categoryId = parseObject.get('categoryId');
    final balance = parseObject.get('balance');
    final employeeId = parseObject.get('employeeId');

    return Product(
      objectId: objectId,
      productName: productName,
      supplierId: supplierId,
      categoryId: categoryId,
      balance: balance,
      employeeId: employeeId,
    );
  }

  ParseObject getParseObject() {
    final ParseObject parseProduct = ParseObject('Products');
    parseProduct.set('productName', productName);
    parseProduct.set('balance', balance);
    parseProduct.addRelation(
        'employeeId', [ParseObject('Employees')..set('objectId', employeeId)]);
    parseProduct.addRelation(
        'supplierId', [ParseObject('Suppliers')..set('objectId', supplierId)]);
    parseProduct.addRelation(
        'categoryId', [ParseObject('Categories')..set('objectId', categoryId)]);

    return parseProduct;
  }

  @override
  List<Object> get props => [
        productName,
        supplierId,
        categoryId,
        balance,
        employeeId,
      ];
}
