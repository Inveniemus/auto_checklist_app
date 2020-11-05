import 'package:auto_checklist_app/domain/core/failures.dart';
import 'package:auto_checklist_app/domain/core/value_object.dart';
import 'package:auto_checklist_app/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class Response extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Response(String input) {
    assert(input != null);
    return Response._(
      validateResponse(input)
    );
  }

  const Response._(this.value);
}