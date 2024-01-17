import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Employee extends Equatable {
  const Employee({
    required this.objectId,
    required this.employeeName,
    required this.phoneNumber,
  });
  final String objectId;
  final String employeeName;
  final String phoneNumber;

  factory Employee.fromParseObject(ParseObject parseObject) {
    final objectId = parseObject.get('objectId');
    final employeeName = parseObject.get('employeeName');
    final phoneNumber = parseObject.get('phoneNumber');
    return Employee(
      objectId: objectId,
      employeeName: employeeName,
      phoneNumber: phoneNumber,
    );
  }

  @override
  List<Object> get props => [objectId, employeeName, phoneNumber];
}
