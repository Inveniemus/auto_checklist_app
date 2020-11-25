import 'phase.dart';

class CheckList {
  final String title;
  final List<Phase> phases;

  CheckList(this.title, this.phases)
      : assert(title != null),
        assert(phases.isNotEmpty);

  CHECK_LIST_STATUS get status {
    if (phases.last.isDone) return CHECK_LIST_STATUS.done;
    if (phases.first.isPending) return CHECK_LIST_STATUS.pending;
    return CHECK_LIST_STATUS.active;
  }

  bool get isPending => status == CHECK_LIST_STATUS.pending;
  bool get isNotPending => !isPending;

  bool get isActive => status == CHECK_LIST_STATUS.active;
  bool get isNotActive => !isActive;

  bool get isDone => status == CHECK_LIST_STATUS.done;
  bool get isNotDone => !isDone;
}

enum CHECK_LIST_STATUS { pending, active, done }
