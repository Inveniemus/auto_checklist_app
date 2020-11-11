import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/response.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_checklist_app/domain/phase.dart';

void main() {
  var dummyPhase1 = Phase('dummy', [
    Challenge('CHALLENGE1', Response('RESPONSE1')),
    Challenge('CHALLENGE2', Response('RESPONSE2')),
    Challenge('CHALLENGE3', Response('RESPONSE3')),
    Challenge('CHALLENGE4', Response('RESPONSE4')),
  ]);

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
}
