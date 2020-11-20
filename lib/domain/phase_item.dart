/// This abstract class is used to reflect the status of the item in its phase.
///
/// Its default value on construction is PENDING, as it is intended to be
/// created at a Phase creation.
abstract class PhaseItem {
  ITEM_STATUS status = ITEM_STATUS.pending;

  bool get isActive => status == ITEM_STATUS.active;

  void activate() => status = ITEM_STATUS.active;
  void finish() => status = ITEM_STATUS.done;

  @override
  String toString();
}

enum ITEM_STATUS { pending, active, done }
