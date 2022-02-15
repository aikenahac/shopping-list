import 'package:json_annotation/json_annotation.dart';
import 'package:shopping_list/models/item_attributes.model.dart';

part 'item.model.g.dart';

@JsonSerializable()
// Custom type for JSON serialization
class Item {
  final int id;
  final ItemAttributes attributes;

  Item(
    this.id,
    this.attributes,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
