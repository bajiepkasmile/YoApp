abstract class Setting<TData> {

  Future<TData> get();

  Future<void> set(TData data);

  Future clear();
}
