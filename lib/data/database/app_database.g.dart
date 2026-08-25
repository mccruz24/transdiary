// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RegimensTable extends Regimens
    with TableInfo<$RegimensTable, RegimenRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegimensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customCategoryMeta = const VerificationMeta(
    'customCategory',
  );
  @override
  late final GeneratedColumn<String> customCategory = GeneratedColumn<String>(
    'custom_category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _medicationNameMeta = const VerificationMeta(
    'medicationName',
  );
  @override
  late final GeneratedColumn<String> medicationName = GeneratedColumn<String>(
    'medication_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseAmountMeta = const VerificationMeta(
    'doseAmount',
  );
  @override
  late final GeneratedColumn<double> doseAmount = GeneratedColumn<double>(
    'dose_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doseUnitMeta = const VerificationMeta(
    'doseUnit',
  );
  @override
  late final GeneratedColumn<String> doseUnit = GeneratedColumn<String>(
    'dose_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
    'route',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customRouteMeta = const VerificationMeta(
    'customRoute',
  );
  @override
  late final GeneratedColumn<String> customRoute = GeneratedColumn<String>(
    'custom_route',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    customCategory,
    medicationName,
    doseAmount,
    doseUnit,
    route,
    customRoute,
    startDate,
    notes,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'regimens';
  @override
  VerificationContext validateIntegrity(
    Insertable<RegimenRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('custom_category')) {
      context.handle(
        _customCategoryMeta,
        customCategory.isAcceptableOrUnknown(
          data['custom_category']!,
          _customCategoryMeta,
        ),
      );
    }
    if (data.containsKey('medication_name')) {
      context.handle(
        _medicationNameMeta,
        medicationName.isAcceptableOrUnknown(
          data['medication_name']!,
          _medicationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_medicationNameMeta);
    }
    if (data.containsKey('dose_amount')) {
      context.handle(
        _doseAmountMeta,
        doseAmount.isAcceptableOrUnknown(data['dose_amount']!, _doseAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_doseAmountMeta);
    }
    if (data.containsKey('dose_unit')) {
      context.handle(
        _doseUnitMeta,
        doseUnit.isAcceptableOrUnknown(data['dose_unit']!, _doseUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_doseUnitMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
        _routeMeta,
        route.isAcceptableOrUnknown(data['route']!, _routeMeta),
      );
    } else if (isInserting) {
      context.missing(_routeMeta);
    }
    if (data.containsKey('custom_route')) {
      context.handle(
        _customRouteMeta,
        customRoute.isAcceptableOrUnknown(
          data['custom_route']!,
          _customRouteMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegimenRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegimenRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      customCategory: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_category'],
      ),
      medicationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}medication_name'],
      )!,
      doseAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}dose_amount'],
      )!,
      doseUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dose_unit'],
      )!,
      route: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}route'],
      )!,
      customRoute: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_route'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RegimensTable createAlias(String alias) {
    return $RegimensTable(attachedDatabase, alias);
  }
}

