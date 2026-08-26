import 'package:equatable/equatable.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';

class Regimen extends Equatable {
  const Regimen({
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

  final String id;
  final HormoneCategory category;
  final String? customCategory;
  final String medicationName;
  final double doseAmount;
  final String doseUnit;
  final AdministrationRoute route;
  final String? customRoute;
  final DateTime startDate;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get categoryLabel =>
      category == HormoneCategory.custom &&
          (customCategory?.isNotEmpty ?? false)
      ? customCategory!
      : category.label;

  String get routeLabel =>
      route == AdministrationRoute.custom && (customRoute?.isNotEmpty ?? false)
      ? customRoute!
      : route.label;

  String get doseLabel => '$doseAmount $doseUnit';

  Regimen copyWith({
    HormoneCategory? category,
    String? customCategory,
    String? medicationName,
    double? doseAmount,
    String? doseUnit,
    AdministrationRoute? route,
    String? customRoute,
    DateTime? startDate,
    String? notes,
    bool? isActive,
    DateTime? updatedAt,
    bool clearNotes = false,
  }) {
    return Regimen(
      id: id,
      category: category ?? this.category,
      customCategory: customCategory ?? this.customCategory,
      medicationName: medicationName ?? this.medicationName,
      doseAmount: doseAmount ?? this.doseAmount,
      doseUnit: doseUnit ?? this.doseUnit,
      route: route ?? this.route,
      customRoute: customRoute ?? this.customRoute,
      startDate: startDate ?? this.startDate,
      notes: clearNotes ? null : (notes ?? this.notes),
      isActive: isActive ?? this.isActive,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category.name,
    'customCategory': customCategory,
    'medicationName': medicationName,
    'doseAmount': doseAmount,
    'doseUnit': doseUnit,
    'route': route.name,
    'customRoute': customRoute,
    'startDate': startDate.toIso8601String(),
    'notes': notes,
    'isActive': isActive,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
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
}

class Reminder extends Equatable {
  const Reminder({
    required this.id,
    required this.regimenId,
    required this.timeOfDayMinutes,
    required this.scheduleType,
    this.weekdayValues = const [],
    this.monthDayValues = const [],
    this.intervalDays,
    required this.isEnabled,
    required this.notificationPrivacyMode,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String regimenId;

  /// Minutes from midnight (0–1439).
  final int timeOfDayMinutes;
  final ReminderScheduleType scheduleType;
  final List<int> weekdayValues; // DateTime.monday=1 ... sunday=7
  final List<int> monthDayValues; // 1–31
  final int? intervalDays;
  final bool isEnabled;
  final NotificationPrivacyMode notificationPrivacyMode;
  final DateTime createdAt;
  final DateTime updatedAt;

  TimeOfDayParts get timeOfDay => TimeOfDayParts(
    hour: timeOfDayMinutes ~/ 60,
    minute: timeOfDayMinutes % 60,
  );

  Reminder copyWith({
    int? timeOfDayMinutes,
    ReminderScheduleType? scheduleType,
    List<int>? weekdayValues,
    List<int>? monthDayValues,
    int? intervalDays,
    bool? isEnabled,
    NotificationPrivacyMode? notificationPrivacyMode,
    DateTime? updatedAt,
    bool clearInterval = false,
  }) {
    return Reminder(
      id: id,
      regimenId: regimenId,
      timeOfDayMinutes: timeOfDayMinutes ?? this.timeOfDayMinutes,
      scheduleType: scheduleType ?? this.scheduleType,
      weekdayValues: weekdayValues ?? this.weekdayValues,
      monthDayValues: monthDayValues ?? this.monthDayValues,
      intervalDays: clearInterval ? null : (intervalDays ?? this.intervalDays),
      isEnabled: isEnabled ?? this.isEnabled,
      notificationPrivacyMode:
          notificationPrivacyMode ?? this.notificationPrivacyMode,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'regimenId': regimenId,
    'timeOfDayMinutes': timeOfDayMinutes,
    'scheduleType': scheduleType.name,
    'weekdayValues': weekdayValues,
    'monthDayValues': monthDayValues,
    'intervalDays': intervalDays,
    'isEnabled': isEnabled,
    'notificationPrivacyMode': notificationPrivacyMode.name,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
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
}

class TimeOfDayParts {
  const TimeOfDayParts({required this.hour, required this.minute});
  final int hour;
  final int minute;

  String format24h() =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}

class DoseLog extends Equatable {
  const DoseLog({
    required this.id,
    required this.regimenId,
    required this.scheduledAt,
    this.takenAt,
    required this.status,
    this.notes,
    required this.createdAt,
  });

  final String id;
  final String regimenId;
  final DateTime scheduledAt;
  final DateTime? takenAt;
  final DoseStatus status;
  final String? notes;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
    'id': id,
    'regimenId': regimenId,
    'scheduledAt': scheduledAt.toIso8601String(),
    'takenAt': takenAt?.toIso8601String(),
    'status': status.name,
    'notes': notes,
    'createdAt': createdAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
    id,
    regimenId,
    scheduledAt,
    takenAt,
    status,
    notes,
    createdAt,
  ];
}

class PhotoEntry extends Equatable {
  const PhotoEntry({
    required this.id,
    required this.photoLocalPath,
    required this.date,
    this.hrtStartDateReference,
    this.journeyDayNumber,
    this.caption,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String photoLocalPath;
  final DateTime date;
  final DateTime? hrtStartDateReference;
  final int? journeyDayNumber;
  final String? caption;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  PhotoEntry copyWith({
    String? photoLocalPath,
    DateTime? date,
    DateTime? hrtStartDateReference,
    int? journeyDayNumber,
    String? caption,
    List<String>? tags,
    DateTime? updatedAt,
    bool clearCaption = false,
    bool clearJourney = false,
  }) {
    return PhotoEntry(
      id: id,
      photoLocalPath: photoLocalPath ?? this.photoLocalPath,
      date: date ?? this.date,
      hrtStartDateReference: clearJourney
          ? null
          : (hrtStartDateReference ?? this.hrtStartDateReference),
      journeyDayNumber: clearJourney
          ? null
          : (journeyDayNumber ?? this.journeyDayNumber),
      caption: clearCaption ? null : (caption ?? this.caption),
      tags: tags ?? this.tags,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'photoLocalPath': photoLocalPath,
    'date': date.toIso8601String(),
    'hrtStartDateReference': hrtStartDateReference?.toIso8601String(),
    'journeyDayNumber': journeyDayNumber,
    'caption': caption,
    'tags': tags,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
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
}

class DiaryEntry extends Equatable {
  const DiaryEntry({
    required this.id,
    required this.date,
    this.moodScore,
    this.tags = const [],
    this.text,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final DateTime date;
  final int? moodScore; // 1–5 optional
  final List<String> tags;
  final String? text;
  final DateTime createdAt;
  final DateTime updatedAt;

  DiaryEntry copyWith({
    int? moodScore,
    List<String>? tags,
    String? text,
    DateTime? updatedAt,
    bool clearMood = false,
    bool clearText = false,
  }) {
    return DiaryEntry(
      id: id,
      date: date,
      moodScore: clearMood ? null : (moodScore ?? this.moodScore),
      tags: tags ?? this.tags,
      text: clearText ? null : (text ?? this.text),
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'moodScore': moodScore,
    'tags': tags,
    'text': text,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
    id,
    date,
    moodScore,
    tags,
    text,
    createdAt,
    updatedAt,
  ];
}

class BloodTestRecord extends Equatable {
  const BloodTestRecord({
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

  BloodTestRecord copyWith({
    DateTime? testDate,
    String? labName,
    String? testName,
    double? value,
    String? unit,
    String? referenceRange,
    String? notes,
    String? attachmentLocalPath,
    DateTime? updatedAt,
    bool clearLab = false,
    bool clearRange = false,
    bool clearNotes = false,
    bool clearAttachment = false,
  }) {
    return BloodTestRecord(
      id: id,
      testDate: testDate ?? this.testDate,
      labName: clearLab ? null : (labName ?? this.labName),
      testName: testName ?? this.testName,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      referenceRange: clearRange
          ? null
          : (referenceRange ?? this.referenceRange),
      notes: clearNotes ? null : (notes ?? this.notes),
      attachmentLocalPath: clearAttachment
          ? null
          : (attachmentLocalPath ?? this.attachmentLocalPath),
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'testDate': testDate.toIso8601String(),
    'labName': labName,
    'testName': testName,
    'value': value,
    'unit': unit,
    'referenceRange': referenceRange,
    'notes': notes,
    'attachmentLocalPath': attachmentLocalPath,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [
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
}
