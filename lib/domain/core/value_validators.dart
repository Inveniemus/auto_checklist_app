import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateResponse(String input) {
  if (input.length < 20) {
    return right(input);
  } else {
    return left(ValueFailure.tooLongResponse(failedValue: input));
  }
}