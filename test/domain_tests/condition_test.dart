import 'package:flutter_test/flutter_test.dart';

import 'package:auto_checklist_app/domain/condition.dart';
import 'package:auto_checklist_app/domain/phase.dart';
import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/response.dart';

void main() {
  Condition condition;

  setUp(() {
    final subPhase = Phase('DUMMY', [
      Challenge('CHALLENGE1', Response('RESPONSE1')),
      Challenge('CHALLENGE2', Response('RESPONSE2')),
      Challenge('CHALLENGE3', Response('RESPONSE3')),
      Challenge('CHALLENGE4', Response('RESPONSE4')),
    ]);

    condition = Condition(
        'Is this condition true?',
        subPhase
    );
  });

  group('On construction', () {
    test('The value shall be the question', () {
      expect(condition.value, 'Is this condition true?');
    });

    test('Its status shall be pending', () {
      expect(condition.isPending, true);
    });

    test('Its sub phase shall be pending', () {
      expect(condition.subPhase.isPending, true);
    });
  });

  group('on activate() method', () {

    setUp(() {
      condition.activate();
    });

    test('condition shall be active', () {
      expect(condition.isActive, true);
    });

    test('The sub phase shall be started', () {
      expect(condition.subPhase.isActive, true);
    });
  });

  group('on finish() method', () {

    setUp(() {
      condition.finish();
    });

    test('condition shall be done', () {
      expect(condition.isDone, true);
    });
  });
}