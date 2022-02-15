// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_attributes.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAttributes _$ItemAttributesFromJson(Map<String, dynamic> json) =>
    ItemAttributes(
      json['name'] as String,
      json['bought'] as bool,
    );

Map<String, dynamic> _$ItemAttributesToJson(ItemAttributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bought': instance.bought,
    };
