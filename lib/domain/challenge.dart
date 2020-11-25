import '../utils/DEBUG_CONSTANTS.dart';
import 'phase_item.dart';
import 'response.dart';

class Challenge extends PhaseItem {
  final String value;
  final Response response;

  Challenge(this.value, this.response);

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write(indentString);
    buffer.write(value);
    final numberOfDots = DEBUG_CONSTANTS.lineLength -
        indentLength -
        value.length -
        response.value.length -
        2;
    assert(numberOfDots > 0);
    buffer.writeAll(List.filled(numberOfDots, '.'));

    buffer.write(response.value);

    // Status
    switch (status) {
      case ITEM_STATUS.pending:
        buffer.write(' ?');
        break;
      case ITEM_STATUS.done:
        buffer.write(' -');
        break;
      case ITEM_STATUS.active:
        buffer.write(' !');
        break;
      default:
        buffer.write('?!');
    }

    return buffer.toString();
  }
}
