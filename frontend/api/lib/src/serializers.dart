//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';
import 'package:openapi/src/model/error_message.dart';
import 'package:openapi/src/model/grid.dart';

part 'serializers.g.dart';

@SerializersFor([
  ErrorMessage,
  Grid,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Grid)]),
        () => ListBuilder<Grid>(),
      )
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
