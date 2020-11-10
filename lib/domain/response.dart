/// A response to a challenge is one or a few words, and may be blank in the
/// check-list in case of a value to be given back. (Example: QNH.....____)
class Response {
  final String _value;
  Response(this._value);

  String get value => _value ?? '____'; // A blank response

  @override
  String toString() => value;
}
