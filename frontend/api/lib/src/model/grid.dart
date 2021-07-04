//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'grid.g.dart';

abstract class Grid implements Built<Grid, GridBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'power')
  int? get power;

  @BuiltValueField(wireName: r'online')
  bool? get online;

  Grid._();

  static void _initializeBuilder(GridBuilder b) => b;

  factory Grid([void updates(GridBuilder b)]) = _$Grid;

  @BuiltValueSerializer(custom: true)
  static Serializer<Grid> get serializer => _$GridSerializer();
}

class _$GridSerializer implements StructuredSerializer<Grid> {
  @override
  final Iterable<Type> types = const [Grid, _$Grid];

  @override
  final String wireName = r'Grid';

  @override
  Iterable<Object?> serialize(Serializers serializers, Grid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    if (object.id != null) {
      result
        ..add(r'id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add(r'name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.power != null) {
      result
        ..add(r'power')
        ..add(serializers.serialize(object.power,
            specifiedType: const FullType(int)));
    }
    if (object.online != null) {
      result
        ..add(r'online')
        ..add(serializers.serialize(object.online,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  Grid deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GridBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case r'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case r'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case r'power':
          result.power = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case r'online':
          result.online = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }
    return result.build();
  }
}
