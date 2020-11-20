import 'phase_item.dart';
import 'response.dart';
import '../utils/DEBUG_CONSTANTS.dart';

class Challenge extends PhaseItem {
  final String value;
  final Response response;

  Challenge(this.value, this.response);

  @override
  String toString() {
    // Dots calculation and building
    var numberOfDots =
        DEBUG_CONSTANTS.lineLength - value.length - response.value.length - 4;
    assert(numberOfDots > 0);
    var dotsList = List.filled(numberOfDots, '.');
    var buffer = StringBuffer();
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

    return value + ' ' + buffer.toString() + ' ' + response.value + statusStr;
  }
}
