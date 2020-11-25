import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/line.dart';
import 'package:auto_checklist_app/domain/response.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_checklist_app/domain/phase.dart';

void main() {
  Phase dummyPhase1, donePhase, almostDone, withALine;

  setUp(() {
    dummyPhase1 = Phase('DUMMY', [
      Challenge('CHALLENGE1', Response('RESPONSE1')),
      Challenge('CHALLENGE2', Response('RESPONSE2')),
      Challenge('CHALLENGE3', Response('RESPONSE3')),
      Challenge('CHALLENGE4', Response('RESPONSE4')),
    ]);

    donePhase = Phase('DONE', [
      Challenge('DONE_CHALLENGE', Response('RESPONSE'))..finish(),
    ]);

    almostDone = Phase('DUMMY ALMOST DONE', [
      Challenge('CHALLENGE1', Response('RESPONSE1'))..finish(),
      Challenge('CHALLENGE2', Response('RESPONSE2'))..finish(),
      Challenge('CHALLENGE3', Response('RESPONSE3'))..finish(),
      Challenge('CHALLENGE4', Response('RESPONSE4'))..activate(),
    ]);

    withALine = Phase('WITH A LINE', [
      Challenge('CHALLENGE1', Response('RESPONSE1')),
      Challenge('CHALLENGE2', Response('RESPONSE2')),
      Challenge('CHALLENGE3', Response('RESPONSE3')),
      Line(),
      Challenge('CHALLENGE4', Response('RESPONSE4')),
    ]);
  });

  test('A phase has one or more items', () {
    expect(dummyPhase1.items, isNotNull);
    expect(dummyPhase1.items, isNotEmpty);
  });

  test('On construction, a phase shall be pending', () {
    expect(dummyPhase1.status, PHASE_STATUS.pending);
  });

  test('On start, a phase shall have its first item active', () {
    dummyPhase1.start();
    expect(dummyPhase1.status, PHASE_STATUS.active);
    expect(dummyPhase1.items.first.isActive, true);
  });

  test('On construction, an empty list of items should be impossible', () {
    expect(() => Phase('WillThrow', []), throwsAssertionError);
  });

  test('On start, active index shall be 0', () {
    expect(dummyPhase1.activeIndex, equals(-1));
    dummyPhase1.start();
    expect(dummyPhase1.activeIndex, equals(0));
  });

  test(
      'A Phase with all its items DONE shall be DONE and active index shall'
      ' return -1', () {
    expect(donePhase.status, PHASE_STATUS.done);
    expect(donePhase.activeIndex, -1);
    expect(donePhase.activeItem, null);
  });

  group('Phase.next() method', () {
    test(
        'Phase.next() called on a just started Phase shall return the second'
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

    test(
        'Phase.next() called on a Phase with the last item active shall become'
        ' DONE', () {
      almostDone.next();
      expect(almostDone.isDone, isTrue);
    });
  });

  group('Phase String formatting tests', () {
    test('DummyPhase1 example shall format correctly', () {
      expect(
          dummyPhase1.toString(),
          'DUMMY\n'
          'CHALLENGE1 ......................................................... RESPONSE1 ?\n'
          'CHALLENGE2 ......................................................... RESPONSE2 ?\n'
          'CHALLENGE3 ......................................................... RESPONSE3 ?\n'
          'CHALLENGE4 ......................................................... RESPONSE4 ?\n');
    });

    test('WithALine example shall format correctly', () {
      expect(
          withALine.toString(),
          'WITH A LINE\n'
          'CHALLENGE1 ......................................................... RESPONSE1 ?\n'
          'CHALLENGE2 ......................................................... RESPONSE2 ?\n'
          'CHALLENGE3 ......................................................... RESPONSE3 ?\n'
          '______________________________________________________________________________\n'
          'CHALLENGE4 ......................................................... RESPONSE4 ?\n');
    });
  });

  group('reset() method tests', () {
    test('reset() changes the status of the Phase to pending', () {
      almostDone.reset();
      expect(almostDone.isPending, true);
      expect(
          almostDone.items
              .indexWhere((element) => element.isNotPending == true),
          -1);
    });
  });
}
