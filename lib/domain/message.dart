import 'phase_item.dart';

class Message extends PhaseItem {
  final String value;
  Message(this.value) : assert(value != null);
}