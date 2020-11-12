import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/response.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_checklist_app/domain/phase.dart';

void main() {
  Phase dummyPhase1, donePhase, almostDone;

  setUp(() {
    dummyPhase1 = Phase('dummy', [
      Challenge('CHALLENGE1', Response('RESPONSE1')),
      Challenge('CHALLENGE2', Response('RESPONSE2')),
      Challenge('CHALLENGE3', Response('RESPONSE3')),
      Challenge('CHALLENGE4', Response('RESPONSE4')),
    ]);

    donePhase = Phase('done', [
      Challenge('DONE_CHALLENGE', Response('RESPONSE'))..finish(),
    ]);

    almostDone = Phase('dummy', [
      Challenge('CHALLENGE1', Response('RESPONSE1'))..finish(),
      Challenge('CHALLENGE2', Response('RESPONSE2'))..finish(),
      Challenge('CHALLENGE3', Response('RESPONSE3'))..finish(),
      Challenge('CHALLENGE4', Response('RESPONSE4'))..activate(),
    ]);
  });

  test('A phase has one or more items', () {
    expect(dummyPhase1.items, isNotNull);
    expect(dummyPhase1.items, isNotEmpty);
  });

  test('On construction, a phase shall be pending', () {
    expect(dummyPhase1.status, PHASE_STATUS.PENDING);
  });

  test('On start, a phase shall have its first item active', () {
    dummyPhase1.start();
    expect(dummyPhase1.status, PHASE_STATUS.ACTIVE);
    expect(dummyPhase1.items.first.isActive, true);
  });

  test('On start, active index shall be 0', () {
    expect(dummyPhase1.activeIndex, equals(-1));
    dummyPhase1.start();
    expect(dummyPhase1.activeIndex, equals(0));
  });

  test(
      'A Phase with all its items DONE shall be DONE and active index shall'
      ' return -1', () {
    expect(donePhase.status, PHASE_STATUS.DONE);
    expect(donePhase.activeIndex, -1);
    expect(donePhase.activeItem, null);
  });

  group('Phase.next() method', () {
    test('Phase.next() called on a just started Phase shall return the second'
        ' PhaseItem and return 1 as activeIndex', () {
      dummyPhase1.start();
      dummyPhase1.next();
      expect(dummyPhase1.activeIndex, 1);
      expect(dummyPhase1.activeItem, isA<Challenge>());
      if (dummyPhase1 is Challenge) {
        var title = dummyPhase1.title;
        expect(title, 'CHALLENGE2');
      }
    });

    test('Phase.next() called on a Phase with the last item active shall become'
        ' DONE', () {
      almostDone.next();
      expect(almostDone.isDone, isTrue);
    });
  });
}
