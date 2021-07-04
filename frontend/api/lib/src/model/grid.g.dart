// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Grid extends Grid {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? power;
  @override
  final bool? online;

  factory _$Grid([void Function(GridBuilder)? updates]) =>
      (new GridBuilder()..update(updates)).build();

  _$Grid._({this.id, this.name, this.power, this.online}) : super._();

  @override
  Grid rebuild(void Function(GridBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GridBuilder toBuilder() => new GridBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Grid &&
        id == other.id &&
        name == other.name &&
        power == other.power &&
        online == other.online;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), name.hashCode), power.hashCode),
        online.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Grid')
          ..add('id', id)
          ..add('name', name)
          ..add('power', power)
          ..add('online', online))
        .toString();
  }
}

class GridBuilder implements Builder<Grid, GridBuilder> {
  _$Grid? _$v;

  int? _id;

  int? get id => _$this._id;

  set id(int? id) => _$this._id = id;

  String? _name;

  String? get name => _$this._name;

  set name(String? name) => _$this._name = name;

  int? _power;

  int? get power => _$this._power;

  set power(int? power) => _$this._power = power;

  bool? _online;

  bool? get online => _$this._online;

  set online(bool? online) => _$this._online = online;

  GridBuilder() {
    Grid._initializeBuilder(this);
  }

  GridBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _power = $v.power;
      _online = $v.online;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Grid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Grid;
  }

  @override
  void update(void Function(GridBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Grid build() {
    final _$result =
        _$v ?? new _$Grid._(id: id, name: name, power: power, online: online);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
