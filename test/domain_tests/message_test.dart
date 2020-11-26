import 'package:flutter_test/flutter_test.dart';
import 'package:auto_checklist_app/domain/message.dart';

void main() {
  group('On construction', () {
    
    Message message;
    
    setUp(() {
      message = Message('Message text...');
    });
    
    test('A Message has a value', () {
      expect(message.value, 'Message text...');
    });

    test('A Message value cannot be null', () {
      expect(() => Message(null), throwsAssertionError);
    });
  });
}