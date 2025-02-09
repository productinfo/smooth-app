import 'package:latlong2/latlong.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

/// Location as expected from OSM.
class OsmLocation {
  const OsmLocation({
    required this.osmId,
    required this.osmType,
    required this.longitude,
    required this.latitude,
    this.name,
    this.street,
    this.city,
    this.postcode,
    this.country,
    this.countryCode,
  });

  final int osmId;
  final LocationOSMType osmType;
  final double longitude;
  final double latitude;
  final String? name;
  final String? street;
  final String? city;
  final String? postcode;
  final String? country;
  final String? countryCode;

  LatLng getLatLng() => LatLng(latitude, longitude);

  /// Returns a typical ListTile title text, or null if empty.
  String? getTitle() {
    final StringBuffer result = StringBuffer();
    if (name != null) {
      result.write(name);
    }
    if (street != null) {
      if (result.isNotEmpty) {
        result.write(', ');
      }
      result.write(street);
    }
    if (result.isEmpty) {
      return null;
    }
    return result.toString();
  }

  /// Returns a typical ListTile subtitle text, or null if empty.
  String? getSubtitle() {
    final StringBuffer result = StringBuffer();
    if (city != null) {
      result.write(city);
    }
    if (postcode != null) {
      if (result.isNotEmpty) {
        result.write(', ');
      }
      result.write(postcode);
    }
    if (country != null) {
      if (result.isNotEmpty) {
        result.write(', ');
      }
      result.write(country);
    }
    if (result.isEmpty) {
      return null;
    }
    return result.toString();
  }
}
