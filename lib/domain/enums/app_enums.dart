enum HormoneCategory {
  estrogen,
  testosterone,
  progesterone,
  pubertyBlocker,
  antiAndrogen,
  other,
  custom;

  String get label => switch (this) {
    HormoneCategory.estrogen => 'Estrogen',
    HormoneCategory.testosterone => 'Testosterone',
    HormoneCategory.progesterone => 'Progesterone',
    HormoneCategory.pubertyBlocker => 'Puberty blocker',
    HormoneCategory.antiAndrogen => 'Anti-androgen',
    HormoneCategory.other => 'Other',
    HormoneCategory.custom => 'Custom',
  };
}

enum AdministrationRoute {
  oral,
  injection,
  topical,
  patch,
  implant,
  other,
  custom;

  String get label => switch (this) {
    AdministrationRoute.oral => 'Oral',
    AdministrationRoute.injection => 'Injection',
    AdministrationRoute.topical => 'Topical',
    AdministrationRoute.patch => 'Patch',
    AdministrationRoute.implant => 'Implant',
    AdministrationRoute.other => 'Other',
    AdministrationRoute.custom => 'Custom',
  };
}

enum DoseStatus {
  taken,
  skipped,
  missed;

  String get label => switch (this) {
    DoseStatus.taken => 'Taken',
    DoseStatus.skipped => 'Skipped',
    DoseStatus.missed => 'Missed',
  };
}

enum ReminderScheduleType {
  daily,
  weekdays,
  monthDays,
  intervalDays;

  String get label => switch (this) {
    ReminderScheduleType.daily => 'Every day',
    ReminderScheduleType.weekdays => 'Selected weekdays',
    ReminderScheduleType.monthDays => 'Selected days of the month',
    ReminderScheduleType.intervalDays => 'Every N days',
  };
}

enum NotificationPrivacyMode {
  discreet,
  detailed;

  String get label => switch (this) {
    NotificationPrivacyMode.discreet => 'Discreet',
    NotificationPrivacyMode.detailed => 'Detailed',
  };
}
