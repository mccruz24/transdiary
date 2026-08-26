import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';
import 'package:transition_journal/core/utils/motion.dart';
import 'package:transition_journal/core/widgets/tj_widgets.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;
  bool _accepted = false;
  bool _enableLock = false;
  DateTime? _journeyStart;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    final repos = ref.read(repositoriesProvider);
    final gate = ref.read(biometricGateProvider);
    if (_enableLock) {
      final supported = await gate.isSupported;
      if (supported) {
        final ok = await gate.authenticate(
          reason: 'Confirm device lock for Transition Journal',
        );
        if (ok) await gate.setAppLockEnabled(true);
      }
    }
    await repos.setJourneyStartDate(_journeyStart);
    await repos.setOnboardingComplete();
    ref.invalidate(onboardingCompleteProvider);
    ref.invalidate(journeyStartProvider);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.tjColors;
    final reduceMotion = prefersReducedMotion(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colors.mist,
              colors.surfaceElevated,
              colors.sage.withValues(alpha: 0.18),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _page = i),
                  children: [
                    _WelcomePage(reduceMotion: reduceMotion),
                    _PrivacyPage(
                      accepted: _accepted,
                      onChanged: (v) => setState(() => _accepted = v),
                    ),
                    _SetupPage(
                      enableLock: _enableLock,
                      onLockChanged: (v) => setState(() => _enableLock = v),
                      journeyStart: _journeyStart,
                      onJourneyChanged: (d) =>
                          setState(() => _journeyStart = d),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Row(
                  children: [
                    if (_page > 0)
                      TextButton(
                        onPressed: () => _pageController.previousPage(
                          duration: const Duration(milliseconds: 280),
                          curve: Curves.easeOut,
                        ),
                        child: const Text('Back'),
                      ),
                    const Spacer(),
                    if (_page < 2)
                      FilledButton(
                        onPressed: (_page == 1 && !_accepted)
                            ? null
                            : () => _pageController.nextPage(
                                duration: const Duration(milliseconds: 280),
                                curve: Curves.easeOut,
                              ),
                        child: const Text('Continue'),
                      )
                    else
                      FilledButton(
                        onPressed: _accepted ? _finish : null,
                        child: const Text('Enter journal'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  const _WelcomePage({required this.reduceMotion});
  final bool reduceMotion;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(
            'Transition Journal',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 12),
          Text(
            'A calm, private space to track your regimen, reflections, and records—on your device, offline by default.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
        ],
      ),
    );
    if (!reduceMotion) {
      content = content
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: 0.06, end: 0, duration: 500.ms, curve: Curves.easeOut);
    }
    return content;
  }
}

class _PrivacyPage extends StatelessWidget {
  const _PrivacyPage({required this.accepted, required this.onChanged});
  final bool accepted;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        Text(
          'Privacy first',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        const TjDisclaimerBanner(),
        const SizedBox(height: 16),
        Text(
          'No account. No cloud sync. No analytics. Data stays on this device unless you export it.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 24),
        CheckboxListTile(
          value: accepted,
          onChanged: (v) => onChanged(v ?? false),
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text(
            'I understand this app does not provide medical advice',
          ),
        ),
      ],
    );
  }
}

class _SetupPage extends StatelessWidget {
  const _SetupPage({
    required this.enableLock,
    required this.onLockChanged,
    required this.journeyStart,
    required this.onJourneyChanged,
  });

  final bool enableLock;
  final ValueChanged<bool> onLockChanged;
  final DateTime? journeyStart;
  final ValueChanged<DateTime?> onJourneyChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        Text(
          'Optional setup',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          value: enableLock,
          onChanged: onLockChanged,
          title: const Text('App lock'),
          subtitle: const Text('Use Face ID, Touch ID, or device passcode'),
        ),
        ListTile(
          title: const Text('Journey start date'),
          subtitle: Text(
            journeyStart == null
                ? 'Optional — used for photo “Day N” labels'
                : MaterialLocalizations.of(context)
                      .formatMediumDate(journeyStart!),
          ),
          trailing: const Icon(Icons.calendar_today_outlined),
          onTap: () async {
            final now = DateTime.now();
            final picked = await showDatePicker(
              context: context,
              initialDate: journeyStart ?? now,
              firstDate: DateTime(2000),
              lastDate: now,
            );
            if (picked != null) onJourneyChanged(picked);
          },
        ),
        if (journeyStart != null)
          TextButton(
            onPressed: () => onJourneyChanged(null),
            child: const Text('Clear journey date'),
          ),
      ],
    );
  }
}
