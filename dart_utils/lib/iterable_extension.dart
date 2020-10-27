extension IterableExtension on Iterable {

  bool everyNull() => every((obj) => obj == null);

  Iterable<E> whereNotNull<E>() => where((element) => element != null);
}
