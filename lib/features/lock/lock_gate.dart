import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transition_journal/app/providers.dart';
import 'package:transition_journal/core/theme/tj_theme.dart';

class LockGate extends ConsumerStatefulWidget {
  const LockGate({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<LockGate> createState() => _LockGateState();
}

class _LockGateState extends ConsumerState<LockGate>
    with WidgetsBindingObserver {
  bool _checking = true;
  bool _lockEnabled = false;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _evaluate();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      if (_lockEnabled) {
        ref.read(appUnlockedProvider.notifier).state = false;
      }
    } else if (state == AppLifecycleState.resumed) {
      _evaluate();
    }
  }

  Future<void> _evaluate() async {
    setState(() {
      _checking = true;
      _failed = false;
    });
    final gate = ref.read(biometricGateProvider);
    final enabled = await gate.isAppLockEnabled;
    _lockEnabled = enabled;
    if (!enabled) {
      ref.read(appUnlockedProvider.notifier).state = true;
      if (mounted) setState(() => _checking = false);
      return;
    }
    if (ref.read(appUnlockedProvider)) {
      if (mounted) setState(() => _checking = false);
      return;
    }
    final ok = await gate.authenticate();
    if (!mounted) return;
    ref.read(appUnlockedProvider.notifier).state = ok;
    setState(() {
      _checking = false;
      _failed = !ok;
    });
  }

  @override
  Widget build(BuildContext context) {
    final unlocked = ref.watch(appUnlockedProvider);
    if (_checking) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    if (_lockEnabled && !unlocked) {
      final colors = context.tjColors;
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 48, color: colors.sage),
                const SizedBox(height: 16),
                Text(
                  'Transition Journal',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  _failed ? 'Unlock canceled. Your data stays on this device.' : 'Unlock to continue. Your diary stays private on this device.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                FilledButton(onPressed: _evaluate, child: const Text('Unlock')),
              ],
            ),
          ),
        ),
      );
    }
    return widget.child;
  }
}
