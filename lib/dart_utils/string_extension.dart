extension ColorExtension on String {

  String insert(String insertion, int index) => substring(0, index) + insertion + substring(index, length);
}
