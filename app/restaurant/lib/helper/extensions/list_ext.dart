extension ListExt<T> on List<T> {
  List<T> forEachIndexed(Function(int index, T element) action) {
    for (int i = 0; i < length; i++) {
      action(i, this[i]);
    }
    return this;
  }
}