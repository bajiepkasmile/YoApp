import '../../domain/event_emitter/event_emitter.dart';

/// Хранилище для данных в оперативной памяти. Используется для хранения общих для нескольких экранов данных.
/// Например, профиль авторизованного пользователя.
abstract class Repository<TData> {
  
  final onChangedEventEmitter = EventEmitter<TData>();

  TData _data;

  TData get data => _data;

  set data(TData data) {
    _data = data;
    onChangedEventEmitter.emitEvent(data);
  }
}
