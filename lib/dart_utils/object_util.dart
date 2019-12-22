class ObjectUtil {

  static bool isAllNull(List<Object> objs) {
    for (final obj in objs) {
      if (obj != null) return false;
    }
    return true;
  }
}
