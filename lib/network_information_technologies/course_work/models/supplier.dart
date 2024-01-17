import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Supplier extends Equatable {
  const Supplier({
    required this.objectId,
    required this.supplierName,
    required this.phoneNumber,
    required this.contactPerson,
  });
  final String objectId;
  final String supplierName;
  final String phoneNumber;
  final String contactPerson;

  factory Supplier.fromParseObject(ParseObject parseObject) {
    final objectId = parseObject.get('objectId');
    final supplierName = parseObject.get('supplierName');
    final phoneNumber = parseObject.get('phoneNumber');
    final contactPerson = parseObject.get('contactPerson');
    return Supplier(
      objectId: objectId,
      supplierName: supplierName,
      phoneNumber: phoneNumber,
      contactPerson: contactPerson,
    );
  }

  @override
  List<Object> get props => [
        objectId,
        supplierName,
        phoneNumber,
        contactPerson,
      ];
}
