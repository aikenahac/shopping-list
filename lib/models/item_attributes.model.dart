import 'package:json_annotation/json_annotation.dart';

part 'item_attributes.model.g.dart';

@JsonSerializable()
// Custom type for JSON serialization
class ItemAttributes {
  final String name;
  final bool bought;

  ItemAttributes(
    this.name,
    this.bought,
  );

  factory ItemAttributes.fromJson(Map<String, dynamic> json) => _$ItemAttributesFromJson(json);
  Map<String, dynamic> toJson() => _$ItemAttributesToJson(this);
}
