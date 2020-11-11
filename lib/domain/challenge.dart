import 'phase_item.dart';
import 'response.dart';
import '../utils/DEBUG_CONSTANTS.dart';

class Challenge extends PhaseItem {
  final String value;
  final Response response;

  Challenge(this.value, this.response);

  @override
  String toString() {
    var numberOfDots =
        DEBUG_CONSTANTS.lineLength - value.length - response.value.length - 2;
    var dotsList = List.filled(numberOfDots, '.');
    var buffer = StringBuffer();
    buffer.writeAll(dotsList);
    return value + ' ' + buffer.toString() + ' ' + response.value;
  }
}
