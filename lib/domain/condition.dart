import 'phase.dart';
import 'phase_item.dart';

class Condition extends PhaseItem {
  final String value;
  final Phase subPhase;
  Condition(this.value, this.subPhase);
}