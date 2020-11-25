import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/check_list.dart';
import 'package:auto_checklist_app/domain/phase.dart';
import 'package:auto_checklist_app/domain/response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CheckList checkList;

  setUp(() {
    checkList = CheckList('Check List', [
      Phase('PHASE1', [
        Challenge('CHALLENGE11', Response('RESPONSE11')),
        Challenge('CHALLENGE12', Response('RESPONSE12')),
        Challenge('CHALLENGE13', Response('RESPONSE13')),
        Challenge('CHALLENGE14', Response('RESPONSE14')),
      ]),
      Phase('PHASE2', [
        Challenge('CHALLENGE21', Response('RESPONSE21')),
        Challenge('CHALLENGE22', Response('RESPONSE22')),
        Challenge('CHALLENGE23', Response('RESPONSE23')),
        Challenge('CHALLENGE24', Response('RESPONSE24')),
      ]),
      Phase('PHASE3', [
        Challenge('CHALLENGE31', Response('RESPONSE31')),
        Challenge('CHALLENGE32', Response('RESPONSE32')),
        Challenge('CHALLENGE33', Response('RESPONSE33')),
        Challenge('CHALLENGE34', Response('RESPONSE34')),
      ]),
    ]);
  });

  group('CheckList constructor', () {
    test('No title shall not be possible', () {
      expect(() => CheckList(null, []), throwsAssertionError);
    });

    test('No Phases shall not be possible', () {
      expect(() => CheckList('A check-list', []), throwsAssertionError);
    });

    test('On construction, a check-list shall be pending', () {
      expect(checkList.status, CHECK_LIST_STATUS.pending);
    });
  });

  group('Status getter', () {
    test('On construction, a check-list is pending', () {
      expect(checkList.isPending, true);
      expect(checkList.isActive, false);
      expect(checkList.isDone, false);
    });

    test('When the first phase is active, the check-list is active', () {
      checkList.phases.first.start();
      expect(checkList.isPending, false);
      expect(checkList.isActive, true);
      expect(checkList.isDone, false);
    });

    test('When the last phase is done, the check-list shall be done', () {
      // Activate all items one by one until last phase is done
      for (final phase in checkList.phases) {
        if (phase.isPending) phase.start();
        while (phase.isNotDone) {
          phase.next();
        }
      }
      expect(checkList.isDone, true);
    });
  });

  group('Start() method', () {});
}
