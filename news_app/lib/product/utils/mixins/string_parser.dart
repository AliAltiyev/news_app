import '../exceptions/perse_exception.dart';

mixin StringParser {
  bool? stringParser(String deviceVersion, String databaseVersion) {
    final splitedDeviceVersion = deviceVersion.split('.').join();
    final splitedDatabaseVersion = databaseVersion.split('.').join();

    try {
      final parsedDeviceVersion = int.tryParse(splitedDeviceVersion);
      final parsedDatabaseVersion = int.tryParse(splitedDatabaseVersion);

      if (parsedDatabaseVersion != null && parsedDeviceVersion != null) {
        return parsedDeviceVersion < parsedDatabaseVersion;
      } else {
        throw Exception('DeviceVersion  or DatabaseVersion is null');
      }
    } on ParseException catch (e) {
      throw ParseException(exception: e.toString());
    }
  }
}
