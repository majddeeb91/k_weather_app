class ServerException implements Exception {}

class LocalStorageException implements Exception {}

class LocationException implements Exception {
  final String message;

  LocationException(this.message);

  @override
  String toString() {
    return message;
  }
}
