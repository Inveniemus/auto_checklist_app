import 'package:auto_checklist_app/utils/DEBUG_CONSTANTS.dart';

/// This abstract class is used to reflect the status of the item in its phase.
///
/// Its default value on construction is PENDING, as it is intended to be
/// created at a Phase creation.
abstract class PhaseItem {
  ITEM_STATUS status = ITEM_STATUS.pending;
  int _indent = 0;

  bool get isPending => status == ITEM_STATUS.pending;

  bool get isNotPending => !isPending;

  bool get isActive => status == ITEM_STATUS.active;

  bool get isNotActive => !isActive;

  bool get isDone => status == ITEM_STATUS.done;

  bool get isNotDone => !isDone;

  void activate() => status = ITEM_STATUS.active;

  void finish() => status = ITEM_STATUS.done;

  void reset() => status = ITEM_STATUS.pending;

  void indent() => _indent++;

  String get indentString {
    final buffer = StringBuffer();
    buffer // set required number of spaces to make indentation great again.
        .writeAll(List.filled(_indent * DEBUG_CONSTANTS.indentationSpaces, " "));
    return buffer.toString();
  }

  int get indentLength => indentString.length;

  @override
  String toString();
}

enum ITEM_STATUS { pending, active, done }
