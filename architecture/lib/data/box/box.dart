import '../emitter/emitter.dart';

/// Хранилище для данных в оперативной памяти. Используется для хранения общих для нескольких экранов данных.
/// Например, профиль авторизованного пользователя.
abstract class Box<TData> {
  
  final onChangedEmitter = Emitter<TData>();

  TData _data;

  TData get data => _data;

  set data(TData data) {
    _data = data;
    onChangedEmitter.emitEvent(data);
  }
}
