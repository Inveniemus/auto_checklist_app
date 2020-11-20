import 'package:auto_checklist_app/utils/DEBUG_CONSTANTS.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/response.dart';
import 'package:auto_checklist_app/domain/phase_item.dart';

void main() {

  final dummyChallenge = Challenge('CHALLENGE', Response('RESPONSE'));

  test('Challenge prints correctly', () {
    var challenge = Challenge('BARO REF', Response('SET ____'));
    String output = challenge.toString();
    expect(output.length, DEBUG_CONSTANTS.lineLength);
    expect(output.substring(0, 9), 'BARO REF ');
    expect(output.endsWith('... SET ____ ?'), true);
  });

  test('A Challenge is a PhaseItem', () {
    expect(dummyChallenge, isA<PhaseItem>());
  });
}