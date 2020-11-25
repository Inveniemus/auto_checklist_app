import 'package:auto_checklist_app/utils/DEBUG_CONSTANTS.dart';

import 'phase_item.dart';

class Line extends PhaseItem {
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write(indentString);
    final underscoresList =
        List.filled(DEBUG_CONSTANTS.lineLength - indentLength - 2, '=');
    buffer.writeAll(underscoresList);
    return buffer.toString();
  }
}
