import 'phase.dart';
import 'phase_item.dart';

/// A condition in a Phase. It is a question to be answered by YES or NO.
///
/// A condition, if answered YES, activates a subphase. During the subphase
/// activation, the condition as a PhaseItem remains active. A condition is
/// finished when its sub phase is completed.
class Condition extends PhaseItem {
  final String value;
  final Phase subPhase;
  Condition(this.value, this.subPhase);

  @override
  void activate() {
    subPhase.start();
    super.activate();
  }

  /// This forces a finish of the condition and its sub phase! The normal way
  /// shall be by finishing the sub phase, not calling this method.
  /// todo: assess if this is actually required, otherwise remove it.
  @override
  void finish() {
    if (subPhase.isPending) subPhase.start();
    while(subPhase.isNotDone) {
      subPhase.next();
    }
    super.finish();
  }

  @override
  void reset() {
    subPhase.reset();
    super.reset();
  }
}