import 'package:auto_checklist_app/domain/phase_item.dart';
import 'package:flutter_test/flutter_test.dart';

class DummyPhaseItem extends PhaseItem {}

void main() {
  DummyPhaseItem dummy;

  setUpAll(() {
    dummy = DummyPhaseItem();
  });

  test('A PhaseItem is pending on construction', () {
    expect(dummy.isPending, true);
    expect(dummy.isActive, false);
    expect(dummy.isDone, false);
  });

  test('Activating a PhaseItem works', () {
    dummy.activate();
    expect(dummy.isPending, false);
    expect(dummy.isActive, true);
    expect(dummy.isDone, false);
  });

  test('Finishing a PhaseItem works', () {
    dummy.finish();
    expect(dummy.isPending, false);
    expect(dummy.isActive, false);
    expect(dummy.isDone, true);
  });

  test('Resetting a PhaseItem works', () {
    dummy.finish();
    dummy.reset();
    expect(dummy.isPending, true);
    expect(dummy.isActive, false);
    expect(dummy.isDone, false);
  });

  test('indentString getter', () {
    expect(dummy.indentString, '');
    dummy.indent();
    expect(dummy.indentString, '  ');
  });
}