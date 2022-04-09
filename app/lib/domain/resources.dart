import 'package:json_annotation/json_annotation.dart';

part 'resources.g.dart';

enum ResourceType {
  name,
  fact,
  stepper,
  description,
  image,
}

@JsonSerializable()
class ResourceContainer {
  final ResourceType type;
  final String resource;

  ResourceContainer(this.type, this.resource);

  ResourceContainer.name(String resource) : this(ResourceType.name, resource);

  ResourceContainer.image(String resource) : this(ResourceType.image, resource);
  factory ResourceContainer.fromJson(Map<String, dynamic> json) => _$ResourceContainerFromJson(json);

  /// Connect the generated [_$ResourceContainerToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ResourceContainerToJson(this);
}
