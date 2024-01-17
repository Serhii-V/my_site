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
    final balance = parseObject.get('balance');
    final employeeId = parseObject.get('employeeId');
    final supplierId = parseObject.get('supplierId');
    final categoryId = parseObject.get('categoryId');

    return Product(
      objectId: objectId,
      productName: productName,
      supplierId: supplierId,
      categoryId: categoryId,
      balance: balance,
      employeeId: employeeId,
    );
  }

  ParseObject getAddProductParseObject() {
    final ParseObject parseProduct = ParseObject('Products');
    parseProduct.set('productName', productName);
    parseProduct.set('balance', balance);
    parseProduct.set('employeeId', employeeId);
    parseProduct.set('supplierId', supplierId);
    parseProduct.set('categoryId', categoryId);

    return parseProduct;
  }

  ParseObject getTransactionParseObject(String productId) {
    final dateTime = DateTime.now();
    final ParseObject parseProduct = ParseObject('Transactions');
    parseProduct.addRelation(
        'employeeId', [ParseObject('Employees')..set('objectId', employeeId)]);
    parseProduct.addRelation(
        'productId', [ParseObject('Products')..set('objectId', productId)]);
    parseProduct.set('amount', balance);
    parseProduct.set('transactionType', 'receiving');
    parseProduct.set('transactionDate', dateTime);
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
