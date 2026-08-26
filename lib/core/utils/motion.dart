import 'package:flutter/material.dart';

/// Shared reduced-motion helper for intentional animations.
bool prefersReducedMotion(BuildContext context) {
  return MediaQuery.maybeOf(context)?.disableAnimations ?? false;
}
