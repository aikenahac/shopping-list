import 'package:json_annotation/json_annotation.dart';

part 'item.model.g.dart';

@JsonSerializable()
class Item {
  final String name;
  final bool bought;

  Item(
    this.name,
    this.bought,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
