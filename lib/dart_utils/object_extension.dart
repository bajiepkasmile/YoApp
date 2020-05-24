extension ObjectExtension on Object {

  bool oneOf(Iterable<Object> iterable) {
    for (final object in iterable) {
      if (object == this) {
        return true;
      }
    }
    return false;
  }
}