class RegimenRow extends DataClass implements Insertable<RegimenRow> {
  final String id;
  final String category;
  final String? customCategory;
  final String medicationName;
  final double doseAmount;
  final String doseUnit;
  final String route;
  final String? customRoute;
  final DateTime startDate;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RegimenRow({
    required this.id,
    required this.category,
    this.customCategory,
    required this.medicationName,
    required this.doseAmount,
    required this.doseUnit,
    required this.route,
    this.customRoute,
    required this.startDate,
    this.notes,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || customCategory != null) {
      map['custom_category'] = Variable<String>(customCategory);
    }
    map['medication_name'] = Variable<String>(medicationName);
    map['dose_amount'] = Variable<double>(doseAmount);
    map['dose_unit'] = Variable<String>(doseUnit);
    map['route'] = Variable<String>(route);
    if (!nullToAbsent || customRoute != null) {
      map['custom_route'] = Variable<String>(customRoute);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RegimensCompanion toCompanion(bool nullToAbsent) {
    return RegimensCompanion(
      id: Value(id),
      category: Value(category),
      customCategory: customCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(customCategory),
      medicationName: Value(medicationName),
      doseAmount: Value(doseAmount),
      doseUnit: Value(doseUnit),
      route: Value(route),
      customRoute: customRoute == null && nullToAbsent
          ? const Value.absent()
          : Value(customRoute),
      startDate: Value(startDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RegimenRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegimenRow(
      id: serializer.fromJson<String>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      customCategory: serializer.fromJson<String?>(json['customCategory']),
      medicationName: serializer.fromJson<String>(json['medicationName']),
      doseAmount: serializer.fromJson<double>(json['doseAmount']),
      doseUnit: serializer.fromJson<String>(json['doseUnit']),
      route: serializer.fromJson<String>(json['route']),
      customRoute: serializer.fromJson<String?>(json['customRoute']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'category': serializer.toJson<String>(category),
      'customCategory': serializer.toJson<String?>(customCategory),
      'medicationName': serializer.toJson<String>(medicationName),
      'doseAmount': serializer.toJson<double>(doseAmount),
      'doseUnit': serializer.toJson<String>(doseUnit),
      'route': serializer.toJson<String>(route),
      'customRoute': serializer.toJson<String?>(customRoute),
      'startDate': serializer.toJson<DateTime>(startDate),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RegimenRow copyWith({
    String? id,
    String? category,
    Value<String?> customCategory = const Value.absent(),
    String? medicationName,
    double? doseAmount,
    String? doseUnit,
    String? route,
    Value<String?> customRoute = const Value.absent(),
    DateTime? startDate,
    Value<String?> notes = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => RegimenRow(
    id: id ?? this.id,
    category: category ?? this.category,
    customCategory: customCategory.present
        ? customCategory.value
        : this.customCategory,
    medicationName: medicationName ?? this.medicationName,
    doseAmount: doseAmount ?? this.doseAmount,
    doseUnit: doseUnit ?? this.doseUnit,
    route: route ?? this.route,
    customRoute: customRoute.present ? customRoute.value : this.customRoute,
    startDate: startDate ?? this.startDate,
    notes: notes.present ? notes.value : this.notes,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  RegimenRow copyWithCompanion(RegimensCompanion data) {
    return RegimenRow(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      customCategory: data.customCategory.present
          ? data.customCategory.value
          : this.customCategory,
      medicationName: data.medicationName.present
          ? data.medicationName.value
          : this.medicationName,
      doseAmount: data.doseAmount.present
          ? data.doseAmount.value
          : this.doseAmount,
      doseUnit: data.doseUnit.present ? data.doseUnit.value : this.doseUnit,
      route: data.route.present ? data.route.value : this.route,
      customRoute: data.customRoute.present
          ? data.customRoute.value
          : this.customRoute,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegimenRow(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('customCategory: $customCategory, ')
          ..write('medicationName: $medicationName, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('doseUnit: $doseUnit, ')
          ..write('route: $route, ')
          ..write('customRoute: $customRoute, ')
          ..write('startDate: $startDate, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    category,
    customCategory,
    medicationName,
    doseAmount,
    doseUnit,
    route,
    customRoute,
    startDate,
    notes,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegimenRow &&
          other.id == this.id &&
          other.category == this.category &&
          other.customCategory == this.customCategory &&
          other.medicationName == this.medicationName &&
          other.doseAmount == this.doseAmount &&
          other.doseUnit == this.doseUnit &&
          other.route == this.route &&
          other.customRoute == this.customRoute &&
          other.startDate == this.startDate &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RegimensCompanion extends UpdateCompanion<RegimenRow> {
  final Value<String> id;
  final Value<String> category;
  final Value<String?> customCategory;
  final Value<String> medicationName;
  final Value<double> doseAmount;
  final Value<String> doseUnit;
  final Value<String> route;
  final Value<String?> customRoute;
  final Value<DateTime> startDate;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RegimensCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.customCategory = const Value.absent(),
    this.medicationName = const Value.absent(),
    this.doseAmount = const Value.absent(),
    this.doseUnit = const Value.absent(),
    this.route = const Value.absent(),
    this.customRoute = const Value.absent(),
    this.startDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RegimensCompanion.insert({
    required String id,
    required String category,
    this.customCategory = const Value.absent(),
    required String medicationName,
    required double doseAmount,
    required String doseUnit,
    required String route,
    this.customRoute = const Value.absent(),
    required DateTime startDate,
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       category = Value(category),
       medicationName = Value(medicationName),
       doseAmount = Value(doseAmount),
       doseUnit = Value(doseUnit),
       route = Value(route),
       startDate = Value(startDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<RegimenRow> custom({
    Expression<String>? id,
    Expression<String>? category,
    Expression<String>? customCategory,
    Expression<String>? medicationName,
    Expression<double>? doseAmount,
    Expression<String>? doseUnit,
    Expression<String>? route,
    Expression<String>? customRoute,
    Expression<DateTime>? startDate,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (customCategory != null) 'custom_category': customCategory,
      if (medicationName != null) 'medication_name': medicationName,
      if (doseAmount != null) 'dose_amount': doseAmount,
      if (doseUnit != null) 'dose_unit': doseUnit,
      if (route != null) 'route': route,
      if (customRoute != null) 'custom_route': customRoute,
      if (startDate != null) 'start_date': startDate,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RegimensCompanion copyWith({
    Value<String>? id,
    Value<String>? category,
    Value<String?>? customCategory,
    Value<String>? medicationName,
    Value<double>? doseAmount,
    Value<String>? doseUnit,
    Value<String>? route,
    Value<String?>? customRoute,
    Value<DateTime>? startDate,
    Value<String?>? notes,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RegimensCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      customCategory: customCategory ?? this.customCategory,
      medicationName: medicationName ?? this.medicationName,
      doseAmount: doseAmount ?? this.doseAmount,
      doseUnit: doseUnit ?? this.doseUnit,
      route: route ?? this.route,
      customRoute: customRoute ?? this.customRoute,
      startDate: startDate ?? this.startDate,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (customCategory.present) {
      map['custom_category'] = Variable<String>(customCategory.value);
    }
    if (medicationName.present) {
      map['medication_name'] = Variable<String>(medicationName.value);
    }
    if (doseAmount.present) {
      map['dose_amount'] = Variable<double>(doseAmount.value);
    }
    if (doseUnit.present) {
      map['dose_unit'] = Variable<String>(doseUnit.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (customRoute.present) {
      map['custom_route'] = Variable<String>(customRoute.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegimensCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('customCategory: $customCategory, ')
          ..write('medicationName: $medicationName, ')
          ..write('doseAmount: $doseAmount, ')
          ..write('doseUnit: $doseUnit, ')
          ..write('route: $route, ')
          ..write('customRoute: $customRoute, ')
          ..write('startDate: $startDate, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RemindersTable extends Reminders
    with TableInfo<$RemindersTable, ReminderRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemindersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regimenIdMeta = const VerificationMeta(
    'regimenId',
  );
  @override
  late final GeneratedColumn<String> regimenId = GeneratedColumn<String>(
    'regimen_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES regimens (id)',
    ),
  );
  static const VerificationMeta _timeOfDayMinutesMeta = const VerificationMeta(
    'timeOfDayMinutes',
  );
  @override
  late final GeneratedColumn<int> timeOfDayMinutes = GeneratedColumn<int>(
    'time_of_day_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scheduleTypeMeta = const VerificationMeta(
    'scheduleType',
  );
  @override
  late final GeneratedColumn<String> scheduleType = GeneratedColumn<String>(
    'schedule_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weekdayValuesMeta = const VerificationMeta(
    'weekdayValues',
  );
  @override
  late final GeneratedColumn<String> weekdayValues = GeneratedColumn<String>(
    'weekday_values',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _monthDayValuesMeta = const VerificationMeta(
    'monthDayValues',
  );
  @override
  late final GeneratedColumn<String> monthDayValues = GeneratedColumn<String>(
    'month_day_values',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _intervalDaysMeta = const VerificationMeta(
    'intervalDays',
  );
  @override
  late final GeneratedColumn<int> intervalDays = GeneratedColumn<int>(
    'interval_days',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isEnabledMeta = const VerificationMeta(
    'isEnabled',
  );
  @override
  late final GeneratedColumn<bool> isEnabled = GeneratedColumn<bool>(
    'is_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notificationPrivacyModeMeta =
      const VerificationMeta('notificationPrivacyMode');
  @override
  late final GeneratedColumn<String> notificationPrivacyMode =
      GeneratedColumn<String>(
        'notification_privacy_mode',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('discreet'),
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    regimenId,
    timeOfDayMinutes,
    scheduleType,
    weekdayValues,
    monthDayValues,
    intervalDays,
    isEnabled,
    notificationPrivacyMode,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminders';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReminderRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('regimen_id')) {
      context.handle(
        _regimenIdMeta,
        regimenId.isAcceptableOrUnknown(data['regimen_id']!, _regimenIdMeta),
      );
    } else if (isInserting) {
      context.missing(_regimenIdMeta);
    }
    if (data.containsKey('time_of_day_minutes')) {
      context.handle(
        _timeOfDayMinutesMeta,
        timeOfDayMinutes.isAcceptableOrUnknown(
          data['time_of_day_minutes']!,
          _timeOfDayMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timeOfDayMinutesMeta);
    }
    if (data.containsKey('schedule_type')) {
      context.handle(
        _scheduleTypeMeta,
        scheduleType.isAcceptableOrUnknown(
          data['schedule_type']!,
          _scheduleTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduleTypeMeta);
    }
    if (data.containsKey('weekday_values')) {
      context.handle(
        _weekdayValuesMeta,
        weekdayValues.isAcceptableOrUnknown(
          data['weekday_values']!,
          _weekdayValuesMeta,
        ),
      );
    }
    if (data.containsKey('month_day_values')) {
      context.handle(
        _monthDayValuesMeta,
        monthDayValues.isAcceptableOrUnknown(
          data['month_day_values']!,
          _monthDayValuesMeta,
        ),
      );
    }
    if (data.containsKey('interval_days')) {
      context.handle(
        _intervalDaysMeta,
        intervalDays.isAcceptableOrUnknown(
          data['interval_days']!,
          _intervalDaysMeta,
        ),
      );
    }
    if (data.containsKey('is_enabled')) {
      context.handle(
        _isEnabledMeta,
        isEnabled.isAcceptableOrUnknown(data['is_enabled']!, _isEnabledMeta),
      );
    }
    if (data.containsKey('notification_privacy_mode')) {
      context.handle(
        _notificationPrivacyModeMeta,
        notificationPrivacyMode.isAcceptableOrUnknown(
          data['notification_privacy_mode']!,
          _notificationPrivacyModeMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      regimenId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}regimen_id'],
      )!,
      timeOfDayMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time_of_day_minutes'],
      )!,
      scheduleType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}schedule_type'],
      )!,
      weekdayValues: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}weekday_values'],
      )!,
      monthDayValues: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}month_day_values'],
      )!,
      intervalDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval_days'],
      ),
      isEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_enabled'],
      )!,
      notificationPrivacyMode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notification_privacy_mode'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $RemindersTable createAlias(String alias) {
    return $RemindersTable(attachedDatabase, alias);
  }
}

class ReminderRow extends DataClass implements Insertable<ReminderRow> {
  final String id;
  final String regimenId;
  final int timeOfDayMinutes;
  final String scheduleType;
  final String weekdayValues;
  final String monthDayValues;
  final int? intervalDays;
  final bool isEnabled;
  final String notificationPrivacyMode;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ReminderRow({
    required this.id,
    required this.regimenId,
    required this.timeOfDayMinutes,
    required this.scheduleType,
    required this.weekdayValues,
    required this.monthDayValues,
    this.intervalDays,
    required this.isEnabled,
    required this.notificationPrivacyMode,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['regimen_id'] = Variable<String>(regimenId);
    map['time_of_day_minutes'] = Variable<int>(timeOfDayMinutes);
    map['schedule_type'] = Variable<String>(scheduleType);
    map['weekday_values'] = Variable<String>(weekdayValues);
    map['month_day_values'] = Variable<String>(monthDayValues);
    if (!nullToAbsent || intervalDays != null) {
      map['interval_days'] = Variable<int>(intervalDays);
    }
    map['is_enabled'] = Variable<bool>(isEnabled);
    map['notification_privacy_mode'] = Variable<String>(
      notificationPrivacyMode,
    );
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RemindersCompanion toCompanion(bool nullToAbsent) {
    return RemindersCompanion(
      id: Value(id),
      regimenId: Value(regimenId),
      timeOfDayMinutes: Value(timeOfDayMinutes),
      scheduleType: Value(scheduleType),
      weekdayValues: Value(weekdayValues),
      monthDayValues: Value(monthDayValues),
      intervalDays: intervalDays == null && nullToAbsent
          ? const Value.absent()
          : Value(intervalDays),
      isEnabled: Value(isEnabled),
      notificationPrivacyMode: Value(notificationPrivacyMode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ReminderRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderRow(
      id: serializer.fromJson<String>(json['id']),
      regimenId: serializer.fromJson<String>(json['regimenId']),
      timeOfDayMinutes: serializer.fromJson<int>(json['timeOfDayMinutes']),
      scheduleType: serializer.fromJson<String>(json['scheduleType']),
      weekdayValues: serializer.fromJson<String>(json['weekdayValues']),
      monthDayValues: serializer.fromJson<String>(json['monthDayValues']),
      intervalDays: serializer.fromJson<int?>(json['intervalDays']),
      isEnabled: serializer.fromJson<bool>(json['isEnabled']),
      notificationPrivacyMode: serializer.fromJson<String>(
        json['notificationPrivacyMode'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'regimenId': serializer.toJson<String>(regimenId),
      'timeOfDayMinutes': serializer.toJson<int>(timeOfDayMinutes),
      'scheduleType': serializer.toJson<String>(scheduleType),
      'weekdayValues': serializer.toJson<String>(weekdayValues),
      'monthDayValues': serializer.toJson<String>(monthDayValues),
      'intervalDays': serializer.toJson<int?>(intervalDays),
      'isEnabled': serializer.toJson<bool>(isEnabled),
      'notificationPrivacyMode': serializer.toJson<String>(
        notificationPrivacyMode,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ReminderRow copyWith({
    String? id,
    String? regimenId,
    int? timeOfDayMinutes,
    String? scheduleType,
    String? weekdayValues,
    String? monthDayValues,
    Value<int?> intervalDays = const Value.absent(),
    bool? isEnabled,
    String? notificationPrivacyMode,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => ReminderRow(
    id: id ?? this.id,
    regimenId: regimenId ?? this.regimenId,
    timeOfDayMinutes: timeOfDayMinutes ?? this.timeOfDayMinutes,
    scheduleType: scheduleType ?? this.scheduleType,
    weekdayValues: weekdayValues ?? this.weekdayValues,
    monthDayValues: monthDayValues ?? this.monthDayValues,
    intervalDays: intervalDays.present ? intervalDays.value : this.intervalDays,
    isEnabled: isEnabled ?? this.isEnabled,
    notificationPrivacyMode:
        notificationPrivacyMode ?? this.notificationPrivacyMode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ReminderRow copyWithCompanion(RemindersCompanion data) {
    return ReminderRow(
      id: data.id.present ? data.id.value : this.id,
      regimenId: data.regimenId.present ? data.regimenId.value : this.regimenId,
      timeOfDayMinutes: data.timeOfDayMinutes.present
          ? data.timeOfDayMinutes.value
          : this.timeOfDayMinutes,
      scheduleType: data.scheduleType.present
          ? data.scheduleType.value
          : this.scheduleType,
      weekdayValues: data.weekdayValues.present
          ? data.weekdayValues.value
          : this.weekdayValues,
      monthDayValues: data.monthDayValues.present
          ? data.monthDayValues.value
          : this.monthDayValues,
      intervalDays: data.intervalDays.present
          ? data.intervalDays.value
          : this.intervalDays,
      isEnabled: data.isEnabled.present ? data.isEnabled.value : this.isEnabled,
      notificationPrivacyMode: data.notificationPrivacyMode.present
          ? data.notificationPrivacyMode.value
          : this.notificationPrivacyMode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderRow(')
          ..write('id: $id, ')
          ..write('regimenId: $regimenId, ')
          ..write('timeOfDayMinutes: $timeOfDayMinutes, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('weekdayValues: $weekdayValues, ')
          ..write('monthDayValues: $monthDayValues, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('notificationPrivacyMode: $notificationPrivacyMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    regimenId,
    timeOfDayMinutes,
    scheduleType,
    weekdayValues,
    monthDayValues,
    intervalDays,
    isEnabled,
    notificationPrivacyMode,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderRow &&
          other.id == this.id &&
          other.regimenId == this.regimenId &&
          other.timeOfDayMinutes == this.timeOfDayMinutes &&
          other.scheduleType == this.scheduleType &&
          other.weekdayValues == this.weekdayValues &&
          other.monthDayValues == this.monthDayValues &&
          other.intervalDays == this.intervalDays &&
          other.isEnabled == this.isEnabled &&
          other.notificationPrivacyMode == this.notificationPrivacyMode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RemindersCompanion extends UpdateCompanion<ReminderRow> {
  final Value<String> id;
  final Value<String> regimenId;
  final Value<int> timeOfDayMinutes;
  final Value<String> scheduleType;
  final Value<String> weekdayValues;
  final Value<String> monthDayValues;
  final Value<int?> intervalDays;
  final Value<bool> isEnabled;
  final Value<String> notificationPrivacyMode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RemindersCompanion({
    this.id = const Value.absent(),
    this.regimenId = const Value.absent(),
    this.timeOfDayMinutes = const Value.absent(),
    this.scheduleType = const Value.absent(),
    this.weekdayValues = const Value.absent(),
    this.monthDayValues = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.notificationPrivacyMode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RemindersCompanion.insert({
    required String id,
    required String regimenId,
    required int timeOfDayMinutes,
    required String scheduleType,
    this.weekdayValues = const Value.absent(),
    this.monthDayValues = const Value.absent(),
    this.intervalDays = const Value.absent(),
    this.isEnabled = const Value.absent(),
    this.notificationPrivacyMode = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       regimenId = Value(regimenId),
       timeOfDayMinutes = Value(timeOfDayMinutes),
       scheduleType = Value(scheduleType),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ReminderRow> custom({
    Expression<String>? id,
    Expression<String>? regimenId,
    Expression<int>? timeOfDayMinutes,
    Expression<String>? scheduleType,
    Expression<String>? weekdayValues,
    Expression<String>? monthDayValues,
    Expression<int>? intervalDays,
    Expression<bool>? isEnabled,
    Expression<String>? notificationPrivacyMode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (regimenId != null) 'regimen_id': regimenId,
      if (timeOfDayMinutes != null) 'time_of_day_minutes': timeOfDayMinutes,
      if (scheduleType != null) 'schedule_type': scheduleType,
      if (weekdayValues != null) 'weekday_values': weekdayValues,
      if (monthDayValues != null) 'month_day_values': monthDayValues,
      if (intervalDays != null) 'interval_days': intervalDays,
      if (isEnabled != null) 'is_enabled': isEnabled,
      if (notificationPrivacyMode != null)
        'notification_privacy_mode': notificationPrivacyMode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RemindersCompanion copyWith({
    Value<String>? id,
    Value<String>? regimenId,
    Value<int>? timeOfDayMinutes,
    Value<String>? scheduleType,
    Value<String>? weekdayValues,
    Value<String>? monthDayValues,
    Value<int?>? intervalDays,
    Value<bool>? isEnabled,
    Value<String>? notificationPrivacyMode,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return RemindersCompanion(
      id: id ?? this.id,
      regimenId: regimenId ?? this.regimenId,
      timeOfDayMinutes: timeOfDayMinutes ?? this.timeOfDayMinutes,
      scheduleType: scheduleType ?? this.scheduleType,
      weekdayValues: weekdayValues ?? this.weekdayValues,
      monthDayValues: monthDayValues ?? this.monthDayValues,
      intervalDays: intervalDays ?? this.intervalDays,
      isEnabled: isEnabled ?? this.isEnabled,
      notificationPrivacyMode:
          notificationPrivacyMode ?? this.notificationPrivacyMode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (regimenId.present) {
      map['regimen_id'] = Variable<String>(regimenId.value);
    }
    if (timeOfDayMinutes.present) {
      map['time_of_day_minutes'] = Variable<int>(timeOfDayMinutes.value);
    }
    if (scheduleType.present) {
      map['schedule_type'] = Variable<String>(scheduleType.value);
    }
    if (weekdayValues.present) {
      map['weekday_values'] = Variable<String>(weekdayValues.value);
    }
    if (monthDayValues.present) {
      map['month_day_values'] = Variable<String>(monthDayValues.value);
    }
    if (intervalDays.present) {
      map['interval_days'] = Variable<int>(intervalDays.value);
    }
    if (isEnabled.present) {
      map['is_enabled'] = Variable<bool>(isEnabled.value);
    }
    if (notificationPrivacyMode.present) {
      map['notification_privacy_mode'] = Variable<String>(
        notificationPrivacyMode.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemindersCompanion(')
          ..write('id: $id, ')
          ..write('regimenId: $regimenId, ')
          ..write('timeOfDayMinutes: $timeOfDayMinutes, ')
          ..write('scheduleType: $scheduleType, ')
          ..write('weekdayValues: $weekdayValues, ')
          ..write('monthDayValues: $monthDayValues, ')
          ..write('intervalDays: $intervalDays, ')
          ..write('isEnabled: $isEnabled, ')
          ..write('notificationPrivacyMode: $notificationPrivacyMode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoseLogsTable extends DoseLogs
    with TableInfo<$DoseLogsTable, DoseLogRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoseLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regimenIdMeta = const VerificationMeta(
    'regimenId',
  );
  @override
  late final GeneratedColumn<String> regimenId = GeneratedColumn<String>(
    'regimen_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES regimens (id)',
    ),
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<DateTime> scheduledAt = GeneratedColumn<DateTime>(
    'scheduled_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
    'taken_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    regimenId,
    scheduledAt,
    takenAt,
    status,
    notes,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dose_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoseLogRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('regimen_id')) {
      context.handle(
        _regimenIdMeta,
        regimenId.isAcceptableOrUnknown(data['regimen_id']!, _regimenIdMeta),
      );
    } else if (isInserting) {
      context.missing(_regimenIdMeta);
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_scheduledAtMeta);
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DoseLogRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoseLogRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      regimenId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}regimen_id'],
      )!,
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}scheduled_at'],
      )!,
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}taken_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DoseLogsTable createAlias(String alias) {
    return $DoseLogsTable(attachedDatabase, alias);
  }
}

class DoseLogRow extends DataClass implements Insertable<DoseLogRow> {
  final String id;
  final String regimenId;
  final DateTime scheduledAt;
  final DateTime? takenAt;
  final String status;
  final String? notes;
  final DateTime createdAt;
  const DoseLogRow({
    required this.id,
    required this.regimenId,
    required this.scheduledAt,
    this.takenAt,
    required this.status,
    this.notes,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['regimen_id'] = Variable<String>(regimenId);
    map['scheduled_at'] = Variable<DateTime>(scheduledAt);
    if (!nullToAbsent || takenAt != null) {
      map['taken_at'] = Variable<DateTime>(takenAt);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DoseLogsCompanion toCompanion(bool nullToAbsent) {
    return DoseLogsCompanion(
      id: Value(id),
      regimenId: Value(regimenId),
      scheduledAt: Value(scheduledAt),
      takenAt: takenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(takenAt),
      status: Value(status),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory DoseLogRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoseLogRow(
      id: serializer.fromJson<String>(json['id']),
      regimenId: serializer.fromJson<String>(json['regimenId']),
      scheduledAt: serializer.fromJson<DateTime>(json['scheduledAt']),
      takenAt: serializer.fromJson<DateTime?>(json['takenAt']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'regimenId': serializer.toJson<String>(regimenId),
      'scheduledAt': serializer.toJson<DateTime>(scheduledAt),
      'takenAt': serializer.toJson<DateTime?>(takenAt),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DoseLogRow copyWith({
    String? id,
    String? regimenId,
    DateTime? scheduledAt,
    Value<DateTime?> takenAt = const Value.absent(),
    String? status,
    Value<String?> notes = const Value.absent(),
    DateTime? createdAt,
  }) => DoseLogRow(
    id: id ?? this.id,
    regimenId: regimenId ?? this.regimenId,
    scheduledAt: scheduledAt ?? this.scheduledAt,
    takenAt: takenAt.present ? takenAt.value : this.takenAt,
    status: status ?? this.status,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  DoseLogRow copyWithCompanion(DoseLogsCompanion data) {
    return DoseLogRow(
      id: data.id.present ? data.id.value : this.id,
      regimenId: data.regimenId.present ? data.regimenId.value : this.regimenId,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoseLogRow(')
          ..write('id: $id, ')
          ..write('regimenId: $regimenId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('takenAt: $takenAt, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    regimenId,
    scheduledAt,
    takenAt,
    status,
    notes,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoseLogRow &&
          other.id == this.id &&
          other.regimenId == this.regimenId &&
          other.scheduledAt == this.scheduledAt &&
          other.takenAt == this.takenAt &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class DoseLogsCompanion extends UpdateCompanion<DoseLogRow> {
  final Value<String> id;
  final Value<String> regimenId;
  final Value<DateTime> scheduledAt;
  final Value<DateTime?> takenAt;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DoseLogsCompanion({
    this.id = const Value.absent(),
    this.regimenId = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.takenAt = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoseLogsCompanion.insert({
    required String id,
    required String regimenId,
    required DateTime scheduledAt,
    this.takenAt = const Value.absent(),
    required String status,
    this.notes = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       regimenId = Value(regimenId),
       scheduledAt = Value(scheduledAt),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<DoseLogRow> custom({
    Expression<String>? id,
    Expression<String>? regimenId,
    Expression<DateTime>? scheduledAt,
    Expression<DateTime>? takenAt,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (regimenId != null) 'regimen_id': regimenId,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (takenAt != null) 'taken_at': takenAt,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoseLogsCompanion copyWith({
    Value<String>? id,
    Value<String>? regimenId,
    Value<DateTime>? scheduledAt,
    Value<DateTime?>? takenAt,
    Value<String>? status,
    Value<String?>? notes,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DoseLogsCompanion(
      id: id ?? this.id,
      regimenId: regimenId ?? this.regimenId,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      takenAt: takenAt ?? this.takenAt,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (regimenId.present) {
      map['regimen_id'] = Variable<String>(regimenId.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<DateTime>(scheduledAt.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoseLogsCompanion(')
          ..write('id: $id, ')
          ..write('regimenId: $regimenId, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('takenAt: $takenAt, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotoEntriesTable extends PhotoEntries
    with TableInfo<$PhotoEntriesTable, PhotoEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _photoLocalPathMeta = const VerificationMeta(
    'photoLocalPath',
  );
  @override
  late final GeneratedColumn<String> photoLocalPath = GeneratedColumn<String>(
    'photo_local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hrtStartDateReferenceMeta =
      const VerificationMeta('hrtStartDateReference');
  @override
  late final GeneratedColumn<DateTime> hrtStartDateReference =
      GeneratedColumn<DateTime>(
        'hrt_start_date_reference',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _journeyDayNumberMeta = const VerificationMeta(
    'journeyDayNumber',
  );
  @override
  late final GeneratedColumn<int> journeyDayNumber = GeneratedColumn<int>(
    'journey_day_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    photoLocalPath,
    date,
    hrtStartDateReference,
    journeyDayNumber,
    caption,
    tags,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('photo_local_path')) {
      context.handle(
        _photoLocalPathMeta,
        photoLocalPath.isAcceptableOrUnknown(
          data['photo_local_path']!,
          _photoLocalPathMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_photoLocalPathMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('hrt_start_date_reference')) {
      context.handle(
        _hrtStartDateReferenceMeta,
        hrtStartDateReference.isAcceptableOrUnknown(
          data['hrt_start_date_reference']!,
          _hrtStartDateReferenceMeta,
        ),
      );
    }
    if (data.containsKey('journey_day_number')) {
      context.handle(
        _journeyDayNumberMeta,
        journeyDayNumber.isAcceptableOrUnknown(
          data['journey_day_number']!,
          _journeyDayNumberMeta,
        ),
      );
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      photoLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_local_path'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      hrtStartDateReference: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}hrt_start_date_reference'],
      ),
      journeyDayNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}journey_day_number'],
      ),
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PhotoEntriesTable createAlias(String alias) {
    return $PhotoEntriesTable(attachedDatabase, alias);
  }
}

class PhotoEntryRow extends DataClass implements Insertable<PhotoEntryRow> {
  final String id;
  final String photoLocalPath;
  final DateTime date;
  final DateTime? hrtStartDateReference;
  final int? journeyDayNumber;
  final String? caption;
  final String tags;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PhotoEntryRow({
    required this.id,
    required this.photoLocalPath,
    required this.date,
    this.hrtStartDateReference,
    this.journeyDayNumber,
    this.caption,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['photo_local_path'] = Variable<String>(photoLocalPath);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || hrtStartDateReference != null) {
      map['hrt_start_date_reference'] = Variable<DateTime>(
        hrtStartDateReference,
      );
    }
    if (!nullToAbsent || journeyDayNumber != null) {
      map['journey_day_number'] = Variable<int>(journeyDayNumber);
    }
    if (!nullToAbsent || caption != null) {
      map['caption'] = Variable<String>(caption);
    }
    map['tags'] = Variable<String>(tags);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PhotoEntriesCompanion toCompanion(bool nullToAbsent) {
    return PhotoEntriesCompanion(
      id: Value(id),
      photoLocalPath: Value(photoLocalPath),
      date: Value(date),
      hrtStartDateReference: hrtStartDateReference == null && nullToAbsent
          ? const Value.absent()
          : Value(hrtStartDateReference),
      journeyDayNumber: journeyDayNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(journeyDayNumber),
      caption: caption == null && nullToAbsent
          ? const Value.absent()
          : Value(caption),
      tags: Value(tags),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PhotoEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoEntryRow(
      id: serializer.fromJson<String>(json['id']),
      photoLocalPath: serializer.fromJson<String>(json['photoLocalPath']),
      date: serializer.fromJson<DateTime>(json['date']),
      hrtStartDateReference: serializer.fromJson<DateTime?>(
        json['hrtStartDateReference'],
      ),
      journeyDayNumber: serializer.fromJson<int?>(json['journeyDayNumber']),
      caption: serializer.fromJson<String?>(json['caption']),
      tags: serializer.fromJson<String>(json['tags']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'photoLocalPath': serializer.toJson<String>(photoLocalPath),
      'date': serializer.toJson<DateTime>(date),
      'hrtStartDateReference': serializer.toJson<DateTime?>(
        hrtStartDateReference,
      ),
      'journeyDayNumber': serializer.toJson<int?>(journeyDayNumber),
      'caption': serializer.toJson<String?>(caption),
      'tags': serializer.toJson<String>(tags),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PhotoEntryRow copyWith({
    String? id,
    String? photoLocalPath,
    DateTime? date,
    Value<DateTime?> hrtStartDateReference = const Value.absent(),
    Value<int?> journeyDayNumber = const Value.absent(),
    Value<String?> caption = const Value.absent(),
    String? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PhotoEntryRow(
    id: id ?? this.id,
    photoLocalPath: photoLocalPath ?? this.photoLocalPath,
    date: date ?? this.date,
    hrtStartDateReference: hrtStartDateReference.present
        ? hrtStartDateReference.value
        : this.hrtStartDateReference,
    journeyDayNumber: journeyDayNumber.present
        ? journeyDayNumber.value
        : this.journeyDayNumber,
    caption: caption.present ? caption.value : this.caption,
    tags: tags ?? this.tags,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PhotoEntryRow copyWithCompanion(PhotoEntriesCompanion data) {
    return PhotoEntryRow(
      id: data.id.present ? data.id.value : this.id,
      photoLocalPath: data.photoLocalPath.present
          ? data.photoLocalPath.value
          : this.photoLocalPath,
      date: data.date.present ? data.date.value : this.date,
      hrtStartDateReference: data.hrtStartDateReference.present
          ? data.hrtStartDateReference.value
          : this.hrtStartDateReference,
      journeyDayNumber: data.journeyDayNumber.present
          ? data.journeyDayNumber.value
          : this.journeyDayNumber,
      caption: data.caption.present ? data.caption.value : this.caption,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoEntryRow(')
          ..write('id: $id, ')
          ..write('photoLocalPath: $photoLocalPath, ')
          ..write('date: $date, ')
          ..write('hrtStartDateReference: $hrtStartDateReference, ')
          ..write('journeyDayNumber: $journeyDayNumber, ')
          ..write('caption: $caption, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    photoLocalPath,
    date,
    hrtStartDateReference,
    journeyDayNumber,
    caption,
    tags,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoEntryRow &&
          other.id == this.id &&
          other.photoLocalPath == this.photoLocalPath &&
          other.date == this.date &&
          other.hrtStartDateReference == this.hrtStartDateReference &&
          other.journeyDayNumber == this.journeyDayNumber &&
          other.caption == this.caption &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PhotoEntriesCompanion extends UpdateCompanion<PhotoEntryRow> {
  final Value<String> id;
  final Value<String> photoLocalPath;
  final Value<DateTime> date;
  final Value<DateTime?> hrtStartDateReference;
  final Value<int?> journeyDayNumber;
  final Value<String?> caption;
  final Value<String> tags;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PhotoEntriesCompanion({
    this.id = const Value.absent(),
    this.photoLocalPath = const Value.absent(),
    this.date = const Value.absent(),
    this.hrtStartDateReference = const Value.absent(),
    this.journeyDayNumber = const Value.absent(),
    this.caption = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotoEntriesCompanion.insert({
    required String id,
    required String photoLocalPath,
    required DateTime date,
    this.hrtStartDateReference = const Value.absent(),
    this.journeyDayNumber = const Value.absent(),
    this.caption = const Value.absent(),
    this.tags = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       photoLocalPath = Value(photoLocalPath),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<PhotoEntryRow> custom({
    Expression<String>? id,
    Expression<String>? photoLocalPath,
    Expression<DateTime>? date,
    Expression<DateTime>? hrtStartDateReference,
    Expression<int>? journeyDayNumber,
    Expression<String>? caption,
    Expression<String>? tags,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (photoLocalPath != null) 'photo_local_path': photoLocalPath,
      if (date != null) 'date': date,
      if (hrtStartDateReference != null)
        'hrt_start_date_reference': hrtStartDateReference,
      if (journeyDayNumber != null) 'journey_day_number': journeyDayNumber,
      if (caption != null) 'caption': caption,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotoEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? photoLocalPath,
    Value<DateTime>? date,
    Value<DateTime?>? hrtStartDateReference,
    Value<int?>? journeyDayNumber,
    Value<String?>? caption,
    Value<String>? tags,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return PhotoEntriesCompanion(
      id: id ?? this.id,
      photoLocalPath: photoLocalPath ?? this.photoLocalPath,
      date: date ?? this.date,
      hrtStartDateReference:
          hrtStartDateReference ?? this.hrtStartDateReference,
      journeyDayNumber: journeyDayNumber ?? this.journeyDayNumber,
      caption: caption ?? this.caption,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (photoLocalPath.present) {
      map['photo_local_path'] = Variable<String>(photoLocalPath.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (hrtStartDateReference.present) {
      map['hrt_start_date_reference'] = Variable<DateTime>(
        hrtStartDateReference.value,
      );
    }
    if (journeyDayNumber.present) {
      map['journey_day_number'] = Variable<int>(journeyDayNumber.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoEntriesCompanion(')
          ..write('id: $id, ')
          ..write('photoLocalPath: $photoLocalPath, ')
          ..write('date: $date, ')
          ..write('hrtStartDateReference: $hrtStartDateReference, ')
          ..write('journeyDayNumber: $journeyDayNumber, ')
          ..write('caption: $caption, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiaryEntriesTable extends DiaryEntries
    with TableInfo<$DiaryEntriesTable, DiaryEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodScoreMeta = const VerificationMeta(
    'moodScore',
  );
  @override
  late final GeneratedColumn<int> moodScore = GeneratedColumn<int>(
    'mood_score',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    moodScore,
    tags,
    body,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiaryEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('mood_score')) {
      context.handle(
        _moodScoreMeta,
        moodScore.isAcceptableOrUnknown(data['mood_score']!, _moodScoreMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      moodScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood_score'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DiaryEntriesTable createAlias(String alias) {
    return $DiaryEntriesTable(attachedDatabase, alias);
  }
}

class DiaryEntryRow extends DataClass implements Insertable<DiaryEntryRow> {
  final String id;
  final DateTime date;
  final int? moodScore;
  final String tags;
  final String? body;
  final DateTime createdAt;
  final DateTime updatedAt;
  const DiaryEntryRow({
    required this.id,
    required this.date,
    this.moodScore,
    required this.tags,
    this.body,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || moodScore != null) {
      map['mood_score'] = Variable<int>(moodScore);
    }
    map['tags'] = Variable<String>(tags);
    if (!nullToAbsent || body != null) {
      map['body'] = Variable<String>(body);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DiaryEntriesCompanion toCompanion(bool nullToAbsent) {
    return DiaryEntriesCompanion(
      id: Value(id),
      date: Value(date),
      moodScore: moodScore == null && nullToAbsent
          ? const Value.absent()
          : Value(moodScore),
      tags: Value(tags),
      body: body == null && nullToAbsent ? const Value.absent() : Value(body),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DiaryEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryEntryRow(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      moodScore: serializer.fromJson<int?>(json['moodScore']),
      tags: serializer.fromJson<String>(json['tags']),
      body: serializer.fromJson<String?>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'moodScore': serializer.toJson<int?>(moodScore),
      'tags': serializer.toJson<String>(tags),
      'body': serializer.toJson<String?>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DiaryEntryRow copyWith({
    String? id,
    DateTime? date,
    Value<int?> moodScore = const Value.absent(),
    String? tags,
    Value<String?> body = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => DiaryEntryRow(
    id: id ?? this.id,
    date: date ?? this.date,
    moodScore: moodScore.present ? moodScore.value : this.moodScore,
    tags: tags ?? this.tags,
    body: body.present ? body.value : this.body,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DiaryEntryRow copyWithCompanion(DiaryEntriesCompanion data) {
    return DiaryEntryRow(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      moodScore: data.moodScore.present ? data.moodScore.value : this.moodScore,
      tags: data.tags.present ? data.tags.value : this.tags,
      body: data.body.present ? data.body.value : this.body,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntryRow(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('moodScore: $moodScore, ')
          ..write('tags: $tags, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, date, moodScore, tags, body, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryEntryRow &&
          other.id == this.id &&
          other.date == this.date &&
          other.moodScore == this.moodScore &&
          other.tags == this.tags &&
          other.body == this.body &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DiaryEntriesCompanion extends UpdateCompanion<DiaryEntryRow> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<int?> moodScore;
  final Value<String> tags;
  final Value<String?> body;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const DiaryEntriesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.moodScore = const Value.absent(),
    this.tags = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiaryEntriesCompanion.insert({
    required String id,
    required DateTime date,
    this.moodScore = const Value.absent(),
    this.tags = const Value.absent(),
    this.body = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<DiaryEntryRow> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<int>? moodScore,
    Expression<String>? tags,
    Expression<String>? body,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (moodScore != null) 'mood_score': moodScore,
      if (tags != null) 'tags': tags,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiaryEntriesCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? date,
    Value<int?>? moodScore,
    Value<String>? tags,
    Value<String?>? body,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return DiaryEntriesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      moodScore: moodScore ?? this.moodScore,
      tags: tags ?? this.tags,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (moodScore.present) {
      map['mood_score'] = Variable<int>(moodScore.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('moodScore: $moodScore, ')
          ..write('tags: $tags, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BloodTestRecordsTable extends BloodTestRecords
    with TableInfo<$BloodTestRecordsTable, BloodTestRecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BloodTestRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testDateMeta = const VerificationMeta(
    'testDate',
  );
  @override
  late final GeneratedColumn<DateTime> testDate = GeneratedColumn<DateTime>(
    'test_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labNameMeta = const VerificationMeta(
    'labName',
  );
  @override
  late final GeneratedColumn<String> labName = GeneratedColumn<String>(
    'lab_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _testNameMeta = const VerificationMeta(
    'testName',
  );
  @override
  late final GeneratedColumn<String> testName = GeneratedColumn<String>(
    'test_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _referenceRangeMeta = const VerificationMeta(
    'referenceRange',
  );
  @override
  late final GeneratedColumn<String> referenceRange = GeneratedColumn<String>(
    'reference_range',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _attachmentLocalPathMeta =
      const VerificationMeta('attachmentLocalPath');
  @override
  late final GeneratedColumn<String> attachmentLocalPath =
      GeneratedColumn<String>(
        'attachment_local_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    testDate,
    labName,
    testName,
    value,
    unit,
    referenceRange,
    notes,
    attachmentLocalPath,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'blood_test_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<BloodTestRecordRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('test_date')) {
      context.handle(
        _testDateMeta,
        testDate.isAcceptableOrUnknown(data['test_date']!, _testDateMeta),
      );
    } else if (isInserting) {
      context.missing(_testDateMeta);
    }
    if (data.containsKey('lab_name')) {
      context.handle(
        _labNameMeta,
        labName.isAcceptableOrUnknown(data['lab_name']!, _labNameMeta),
      );
    }
    if (data.containsKey('test_name')) {
      context.handle(
        _testNameMeta,
        testName.isAcceptableOrUnknown(data['test_name']!, _testNameMeta),
      );
    } else if (isInserting) {
      context.missing(_testNameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('reference_range')) {
      context.handle(
        _referenceRangeMeta,
        referenceRange.isAcceptableOrUnknown(
          data['reference_range']!,
          _referenceRangeMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('attachment_local_path')) {
      context.handle(
        _attachmentLocalPathMeta,
        attachmentLocalPath.isAcceptableOrUnknown(
          data['attachment_local_path']!,
          _attachmentLocalPathMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BloodTestRecordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BloodTestRecordRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      testDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}test_date'],
      )!,
      labName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lab_name'],
      ),
      testName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_name'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}value'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      referenceRange: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reference_range'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      attachmentLocalPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_local_path'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $BloodTestRecordsTable createAlias(String alias) {
    return $BloodTestRecordsTable(attachedDatabase, alias);
  }
}

class BloodTestRecordRow extends DataClass
    implements Insertable<BloodTestRecordRow> {
  final String id;
  final DateTime testDate;
  final String? labName;
  final String testName;
  final double value;
  final String unit;
  final String? referenceRange;
  final String? notes;
  final String? attachmentLocalPath;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BloodTestRecordRow({
    required this.id,
    required this.testDate,
    this.labName,
    required this.testName,
    required this.value,
    required this.unit,
    this.referenceRange,
    this.notes,
    this.attachmentLocalPath,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['test_date'] = Variable<DateTime>(testDate);
    if (!nullToAbsent || labName != null) {
      map['lab_name'] = Variable<String>(labName);
    }
    map['test_name'] = Variable<String>(testName);
    map['value'] = Variable<double>(value);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || referenceRange != null) {
      map['reference_range'] = Variable<String>(referenceRange);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || attachmentLocalPath != null) {
      map['attachment_local_path'] = Variable<String>(attachmentLocalPath);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BloodTestRecordsCompanion toCompanion(bool nullToAbsent) {
    return BloodTestRecordsCompanion(
      id: Value(id),
      testDate: Value(testDate),
      labName: labName == null && nullToAbsent
          ? const Value.absent()
          : Value(labName),
      testName: Value(testName),
      value: Value(value),
      unit: Value(unit),
      referenceRange: referenceRange == null && nullToAbsent
          ? const Value.absent()
          : Value(referenceRange),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      attachmentLocalPath: attachmentLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentLocalPath),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BloodTestRecordRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BloodTestRecordRow(
      id: serializer.fromJson<String>(json['id']),
      testDate: serializer.fromJson<DateTime>(json['testDate']),
      labName: serializer.fromJson<String?>(json['labName']),
      testName: serializer.fromJson<String>(json['testName']),
      value: serializer.fromJson<double>(json['value']),
      unit: serializer.fromJson<String>(json['unit']),
      referenceRange: serializer.fromJson<String?>(json['referenceRange']),
      notes: serializer.fromJson<String?>(json['notes']),
      attachmentLocalPath: serializer.fromJson<String?>(
        json['attachmentLocalPath'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'testDate': serializer.toJson<DateTime>(testDate),
      'labName': serializer.toJson<String?>(labName),
      'testName': serializer.toJson<String>(testName),
      'value': serializer.toJson<double>(value),
      'unit': serializer.toJson<String>(unit),
      'referenceRange': serializer.toJson<String?>(referenceRange),
      'notes': serializer.toJson<String?>(notes),
      'attachmentLocalPath': serializer.toJson<String?>(attachmentLocalPath),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BloodTestRecordRow copyWith({
    String? id,
    DateTime? testDate,
    Value<String?> labName = const Value.absent(),
    String? testName,
    double? value,
    String? unit,
    Value<String?> referenceRange = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> attachmentLocalPath = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => BloodTestRecordRow(
    id: id ?? this.id,
    testDate: testDate ?? this.testDate,
    labName: labName.present ? labName.value : this.labName,
    testName: testName ?? this.testName,
    value: value ?? this.value,
    unit: unit ?? this.unit,
    referenceRange: referenceRange.present
        ? referenceRange.value
        : this.referenceRange,
    notes: notes.present ? notes.value : this.notes,
    attachmentLocalPath: attachmentLocalPath.present
        ? attachmentLocalPath.value
        : this.attachmentLocalPath,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  BloodTestRecordRow copyWithCompanion(BloodTestRecordsCompanion data) {
    return BloodTestRecordRow(
      id: data.id.present ? data.id.value : this.id,
      testDate: data.testDate.present ? data.testDate.value : this.testDate,
      labName: data.labName.present ? data.labName.value : this.labName,
      testName: data.testName.present ? data.testName.value : this.testName,
      value: data.value.present ? data.value.value : this.value,
      unit: data.unit.present ? data.unit.value : this.unit,
      referenceRange: data.referenceRange.present
          ? data.referenceRange.value
          : this.referenceRange,
      notes: data.notes.present ? data.notes.value : this.notes,
      attachmentLocalPath: data.attachmentLocalPath.present
          ? data.attachmentLocalPath.value
          : this.attachmentLocalPath,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BloodTestRecordRow(')
          ..write('id: $id, ')
          ..write('testDate: $testDate, ')
          ..write('labName: $labName, ')
          ..write('testName: $testName, ')
          ..write('value: $value, ')
          ..write('unit: $unit, ')
          ..write('referenceRange: $referenceRange, ')
          ..write('notes: $notes, ')
          ..write('attachmentLocalPath: $attachmentLocalPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    testDate,
    labName,
    testName,
    value,
    unit,
    referenceRange,
    notes,
    attachmentLocalPath,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BloodTestRecordRow &&
          other.id == this.id &&
          other.testDate == this.testDate &&
          other.labName == this.labName &&
          other.testName == this.testName &&
          other.value == this.value &&
          other.unit == this.unit &&
          other.referenceRange == this.referenceRange &&
          other.notes == this.notes &&
          other.attachmentLocalPath == this.attachmentLocalPath &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BloodTestRecordsCompanion extends UpdateCompanion<BloodTestRecordRow> {
  final Value<String> id;
  final Value<DateTime> testDate;
  final Value<String?> labName;
  final Value<String> testName;
  final Value<double> value;
  final Value<String> unit;
  final Value<String?> referenceRange;
  final Value<String?> notes;
  final Value<String?> attachmentLocalPath;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BloodTestRecordsCompanion({
    this.id = const Value.absent(),
    this.testDate = const Value.absent(),
    this.labName = const Value.absent(),
    this.testName = const Value.absent(),
    this.value = const Value.absent(),
    this.unit = const Value.absent(),
    this.referenceRange = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachmentLocalPath = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BloodTestRecordsCompanion.insert({
    required String id,
    required DateTime testDate,
    this.labName = const Value.absent(),
    required String testName,
    required double value,
    required String unit,
    this.referenceRange = const Value.absent(),
    this.notes = const Value.absent(),
    this.attachmentLocalPath = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       testDate = Value(testDate),
       testName = Value(testName),
       value = Value(value),
       unit = Value(unit),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<BloodTestRecordRow> custom({
    Expression<String>? id,
    Expression<DateTime>? testDate,
    Expression<String>? labName,
    Expression<String>? testName,
    Expression<double>? value,
    Expression<String>? unit,
    Expression<String>? referenceRange,
    Expression<String>? notes,
    Expression<String>? attachmentLocalPath,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (testDate != null) 'test_date': testDate,
      if (labName != null) 'lab_name': labName,
      if (testName != null) 'test_name': testName,
      if (value != null) 'value': value,
      if (unit != null) 'unit': unit,
      if (referenceRange != null) 'reference_range': referenceRange,
      if (notes != null) 'notes': notes,
      if (attachmentLocalPath != null)
        'attachment_local_path': attachmentLocalPath,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BloodTestRecordsCompanion copyWith({
    Value<String>? id,
    Value<DateTime>? testDate,
    Value<String?>? labName,
    Value<String>? testName,
    Value<double>? value,
    Value<String>? unit,
    Value<String?>? referenceRange,
    Value<String?>? notes,
    Value<String?>? attachmentLocalPath,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return BloodTestRecordsCompanion(
      id: id ?? this.id,
      testDate: testDate ?? this.testDate,
      labName: labName ?? this.labName,
      testName: testName ?? this.testName,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      referenceRange: referenceRange ?? this.referenceRange,
      notes: notes ?? this.notes,
      attachmentLocalPath: attachmentLocalPath ?? this.attachmentLocalPath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (testDate.present) {
      map['test_date'] = Variable<DateTime>(testDate.value);
    }
    if (labName.present) {
      map['lab_name'] = Variable<String>(labName.value);
    }
    if (testName.present) {
      map['test_name'] = Variable<String>(testName.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (referenceRange.present) {
      map['reference_range'] = Variable<String>(referenceRange.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (attachmentLocalPath.present) {
      map['attachment_local_path'] = Variable<String>(
        attachmentLocalPath.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BloodTestRecordsCompanion(')
          ..write('id: $id, ')
          ..write('testDate: $testDate, ')
          ..write('labName: $labName, ')
          ..write('testName: $testName, ')
          ..write('value: $value, ')
          ..write('unit: $unit, ')
          ..write('referenceRange: $referenceRange, ')
          ..write('notes: $notes, ')
          ..write('attachmentLocalPath: $attachmentLocalPath, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSettingRow extends DataClass implements Insertable<AppSettingRow> {
  final String key;
  final String value;
  const AppSettingRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(key: Value(key), value: Value(value));
  }

  factory AppSettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSettingRow copyWith({String? key, String? value}) =>
      AppSettingRow(key: key ?? this.key, value: value ?? this.value);
  AppSettingRow copyWithCompanion(AppSettingsCompanion data) {
    return AppSettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingRow &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RegimensTable regimens = $RegimensTable(this);
  late final $RemindersTable reminders = $RemindersTable(this);
  late final $DoseLogsTable doseLogs = $DoseLogsTable(this);
  late final $PhotoEntriesTable photoEntries = $PhotoEntriesTable(this);
  late final $DiaryEntriesTable diaryEntries = $DiaryEntriesTable(this);
  late final $BloodTestRecordsTable bloodTestRecords = $BloodTestRecordsTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    regimens,
    reminders,
    doseLogs,
    photoEntries,
    diaryEntries,
    bloodTestRecords,
    appSettings,
  ];
}

typedef $$RegimensTableCreateCompanionBuilder = RegimensCompanion Function({
  required String id,
  required String category,
  Value<String?> customCategory,
  required String medicationName,
  required double doseAmount,
  required String doseUnit,
  required String route,
  Value<String?> customRoute,
  required DateTime startDate,
  Value<String?> notes,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$RegimensTableUpdateCompanionBuilder = RegimensCompanion Function({
  Value<String> id,
  Value<String> category,
  Value<String?> customCategory,
  Value<String> medicationName,
  Value<double> doseAmount,
  Value<String> doseUnit,
  Value<String> route,
  Value<String?> customRoute,
  Value<DateTime> startDate,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$RegimensTableReferences
    extends BaseReferences<_$AppDatabase, $RegimensTable, RegimenRow> {
  $$RegimensTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RemindersTable, List<ReminderRow>>
  _remindersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.reminders,
    aliasName: 'regimens__id__reminders__regimen_id',
  );

  $$RemindersTableProcessedTableManager get remindersRefs {
    final manager = $$RemindersTableTableManager(
      $_db,
      $_db.reminders,
    ).filter((f) => f.regimenId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_remindersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DoseLogsTable, List<DoseLogRow>>
  _doseLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doseLogs,
    aliasName: 'regimens__id__dose_logs__regimen_id',
  );

  $$DoseLogsTableProcessedTableManager get doseLogsRefs {
    final manager = $$DoseLogsTableTableManager(
      $_db,
      $_db.doseLogs,
    ).filter((f) => f.regimenId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_doseLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RegimensTableFilterComposer
    extends Composer<_$AppDatabase, $RegimensTable> {
  $$RegimensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customCategory => $composableBuilder(
    column: $table.customCategory,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doseUnit => $composableBuilder(
    column: $table.doseUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customRoute => $composableBuilder(
    column: $table.customRoute,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> remindersRefs(
    Expression<bool> Function($$RemindersTableFilterComposer f) f,
  ) {
    final $$RemindersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.regimenId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableFilterComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> doseLogsRefs(
    Expression<bool> Function($$DoseLogsTableFilterComposer f) f,
  ) {
    final $$DoseLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseLogs,
      getReferencedColumn: (t) => t.regimenId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseLogsTableFilterComposer(
            $db: $db,
            $table: $db.doseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RegimensTableOrderingComposer
    extends Composer<_$AppDatabase, $RegimensTable> {
  $$RegimensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customCategory => $composableBuilder(
    column: $table.customCategory,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doseUnit => $composableBuilder(
    column: $table.doseUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get route => $composableBuilder(
    column: $table.route,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customRoute => $composableBuilder(
    column: $table.customRoute,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RegimensTableAnnotationComposer
    extends Composer<_$AppDatabase, $RegimensTable> {
  $$RegimensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get customCategory => $composableBuilder(
    column: $table.customCategory,
    builder: (column) => column,
  );

  GeneratedColumn<String> get medicationName => $composableBuilder(
    column: $table.medicationName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get doseAmount => $composableBuilder(
    column: $table.doseAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doseUnit =>
      $composableBuilder(column: $table.doseUnit, builder: (column) => column);

  GeneratedColumn<String> get route =>
      $composableBuilder(column: $table.route, builder: (column) => column);

  GeneratedColumn<String> get customRoute => $composableBuilder(
    column: $table.customRoute,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> remindersRefs<T extends Object>(
    Expression<T> Function($$RemindersTableAnnotationComposer a) f,
  ) {
    final $$RemindersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reminders,
      getReferencedColumn: (t) => t.regimenId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RemindersTableAnnotationComposer(
            $db: $db,
            $table: $db.reminders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> doseLogsRefs<T extends Object>(
    Expression<T> Function($$DoseLogsTableAnnotationComposer a) f,
  ) {
    final $$DoseLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doseLogs,
      getReferencedColumn: (t) => t.regimenId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoseLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.doseLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RegimensTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RegimensTable,
          RegimenRow,
          $$RegimensTableFilterComposer,
          $$RegimensTableOrderingComposer,
          $$RegimensTableAnnotationComposer,
          $$RegimensTableCreateCompanionBuilder,
          $$RegimensTableUpdateCompanionBuilder,
          (RegimenRow, $$RegimensTableReferences),
          RegimenRow,
          PrefetchHooks Function({bool remindersRefs, bool doseLogsRefs})
        > {
  $$RegimensTableTableManager(_$AppDatabase db, $RegimensTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegimensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RegimensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RegimensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String?> customCategory = const Value.absent(),
                Value<String> medicationName = const Value.absent(),
                Value<double> doseAmount = const Value.absent(),
                Value<String> doseUnit = const Value.absent(),
                Value<String> route = const Value.absent(),
                Value<String?> customRoute = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RegimensCompanion(
                id: id,
                category: category,
                customCategory: customCategory,
                medicationName: medicationName,
                doseAmount: doseAmount,
                doseUnit: doseUnit,
                route: route,
                customRoute: customRoute,
                startDate: startDate,
                notes: notes,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String category,
                Value<String?> customCategory = const Value.absent(),
                required String medicationName,
                required double doseAmount,
                required String doseUnit,
                required String route,
                Value<String?> customRoute = const Value.absent(),
                required DateTime startDate,
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RegimensCompanion.insert(
                id: id,
                category: category,
                customCategory: customCategory,
                medicationName: medicationName,
                doseAmount: doseAmount,
                doseUnit: doseUnit,
                route: route,
                customRoute: customRoute,
                startDate: startDate,
                notes: notes,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RegimensTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({remindersRefs = false, doseLogsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (remindersRefs) db.reminders,
                    if (doseLogsRefs) db.doseLogs,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (remindersRefs)
                        await $_getPrefetchedData<
                          RegimenRow,
                          $RegimensTable,
                          ReminderRow
                        >(
                          currentTable: table,
                          referencedTable: $$RegimensTableReferences
                              ._remindersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RegimensTableReferences(
                                db,
                                table,
                                p0,
                              ).remindersRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.regimenId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (doseLogsRefs)
                        await $_getPrefetchedData<
                          RegimenRow,
                          $RegimensTable,
                          DoseLogRow
                        >(
                          currentTable: table,
                          referencedTable: $$RegimensTableReferences
                              ._doseLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RegimensTableReferences(
                                db,
                                table,
                                p0,
                              ).doseLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.regimenId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RegimensTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RegimensTable,
      RegimenRow,
      $$RegimensTableFilterComposer,
      $$RegimensTableOrderingComposer,
      $$RegimensTableAnnotationComposer,
      $$RegimensTableCreateCompanionBuilder,
      $$RegimensTableUpdateCompanionBuilder,
      (RegimenRow, $$RegimensTableReferences),
      RegimenRow,
      PrefetchHooks Function({bool remindersRefs, bool doseLogsRefs})
    >;
typedef $$RemindersTableCreateCompanionBuilder = RemindersCompanion Function({
  required String id,
  required String regimenId,
  required int timeOfDayMinutes,
  required String scheduleType,
  Value<String> weekdayValues,
  Value<String> monthDayValues,
  Value<int?> intervalDays,
  Value<bool> isEnabled,
  Value<String> notificationPrivacyMode,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$RemindersTableUpdateCompanionBuilder = RemindersCompanion Function({
  Value<String> id,
  Value<String> regimenId,
  Value<int> timeOfDayMinutes,
  Value<String> scheduleType,
  Value<String> weekdayValues,
  Value<String> monthDayValues,
  Value<int?> intervalDays,
  Value<bool> isEnabled,
  Value<String> notificationPrivacyMode,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$RemindersTableReferences
    extends BaseReferences<_$AppDatabase, $RemindersTable, ReminderRow> {
  $$RemindersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RegimensTable _regimenIdTable(_$AppDatabase db) =>
      db.regimens.createAlias('reminders__regimen_id__regimens__id');

  $$RegimensTableProcessedTableManager get regimenId {
    final $_column = $_itemColumn<String>('regimen_id')!;

    final manager = $$RegimensTableTableManager(
      $_db,
      $_db.regimens,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_regimenIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemindersTableFilterComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timeOfDayMinutes => $composableBuilder(
    column: $table.timeOfDayMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduleType => $composableBuilder(
    column: $table.scheduleType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get weekdayValues => $composableBuilder(
    column: $table.weekdayValues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get monthDayValues => $composableBuilder(
    column: $table.monthDayValues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notificationPrivacyMode => $composableBuilder(
    column: $table.notificationPrivacyMode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RegimensTableFilterComposer get regimenId {
    final $$RegimensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regimenId,
      referencedTable: $db.regimens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegimensTableFilterComposer(
            $db: $db,
            $table: $db.regimens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableOrderingComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timeOfDayMinutes => $composableBuilder(
    column: $table.timeOfDayMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduleType => $composableBuilder(
    column: $table.scheduleType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weekdayValues => $composableBuilder(
    column: $table.weekdayValues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get monthDayValues => $composableBuilder(
    column: $table.monthDayValues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isEnabled => $composableBuilder(
    column: $table.isEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notificationPrivacyMode => $composableBuilder(
    column: $table.notificationPrivacyMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RegimensTableOrderingComposer get regimenId {
    final $$RegimensTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regimenId,
      referencedTable: $db.regimens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegimensTableOrderingComposer(
            $db: $db,
            $table: $db.regimens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RemindersTable> {
  $$RemindersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get timeOfDayMinutes => $composableBuilder(
    column: $table.timeOfDayMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get scheduleType => $composableBuilder(
    column: $table.scheduleType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get weekdayValues => $composableBuilder(
    column: $table.weekdayValues,
    builder: (column) => column,
  );

  GeneratedColumn<String> get monthDayValues => $composableBuilder(
    column: $table.monthDayValues,
    builder: (column) => column,
  );

  GeneratedColumn<int> get intervalDays => $composableBuilder(
    column: $table.intervalDays,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isEnabled =>
      $composableBuilder(column: $table.isEnabled, builder: (column) => column);

  GeneratedColumn<String> get notificationPrivacyMode => $composableBuilder(
    column: $table.notificationPrivacyMode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$RegimensTableAnnotationComposer get regimenId {
    final $$RegimensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regimenId,
      referencedTable: $db.regimens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegimensTableAnnotationComposer(
            $db: $db,
            $table: $db.regimens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemindersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RemindersTable,
          ReminderRow,
          $$RemindersTableFilterComposer,
          $$RemindersTableOrderingComposer,
          $$RemindersTableAnnotationComposer,
          $$RemindersTableCreateCompanionBuilder,
          $$RemindersTableUpdateCompanionBuilder,
          (ReminderRow, $$RemindersTableReferences),
          ReminderRow,
          PrefetchHooks Function({bool regimenId})
        > {
  $$RemindersTableTableManager(_$AppDatabase db, $RemindersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RemindersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RemindersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RemindersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> regimenId = const Value.absent(),
                Value<int> timeOfDayMinutes = const Value.absent(),
                Value<String> scheduleType = const Value.absent(),
                Value<String> weekdayValues = const Value.absent(),
                Value<String> monthDayValues = const Value.absent(),
                Value<int?> intervalDays = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<String> notificationPrivacyMode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion(
                id: id,
                regimenId: regimenId,
                timeOfDayMinutes: timeOfDayMinutes,
                scheduleType: scheduleType,
                weekdayValues: weekdayValues,
                monthDayValues: monthDayValues,
                intervalDays: intervalDays,
                isEnabled: isEnabled,
                notificationPrivacyMode: notificationPrivacyMode,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String regimenId,
                required int timeOfDayMinutes,
                required String scheduleType,
                Value<String> weekdayValues = const Value.absent(),
                Value<String> monthDayValues = const Value.absent(),
                Value<int?> intervalDays = const Value.absent(),
                Value<bool> isEnabled = const Value.absent(),
                Value<String> notificationPrivacyMode = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => RemindersCompanion.insert(
                id: id,
                regimenId: regimenId,
                timeOfDayMinutes: timeOfDayMinutes,
                scheduleType: scheduleType,
                weekdayValues: weekdayValues,
                monthDayValues: monthDayValues,
                intervalDays: intervalDays,
                isEnabled: isEnabled,
                notificationPrivacyMode: notificationPrivacyMode,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RemindersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({regimenId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (regimenId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.regimenId,
                        referencedTable: $$RemindersTableReferences
                            ._regimenIdTable(db),
                        referencedColumn: $$RemindersTableReferences
                            ._regimenIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RemindersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RemindersTable,
      ReminderRow,
      $$RemindersTableFilterComposer,
      $$RemindersTableOrderingComposer,
      $$RemindersTableAnnotationComposer,
      $$RemindersTableCreateCompanionBuilder,
      $$RemindersTableUpdateCompanionBuilder,
      (ReminderRow, $$RemindersTableReferences),
      ReminderRow,
      PrefetchHooks Function({bool regimenId})
    >;
typedef $$DoseLogsTableCreateCompanionBuilder = DoseLogsCompanion Function({
  required String id,
  required String regimenId,
  required DateTime scheduledAt,
  Value<DateTime?> takenAt,
  required String status,
  Value<String?> notes,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$DoseLogsTableUpdateCompanionBuilder = DoseLogsCompanion Function({
  Value<String> id,
  Value<String> regimenId,
  Value<DateTime> scheduledAt,
  Value<DateTime?> takenAt,
  Value<String> status,
  Value<String?> notes,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

final class $$DoseLogsTableReferences
    extends BaseReferences<_$AppDatabase, $DoseLogsTable, DoseLogRow> {
  $$DoseLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RegimensTable _regimenIdTable(_$AppDatabase db) =>
      db.regimens.createAlias('dose_logs__regimen_id__regimens__id');

  $$RegimensTableProcessedTableManager get regimenId {
    final $_column = $_itemColumn<String>('regimen_id')!;

    final manager = $$RegimensTableTableManager(
      $_db,
      $_db.regimens,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_regimenIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DoseLogsTableFilterComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$RegimensTableFilterComposer get regimenId {
    final $$RegimensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regimenId,
      referencedTable: $db.regimens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegimensTableFilterComposer(
            $db: $db,
            $table: $db.regimens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$RegimensTableOrderingComposer get regimenId {
    final $$RegimensTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regimenId,
      referencedTable: $db.regimens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegimensTableOrderingComposer(
            $db: $db,
            $table: $db.regimens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoseLogsTable> {
  $$DoseLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RegimensTableAnnotationComposer get regimenId {
    final $$RegimensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.regimenId,
      referencedTable: $db.regimens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegimensTableAnnotationComposer(
            $db: $db,
            $table: $db.regimens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoseLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoseLogsTable,
          DoseLogRow,
          $$DoseLogsTableFilterComposer,
          $$DoseLogsTableOrderingComposer,
          $$DoseLogsTableAnnotationComposer,
          $$DoseLogsTableCreateCompanionBuilder,
          $$DoseLogsTableUpdateCompanionBuilder,
          (DoseLogRow, $$DoseLogsTableReferences),
          DoseLogRow,
          PrefetchHooks Function({bool regimenId})
        > {
  $$DoseLogsTableTableManager(_$AppDatabase db, $DoseLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DoseLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DoseLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DoseLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> regimenId = const Value.absent(),
                Value<DateTime> scheduledAt = const Value.absent(),
                Value<DateTime?> takenAt = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoseLogsCompanion(
                id: id,
                regimenId: regimenId,
                scheduledAt: scheduledAt,
                takenAt: takenAt,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String regimenId,
                required DateTime scheduledAt,
                Value<DateTime?> takenAt = const Value.absent(),
                required String status,
                Value<String?> notes = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DoseLogsCompanion.insert(
                id: id,
                regimenId: regimenId,
                scheduledAt: scheduledAt,
                takenAt: takenAt,
                status: status,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DoseLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({regimenId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (regimenId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.regimenId,
                        referencedTable: $$DoseLogsTableReferences
                            ._regimenIdTable(db),
                        referencedColumn: $$DoseLogsTableReferences
                            ._regimenIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DoseLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoseLogsTable,
      DoseLogRow,
      $$DoseLogsTableFilterComposer,
      $$DoseLogsTableOrderingComposer,
      $$DoseLogsTableAnnotationComposer,
      $$DoseLogsTableCreateCompanionBuilder,
      $$DoseLogsTableUpdateCompanionBuilder,
      (DoseLogRow, $$DoseLogsTableReferences),
      DoseLogRow,
      PrefetchHooks Function({bool regimenId})
    >;
typedef $$PhotoEntriesTableCreateCompanionBuilder =
    PhotoEntriesCompanion Function({
      required String id,
      required String photoLocalPath,
      required DateTime date,
      Value<DateTime?> hrtStartDateReference,
      Value<int?> journeyDayNumber,
      Value<String?> caption,
      Value<String> tags,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$PhotoEntriesTableUpdateCompanionBuilder =
    PhotoEntriesCompanion Function({
      Value<String> id,
      Value<String> photoLocalPath,
      Value<DateTime> date,
      Value<DateTime?> hrtStartDateReference,
      Value<int?> journeyDayNumber,
      Value<String?> caption,
      Value<String> tags,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$PhotoEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoEntriesTable> {
  $$PhotoEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoLocalPath => $composableBuilder(
    column: $table.photoLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get hrtStartDateReference => $composableBuilder(
    column: $table.hrtStartDateReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get journeyDayNumber => $composableBuilder(
    column: $table.journeyDayNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotoEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoEntriesTable> {
  $$PhotoEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoLocalPath => $composableBuilder(
    column: $table.photoLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get hrtStartDateReference => $composableBuilder(
    column: $table.hrtStartDateReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get journeyDayNumber => $composableBuilder(
    column: $table.journeyDayNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotoEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoEntriesTable> {
  $$PhotoEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get photoLocalPath => $composableBuilder(
    column: $table.photoLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get hrtStartDateReference => $composableBuilder(
    column: $table.hrtStartDateReference,
    builder: (column) => column,
  );

  GeneratedColumn<int> get journeyDayNumber => $composableBuilder(
    column: $table.journeyDayNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PhotoEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoEntriesTable,
          PhotoEntryRow,
          $$PhotoEntriesTableFilterComposer,
          $$PhotoEntriesTableOrderingComposer,
          $$PhotoEntriesTableAnnotationComposer,
          $$PhotoEntriesTableCreateCompanionBuilder,
          $$PhotoEntriesTableUpdateCompanionBuilder,
          (
            PhotoEntryRow,
            BaseReferences<_$AppDatabase, $PhotoEntriesTable, PhotoEntryRow>,
          ),
          PhotoEntryRow,
          PrefetchHooks Function()
        > {
  $$PhotoEntriesTableTableManager(_$AppDatabase db, $PhotoEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> photoLocalPath = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<DateTime?> hrtStartDateReference = const Value.absent(),
                Value<int?> journeyDayNumber = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoEntriesCompanion(
                id: id,
                photoLocalPath: photoLocalPath,
                date: date,
                hrtStartDateReference: hrtStartDateReference,
                journeyDayNumber: journeyDayNumber,
                caption: caption,
                tags: tags,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String photoLocalPath,
                required DateTime date,
                Value<DateTime?> hrtStartDateReference = const Value.absent(),
                Value<int?> journeyDayNumber = const Value.absent(),
                Value<String?> caption = const Value.absent(),
                Value<String> tags = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PhotoEntriesCompanion.insert(
                id: id,
                photoLocalPath: photoLocalPath,
                date: date,
                hrtStartDateReference: hrtStartDateReference,
                journeyDayNumber: journeyDayNumber,
                caption: caption,
                tags: tags,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotoEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoEntriesTable,
      PhotoEntryRow,
      $$PhotoEntriesTableFilterComposer,
      $$PhotoEntriesTableOrderingComposer,
      $$PhotoEntriesTableAnnotationComposer,
      $$PhotoEntriesTableCreateCompanionBuilder,
      $$PhotoEntriesTableUpdateCompanionBuilder,
      (
        PhotoEntryRow,
        BaseReferences<_$AppDatabase, $PhotoEntriesTable, PhotoEntryRow>,
      ),
      PhotoEntryRow,
      PrefetchHooks Function()
    >;
typedef $$DiaryEntriesTableCreateCompanionBuilder =
    DiaryEntriesCompanion Function({
      required String id,
      required DateTime date,
      Value<int?> moodScore,
      Value<String> tags,
      Value<String?> body,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$DiaryEntriesTableUpdateCompanionBuilder =
    DiaryEntriesCompanion Function({
      Value<String> id,
      Value<DateTime> date,
      Value<int?> moodScore,
      Value<String> tags,
      Value<String?> body,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$DiaryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moodScore => $composableBuilder(
    column: $table.moodScore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiaryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moodScore => $composableBuilder(
    column: $table.moodScore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiaryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get moodScore =>
      $composableBuilder(column: $table.moodScore, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DiaryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiaryEntriesTable,
          DiaryEntryRow,
          $$DiaryEntriesTableFilterComposer,
          $$DiaryEntriesTableOrderingComposer,
          $$DiaryEntriesTableAnnotationComposer,
          $$DiaryEntriesTableCreateCompanionBuilder,
          $$DiaryEntriesTableUpdateCompanionBuilder,
          (
            DiaryEntryRow,
            BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntryRow>,
          ),
          DiaryEntryRow,
          PrefetchHooks Function()
        > {
  $$DiaryEntriesTableTableManager(_$AppDatabase db, $DiaryEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiaryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiaryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiaryEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int?> moodScore = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String?> body = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiaryEntriesCompanion(
                id: id,
                date: date,
                moodScore: moodScore,
                tags: tags,
                body: body,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime date,
                Value<int?> moodScore = const Value.absent(),
                Value<String> tags = const Value.absent(),
                Value<String?> body = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => DiaryEntriesCompanion.insert(
                id: id,
                date: date,
                moodScore: moodScore,
                tags: tags,
                body: body,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiaryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiaryEntriesTable,
      DiaryEntryRow,
      $$DiaryEntriesTableFilterComposer,
      $$DiaryEntriesTableOrderingComposer,
      $$DiaryEntriesTableAnnotationComposer,
      $$DiaryEntriesTableCreateCompanionBuilder,
      $$DiaryEntriesTableUpdateCompanionBuilder,
      (
        DiaryEntryRow,
        BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntryRow>,
      ),
      DiaryEntryRow,
      PrefetchHooks Function()
    >;
typedef $$BloodTestRecordsTableCreateCompanionBuilder =
    BloodTestRecordsCompanion Function({
      required String id,
      required DateTime testDate,
      Value<String?> labName,
      required String testName,
      required double value,
      required String unit,
      Value<String?> referenceRange,
      Value<String?> notes,
      Value<String?> attachmentLocalPath,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$BloodTestRecordsTableUpdateCompanionBuilder =
    BloodTestRecordsCompanion Function({
      Value<String> id,
      Value<DateTime> testDate,
      Value<String?> labName,
      Value<String> testName,
      Value<double> value,
      Value<String> unit,
      Value<String?> referenceRange,
      Value<String?> notes,
      Value<String?> attachmentLocalPath,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$BloodTestRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $BloodTestRecordsTable> {
  $$BloodTestRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get labName => $composableBuilder(
    column: $table.labName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get referenceRange => $composableBuilder(
    column: $table.referenceRange,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get attachmentLocalPath => $composableBuilder(
    column: $table.attachmentLocalPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BloodTestRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $BloodTestRecordsTable> {
  $$BloodTestRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get labName => $composableBuilder(
    column: $table.labName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testName => $composableBuilder(
    column: $table.testName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get referenceRange => $composableBuilder(
    column: $table.referenceRange,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get attachmentLocalPath => $composableBuilder(
    column: $table.attachmentLocalPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BloodTestRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BloodTestRecordsTable> {
  $$BloodTestRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get testDate =>
      $composableBuilder(column: $table.testDate, builder: (column) => column);

  GeneratedColumn<String> get labName =>
      $composableBuilder(column: $table.labName, builder: (column) => column);

  GeneratedColumn<String> get testName =>
      $composableBuilder(column: $table.testName, builder: (column) => column);

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get referenceRange => $composableBuilder(
    column: $table.referenceRange,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get attachmentLocalPath => $composableBuilder(
    column: $table.attachmentLocalPath,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BloodTestRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BloodTestRecordsTable,
          BloodTestRecordRow,
          $$BloodTestRecordsTableFilterComposer,
          $$BloodTestRecordsTableOrderingComposer,
          $$BloodTestRecordsTableAnnotationComposer,
          $$BloodTestRecordsTableCreateCompanionBuilder,
          $$BloodTestRecordsTableUpdateCompanionBuilder,
          (
            BloodTestRecordRow,
            BaseReferences<
              _$AppDatabase,
              $BloodTestRecordsTable,
              BloodTestRecordRow
            >,
          ),
          BloodTestRecordRow,
          PrefetchHooks Function()
        > {
  $$BloodTestRecordsTableTableManager(
    _$AppDatabase db,
    $BloodTestRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BloodTestRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BloodTestRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BloodTestRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<DateTime> testDate = const Value.absent(),
                Value<String?> labName = const Value.absent(),
                Value<String> testName = const Value.absent(),
                Value<double> value = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String?> referenceRange = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> attachmentLocalPath = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => BloodTestRecordsCompanion(
                id: id,
                testDate: testDate,
                labName: labName,
                testName: testName,
                value: value,
                unit: unit,
                referenceRange: referenceRange,
                notes: notes,
                attachmentLocalPath: attachmentLocalPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required DateTime testDate,
                Value<String?> labName = const Value.absent(),
                required String testName,
                required double value,
                required String unit,
                Value<String?> referenceRange = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> attachmentLocalPath = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => BloodTestRecordsCompanion.insert(
                id: id,
                testDate: testDate,
                labName: labName,
                testName: testName,
                value: value,
                unit: unit,
                referenceRange: referenceRange,
                notes: notes,
                attachmentLocalPath: attachmentLocalPath,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BloodTestRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BloodTestRecordsTable,
      BloodTestRecordRow,
      $$BloodTestRecordsTableFilterComposer,
      $$BloodTestRecordsTableOrderingComposer,
      $$BloodTestRecordsTableAnnotationComposer,
      $$BloodTestRecordsTableCreateCompanionBuilder,
      $$BloodTestRecordsTableUpdateCompanionBuilder,
      (
        BloodTestRecordRow,
        BaseReferences<
          _$AppDatabase,
          $BloodTestRecordsTable,
          BloodTestRecordRow
        >,
      ),
      BloodTestRecordRow,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSettingRow,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSettingRow,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
          ),
          AppSettingRow,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) => AppSettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSettingRow,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSettingRow,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
      ),
      AppSettingRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RegimensTableTableManager get regimens =>
      $$RegimensTableTableManager(_db, _db.regimens);
  $$RemindersTableTableManager get reminders =>
      $$RemindersTableTableManager(_db, _db.reminders);
  $$DoseLogsTableTableManager get doseLogs =>
      $$DoseLogsTableTableManager(_db, _db.doseLogs);
  $$PhotoEntriesTableTableManager get photoEntries =>
      $$PhotoEntriesTableTableManager(_db, _db.photoEntries);
  $$DiaryEntriesTableTableManager get diaryEntries =>
      $$DiaryEntriesTableTableManager(_db, _db.diaryEntries);
  $$BloodTestRecordsTableTableManager get bloodTestRecords =>
      $$BloodTestRecordsTableTableManager(_db, _db.bloodTestRecords);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
