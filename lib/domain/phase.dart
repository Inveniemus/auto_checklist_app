import 'phase_item.dart';

/// A Phase is a part of a Checklist.
///
/// It starts with the PENDING status, meaning that no item is active within.
class Phase {
  final String title;
  final List<PhaseItem> items;

  Phase(this.title, this.items) : assert(items.isNotEmpty);

  PhaseItem get activeItem =>
      items.firstWhere((item) => item.isActive, orElse: () => null);

  PHASE_STATUS get status {
    if (items.last.status == ITEM_STATUS.DONE) return PHASE_STATUS.DONE;
    if (activeItem != null) return PHASE_STATUS.ACTIVE;
    return PHASE_STATUS.PENDING;
  }

  /// Activates the Phase and the first PhaseItem, and returns it.
  PhaseItem start() {
    items.first.activate();
    return items.first;
  }

  /// Activates the next PhaseItem after the active item
  PhaseItem next() {

  }
}

enum PHASE_STATUS { PENDING, ACTIVE, DONE }
