import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';
import 'package:transition_journal/domain/enums/app_enums.dart';
import 'package:transition_journal/domain/models/models.dart';
import 'package:transition_journal/features/onboarding/onboarding_screen.dart';
import 'package:transition_journal/features/regimens/dose_log_sheet.dart';

Regimen _sampleRegimen() {
  final now = DateTime(2026, 1, 1);
  return Regimen(
    id: 'r1',
    category: HormoneCategory.estrogen,
    medicationName: 'Estradiol',
    doseAmount: 2,
    doseUnit: 'mg',
    route: AdministrationRoute.oral,
    startDate: now,
    isActive: true,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  testWidgets('disclaimer banner shows clinician guidance', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildTjTheme(brightness: Brightness.light),
        home: const Scaffold(body: TjDisclaimerBanner()),
      ),
    );
    await tester.pump();
    expect(find.textContaining('qualified clinician'), findsOneWidget);
    expect(find.textContaining('medical advice'), findsOneWidget);
  });

  testWidgets('onboarding requires disclaimer acceptance', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: buildTjTheme(brightness: Brightness.light),
          home: const OnboardingScreen(),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Transition Journal'), findsWidgets);

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle(const Duration(milliseconds: 400));
    expect(find.text('Privacy first'), findsOneWidget);

    final continueBtn = find.widgetWithText(FilledButton, 'Continue');
    expect(tester.widget<FilledButton>(continueBtn).onPressed, isNull);

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pump();
    expect(tester.widget<FilledButton>(continueBtn).onPressed, isNotNull);
  });

  testWidgets('dose log sheet exposes non-prescriptive statuses', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: buildTjTheme(brightness: Brightness.light),
          home: Scaffold(body: DoseLogSheet(regimens: [_sampleRegimen()])),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Log a dose'), findsOneWidget);
    expect(find.textContaining('will not suggest'), findsOneWidget);
    expect(find.text('Taken'), findsOneWidget);
    expect(find.text('Skipped'), findsOneWidget);
    expect(find.text('Missed'), findsOneWidget);
  });

  test('dose status labels are non-prescriptive', () {
    expect(DoseStatus.taken.label, 'Taken');
    expect(DoseStatus.skipped.label, 'Skipped');
    expect(DoseStatus.missed.label, 'Missed');
  });
}
