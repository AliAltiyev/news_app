// ignore_for_file: public_member_api_docs, sort_constructors_first
class ParseException implements Exception {
  String exception;
  ParseException({
    required this.exception,
  });

  @override
  String toString() {
    return 'Can not parse $exception ';
  }
}
