import 'phase_item.dart';

/// A Phase is a part of a Checklist.
///
/// It starts with the PENDING status, meaning that no item is active within.
class Phase {
  final String title;
  final List<PhaseItem> items;

  Phase(this.title, this.items) : assert(items.isNotEmpty);

  // Todo: Make it unrepresentable if no active item
  PhaseItem get activeItem =>
      items.firstWhere((item) => item.isActive, orElse: () => null);

  int get activeIndex => activeItem == null ? -1 : items.indexOf(activeItem);

  PHASE_STATUS get status {
    if (items.last.status == ITEM_STATUS.done) return PHASE_STATUS.DONE;
    if (activeItem != null) return PHASE_STATUS.ACTIVE;
    return PHASE_STATUS.PENDING;
  }

  bool get isPending => status == PHASE_STATUS.PENDING;
  bool get isActive => status == PHASE_STATUS.ACTIVE;
  bool get isDone => status == PHASE_STATUS.DONE;

  /// Activates the Phase and the first PhaseItem, and returns it.
  PhaseItem start() {
    assert(isPending);
    items.first.activate();
    return items.first;
  }

  /// Activates the next PhaseItem after the active item, mark the active item
  /// as DONE, and return the new active item. If it was the last item, it
  /// simply mark it as DONE and returns null;
  PhaseItem next() {
    assert(isActive);
    int phaseLength = items.length;
    if (activeIndex + 1 == phaseLength) {
      activeItem.finish();
      return null;
    } else {
      items[activeIndex + 1].activate();
      items[activeIndex].finish();
    }
    return activeItem;
  }

  @override
  String toString() {
    String formattedString = title + '\n' ?? '';
    for (var item in items) {
      formattedString += item.toString() + '\n';
    }
    return formattedString;
  }
}

enum PHASE_STATUS { PENDING, ACTIVE, DONE }
