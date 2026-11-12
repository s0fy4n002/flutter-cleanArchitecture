// coverage:ignore-start
class GeneralException implements Exception {
  final String message;

  const GeneralException({required this.message});
}

// coverage:ignore-end
class ServerException implements Exception {
  final String message;

  const ServerException({required this.message});
}

class EmptyException implements Exception {
  final String message;

  const EmptyException({required this.message});
}
