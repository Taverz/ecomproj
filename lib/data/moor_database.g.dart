// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Clothesobj extends DataClass implements Insertable<Clothesobj> {
  final int id;
  final String size;
  final String color;
  final int price;
  final String nameClothes;
  final String subscribe1;
  final String? subscribe2;
  final String? subscribe3;
  Clothesobj(
      {required this.id,
      required this.size,
      required this.color,
      required this.price,
      required this.nameClothes,
      required this.subscribe1,
      this.subscribe2,
      this.subscribe3});
  factory Clothesobj.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Clothesobj(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      size: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}size'])!,
      color: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
      price: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      nameClothes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_clothes'])!,
      subscribe1: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}subscribe1'])!,
      subscribe2: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}subscribe2']),
      subscribe3: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}subscribe3']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['size'] = Variable<String>(size);
    map['color'] = Variable<String>(color);
    map['price'] = Variable<int>(price);
    map['name_clothes'] = Variable<String>(nameClothes);
    map['subscribe1'] = Variable<String>(subscribe1);
    if (!nullToAbsent || subscribe2 != null) {
      map['subscribe2'] = Variable<String?>(subscribe2);
    }
    if (!nullToAbsent || subscribe3 != null) {
      map['subscribe3'] = Variable<String?>(subscribe3);
    }
    return map;
  }

  ClothesCompanion toCompanion(bool nullToAbsent) {
    return ClothesCompanion(
      id: Value(id),
      size: Value(size),
      color: Value(color),
      price: Value(price),
      nameClothes: Value(nameClothes),
      subscribe1: Value(subscribe1),
      subscribe2: subscribe2 == null && nullToAbsent
          ? const Value.absent()
          : Value(subscribe2),
      subscribe3: subscribe3 == null && nullToAbsent
          ? const Value.absent()
          : Value(subscribe3),
    );
  }

  factory Clothesobj.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Clothesobj(
      id: serializer.fromJson<int>(json['id']),
      size: serializer.fromJson<String>(json['size']),
      color: serializer.fromJson<String>(json['color']),
      price: serializer.fromJson<int>(json['price']),
      nameClothes: serializer.fromJson<String>(json['nameClothes']),
      subscribe1: serializer.fromJson<String>(json['subscribe1']),
      subscribe2: serializer.fromJson<String?>(json['subscribe2']),
      subscribe3: serializer.fromJson<String?>(json['subscribe3']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'size': serializer.toJson<String>(size),
      'color': serializer.toJson<String>(color),
      'price': serializer.toJson<int>(price),
      'nameClothes': serializer.toJson<String>(nameClothes),
      'subscribe1': serializer.toJson<String>(subscribe1),
      'subscribe2': serializer.toJson<String?>(subscribe2),
      'subscribe3': serializer.toJson<String?>(subscribe3),
    };
  }

  Clothesobj copyWith(
          {int? id,
          String? size,
          String? color,
          int? price,
          String? nameClothes,
          String? subscribe1,
          String? subscribe2,
          String? subscribe3}) =>
      Clothesobj(
        id: id ?? this.id,
        size: size ?? this.size,
        color: color ?? this.color,
        price: price ?? this.price,
        nameClothes: nameClothes ?? this.nameClothes,
        subscribe1: subscribe1 ?? this.subscribe1,
        subscribe2: subscribe2 ?? this.subscribe2,
        subscribe3: subscribe3 ?? this.subscribe3,
      );
  @override
  String toString() {
    return (StringBuffer('Clothesobj(')
          ..write('id: $id, ')
          ..write('size: $size, ')
          ..write('color: $color, ')
          ..write('price: $price, ')
          ..write('nameClothes: $nameClothes, ')
          ..write('subscribe1: $subscribe1, ')
          ..write('subscribe2: $subscribe2, ')
          ..write('subscribe3: $subscribe3')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          size.hashCode,
          $mrjc(
              color.hashCode,
              $mrjc(
                  price.hashCode,
                  $mrjc(
                      nameClothes.hashCode,
                      $mrjc(
                          subscribe1.hashCode,
                          $mrjc(
                              subscribe2.hashCode, subscribe3.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Clothesobj &&
          other.id == this.id &&
          other.size == this.size &&
          other.color == this.color &&
          other.price == this.price &&
          other.nameClothes == this.nameClothes &&
          other.subscribe1 == this.subscribe1 &&
          other.subscribe2 == this.subscribe2 &&
          other.subscribe3 == this.subscribe3);
}

class ClothesCompanion extends UpdateCompanion<Clothesobj> {
  final Value<int> id;
  final Value<String> size;
  final Value<String> color;
  final Value<int> price;
  final Value<String> nameClothes;
  final Value<String> subscribe1;
  final Value<String?> subscribe2;
  final Value<String?> subscribe3;
  const ClothesCompanion({
    this.id = const Value.absent(),
    this.size = const Value.absent(),
    this.color = const Value.absent(),
    this.price = const Value.absent(),
    this.nameClothes = const Value.absent(),
    this.subscribe1 = const Value.absent(),
    this.subscribe2 = const Value.absent(),
    this.subscribe3 = const Value.absent(),
  });
  ClothesCompanion.insert({
    this.id = const Value.absent(),
    required String size,
    required String color,
    required int price,
    required String nameClothes,
    required String subscribe1,
    this.subscribe2 = const Value.absent(),
    this.subscribe3 = const Value.absent(),
  })  : size = Value(size),
        color = Value(color),
        price = Value(price),
        nameClothes = Value(nameClothes),
        subscribe1 = Value(subscribe1);
  static Insertable<Clothesobj> custom({
    Expression<int>? id,
    Expression<String>? size,
    Expression<String>? color,
    Expression<int>? price,
    Expression<String>? nameClothes,
    Expression<String>? subscribe1,
    Expression<String?>? subscribe2,
    Expression<String?>? subscribe3,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (size != null) 'size': size,
      if (color != null) 'color': color,
      if (price != null) 'price': price,
      if (nameClothes != null) 'name_clothes': nameClothes,
      if (subscribe1 != null) 'subscribe1': subscribe1,
      if (subscribe2 != null) 'subscribe2': subscribe2,
      if (subscribe3 != null) 'subscribe3': subscribe3,
    });
  }

  ClothesCompanion copyWith(
      {Value<int>? id,
      Value<String>? size,
      Value<String>? color,
      Value<int>? price,
      Value<String>? nameClothes,
      Value<String>? subscribe1,
      Value<String?>? subscribe2,
      Value<String?>? subscribe3}) {
    return ClothesCompanion(
      id: id ?? this.id,
      size: size ?? this.size,
      color: color ?? this.color,
      price: price ?? this.price,
      nameClothes: nameClothes ?? this.nameClothes,
      subscribe1: subscribe1 ?? this.subscribe1,
      subscribe2: subscribe2 ?? this.subscribe2,
      subscribe3: subscribe3 ?? this.subscribe3,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (nameClothes.present) {
      map['name_clothes'] = Variable<String>(nameClothes.value);
    }
    if (subscribe1.present) {
      map['subscribe1'] = Variable<String>(subscribe1.value);
    }
    if (subscribe2.present) {
      map['subscribe2'] = Variable<String?>(subscribe2.value);
    }
    if (subscribe3.present) {
      map['subscribe3'] = Variable<String?>(subscribe3.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClothesCompanion(')
          ..write('id: $id, ')
          ..write('size: $size, ')
          ..write('color: $color, ')
          ..write('price: $price, ')
          ..write('nameClothes: $nameClothes, ')
          ..write('subscribe1: $subscribe1, ')
          ..write('subscribe2: $subscribe2, ')
          ..write('subscribe3: $subscribe3')
          ..write(')'))
        .toString();
  }
}

class $ClothesTable extends Clothes with TableInfo<$ClothesTable, Clothesobj> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ClothesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _sizeMeta = const VerificationMeta('size');
  late final GeneratedColumn<String?> size = GeneratedColumn<String?>(
      'size', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  late final GeneratedColumn<String?> color = GeneratedColumn<String?>(
      'color', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<int?> price = GeneratedColumn<int?>(
      'price', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameClothesMeta =
      const VerificationMeta('nameClothes');
  late final GeneratedColumn<String?> nameClothes = GeneratedColumn<String?>(
      'name_clothes', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _subscribe1Meta = const VerificationMeta('subscribe1');
  late final GeneratedColumn<String?> subscribe1 = GeneratedColumn<String?>(
      'subscribe1', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _subscribe2Meta = const VerificationMeta('subscribe2');
  late final GeneratedColumn<String?> subscribe2 = GeneratedColumn<String?>(
      'subscribe2', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _subscribe3Meta = const VerificationMeta('subscribe3');
  late final GeneratedColumn<String?> subscribe3 = GeneratedColumn<String?>(
      'subscribe3', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, size, color, price, nameClothes, subscribe1, subscribe2, subscribe3];
  @override
  String get aliasedName => _alias ?? 'clothes';
  @override
  String get actualTableName => 'clothes';
  @override
  VerificationContext validateIntegrity(Insertable<Clothesobj> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('size')) {
      context.handle(
          _sizeMeta, size.isAcceptableOrUnknown(data['size']!, _sizeMeta));
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('name_clothes')) {
      context.handle(
          _nameClothesMeta,
          nameClothes.isAcceptableOrUnknown(
              data['name_clothes']!, _nameClothesMeta));
    } else if (isInserting) {
      context.missing(_nameClothesMeta);
    }
    if (data.containsKey('subscribe1')) {
      context.handle(
          _subscribe1Meta,
          subscribe1.isAcceptableOrUnknown(
              data['subscribe1']!, _subscribe1Meta));
    } else if (isInserting) {
      context.missing(_subscribe1Meta);
    }
    if (data.containsKey('subscribe2')) {
      context.handle(
          _subscribe2Meta,
          subscribe2.isAcceptableOrUnknown(
              data['subscribe2']!, _subscribe2Meta));
    }
    if (data.containsKey('subscribe3')) {
      context.handle(
          _subscribe3Meta,
          subscribe3.isAcceptableOrUnknown(
              data['subscribe3']!, _subscribe3Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Clothesobj map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Clothesobj.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ClothesTable createAlias(String alias) {
    return $ClothesTable(_db, alias);
  }
}

class Commentobj extends DataClass implements Insertable<Commentobj> {
  final String author;
  final int id;
  final DateTime? data;
  final String nameClothes;
  Commentobj(
      {required this.author,
      required this.id,
      this.data,
      required this.nameClothes});
  factory Commentobj.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Commentobj(
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data']),
      nameClothes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name_clothes'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['author'] = Variable<String>(author);
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || data != null) {
      map['data'] = Variable<DateTime?>(data);
    }
    map['name_clothes'] = Variable<String>(nameClothes);
    return map;
  }

  CommentCompanion toCompanion(bool nullToAbsent) {
    return CommentCompanion(
      author: Value(author),
      id: Value(id),
      data: data == null && nullToAbsent ? const Value.absent() : Value(data),
      nameClothes: Value(nameClothes),
    );
  }

  factory Commentobj.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Commentobj(
      author: serializer.fromJson<String>(json['author']),
      id: serializer.fromJson<int>(json['id']),
      data: serializer.fromJson<DateTime?>(json['data']),
      nameClothes: serializer.fromJson<String>(json['nameClothes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'author': serializer.toJson<String>(author),
      'id': serializer.toJson<int>(id),
      'data': serializer.toJson<DateTime?>(data),
      'nameClothes': serializer.toJson<String>(nameClothes),
    };
  }

  Commentobj copyWith(
          {String? author, int? id, DateTime? data, String? nameClothes}) =>
      Commentobj(
        author: author ?? this.author,
        id: id ?? this.id,
        data: data ?? this.data,
        nameClothes: nameClothes ?? this.nameClothes,
      );
  @override
  String toString() {
    return (StringBuffer('Commentobj(')
          ..write('author: $author, ')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('nameClothes: $nameClothes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(author.hashCode,
      $mrjc(id.hashCode, $mrjc(data.hashCode, nameClothes.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Commentobj &&
          other.author == this.author &&
          other.id == this.id &&
          other.data == this.data &&
          other.nameClothes == this.nameClothes);
}

class CommentCompanion extends UpdateCompanion<Commentobj> {
  final Value<String> author;
  final Value<int> id;
  final Value<DateTime?> data;
  final Value<String> nameClothes;
  const CommentCompanion({
    this.author = const Value.absent(),
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    this.nameClothes = const Value.absent(),
  });
  CommentCompanion.insert({
    required String author,
    this.id = const Value.absent(),
    this.data = const Value.absent(),
    required String nameClothes,
  })  : author = Value(author),
        nameClothes = Value(nameClothes);
  static Insertable<Commentobj> custom({
    Expression<String>? author,
    Expression<int>? id,
    Expression<DateTime?>? data,
    Expression<String>? nameClothes,
  }) {
    return RawValuesInsertable({
      if (author != null) 'author': author,
      if (id != null) 'id': id,
      if (data != null) 'data': data,
      if (nameClothes != null) 'name_clothes': nameClothes,
    });
  }

  CommentCompanion copyWith(
      {Value<String>? author,
      Value<int>? id,
      Value<DateTime?>? data,
      Value<String>? nameClothes}) {
    return CommentCompanion(
      author: author ?? this.author,
      id: id ?? this.id,
      data: data ?? this.data,
      nameClothes: nameClothes ?? this.nameClothes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime?>(data.value);
    }
    if (nameClothes.present) {
      map['name_clothes'] = Variable<String>(nameClothes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentCompanion(')
          ..write('author: $author, ')
          ..write('id: $id, ')
          ..write('data: $data, ')
          ..write('nameClothes: $nameClothes')
          ..write(')'))
        .toString();
  }
}

class $CommentTable extends Comment with TableInfo<$CommentTable, Commentobj> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CommentTable(this._db, [this._alias]);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _nameClothesMeta =
      const VerificationMeta('nameClothes');
  late final GeneratedColumn<String?> nameClothes = GeneratedColumn<String?>(
      'name_clothes', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [author, id, data, nameClothes];
  @override
  String get aliasedName => _alias ?? 'comment';
  @override
  String get actualTableName => 'comment';
  @override
  VerificationContext validateIntegrity(Insertable<Commentobj> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    }
    if (data.containsKey('name_clothes')) {
      context.handle(
          _nameClothesMeta,
          nameClothes.isAcceptableOrUnknown(
              data['name_clothes']!, _nameClothesMeta));
    } else if (isInserting) {
      context.missing(_nameClothesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Commentobj map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Commentobj.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CommentTable createAlias(String alias) {
    return $CommentTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ClothesTable clothes = $ClothesTable(this);
  late final $CommentTable comment = $CommentTable(this);
  late final CatalogDao catalogDao = CatalogDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [clothes, comment];
}
