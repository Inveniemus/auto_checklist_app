import '../utils/DEBUG_CONSTANTS.dart';
import 'phase_item.dart';
import 'response.dart';

class Challenge extends PhaseItem {
  final String value;
  final Response response;

  Challenge(this.value, this.response);

  @override
  String toString() {
    // Dots calculation and building
    final numberOfDots =
        DEBUG_CONSTANTS.lineLength - value.length - response.value.length - 4;
    assert(numberOfDots > 0);
    final dotsList = List.filled(numberOfDots, '.');
    final buffer = StringBuffer();
    buffer.writeAll(dotsList);

    // Status
    String statusStr;
    switch(status) {
      case ITEM_STATUS.pending:
        statusStr = ' ?';
        break;
      case ITEM_STATUS.done:
        statusStr = ' -';
        break;
      case ITEM_STATUS.active:
        statusStr = ' !';
        break;
      default:
        statusStr = '?!';
    }

    return '$value $buffer ${response.value}$statusStr';
  }
}
