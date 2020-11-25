import 'package:flutter_test/flutter_test.dart';

import 'package:auto_checklist_app/domain/response.dart';

void main() {
  test("Response value is blank ('___') if constructor called with null", () {
    final response = Response(null);
    expect(response.value, '____');
  });
}