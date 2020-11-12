/// This abstract class is used to reflect the status of the item in its phase.
///
/// Its default value on construction is PENDING, as it is intended to be
/// created at a Phase creation.
abstract class PhaseItem {
  ITEM_STATUS status = ITEM_STATUS.PENDING;

  bool get isActive => status == ITEM_STATUS.ACTIVE;

  void activate() => status = ITEM_STATUS.ACTIVE;
  void finish() => status = ITEM_STATUS.DONE;
}

enum ITEM_STATUS { PENDING, ACTIVE, DONE }
