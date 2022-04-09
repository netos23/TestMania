// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceContainer _$ResourceContainerFromJson(Map<String, dynamic> json) =>
    ResourceContainer(
      $enumDecode(_$ResourceTypeEnumMap, json['type']),
      json['resource'] as String,
    );

Map<String, dynamic> _$ResourceContainerToJson(ResourceContainer instance) =>
    <String, dynamic>{
      'type': _$ResourceTypeEnumMap[instance.type],
      'resource': instance.resource,
    };

const _$ResourceTypeEnumMap = {
  ResourceType.name: 'name',
  ResourceType.fact: 'fact',
  ResourceType.stepper: 'stepper',
  ResourceType.description: 'description',
  ResourceType.image: 'image',
};
