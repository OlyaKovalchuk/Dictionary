extension MapExt on Map {
  void clearAllNull() => removeWhere((key, value) => value == null);
}
