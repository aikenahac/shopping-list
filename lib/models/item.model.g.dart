// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['name'] as String,
      json['bought'] as bool,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.name,
      'bought': instance.bought,
    };
