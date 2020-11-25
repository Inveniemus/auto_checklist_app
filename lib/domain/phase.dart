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
    if (items.last.status == ITEM_STATUS.done) return PHASE_STATUS.done;
    if (activeItem != null) return PHASE_STATUS.active;
    return PHASE_STATUS.pending;
  }

  bool get isPending => status == PHASE_STATUS.pending;
  bool get isNotPending => !isPending;

  bool get isActive => status == PHASE_STATUS.active;
  bool get isNotActive => !isActive;

  bool get isDone => status == PHASE_STATUS.done;
  bool get isNotDone => !isDone;

  void reset() {
    for (final item in items) {
      item.reset();
    }
  }

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
    final int phaseLength = items.length;
    if (activeIndex + 1 == phaseLength) {
      activeItem.finish();
      return null;
    } else {
      items[activeIndex + 1].activate();
      items[activeIndex].finish();
    }
    return activeItem;
  }

  void addIndent(int startIndent) {
    for (final item in items) {
      while (item.indentLength <= startIndent) {
        item.indent();
      }
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('$title\n' ?? '');
    buffer.writeAll(items, '\n');
    buffer.write('\n');
    return buffer.toString();
  }
}

enum PHASE_STATUS { pending, active, done }
