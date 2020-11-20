import 'package:auto_checklist_app/utils/DEBUG_CONSTANTS.dart';

import 'phase_item.dart';

class Line extends PhaseItem {
  @override
  String toString() {
    var underscoresList = List.filled(DEBUG_CONSTANTS.lineLength - 2, '_');
    var buffer = StringBuffer();
    buffer.writeAll(underscoresList);
    return buffer.toString();
  }
}