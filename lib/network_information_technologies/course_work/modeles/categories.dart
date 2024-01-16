import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Categories extends Equatable {
  const Categories({required this.objectId, required this.categoriesName});
  final String objectId;
  final String categoriesName;

  factory Categories.fromParseObject(ParseObject parseObject) {
    final objectId = parseObject.get('objectId');
    final categoriesName = parseObject.get('CategoriesName');
    return Categories(objectId: objectId, categoriesName: categoriesName);
  }

  @override
  List<Object> get props => [objectId, categoriesName];
}

