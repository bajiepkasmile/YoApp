import 'package:flutter/foundation.dart';

import '../../domain/event_emitter/event_emitter.dart';

/// Настройка, сохраняющаяся при закрытии приложения.
///
/// Например, сколько раз пользователь открыл приложение или стоит ли отображать дату на постах. Значение, которое
/// сохраняется в настройках, НЕ должно быть коллекцией. Списки следует хранить в базе данных. Настройка является
/// единичным объектом.
abstract class Setting<TData> {

  final onChangedEventEmitter = EventEmitter<TData>();

  Future<void> set(TData data) async {
    await setInternal(data);
    onChangedEventEmitter.emitEvent(data);
  }

  TData get() => getInternal();

  Future<void> reset();

  @protected
  Future<void> setInternal(TData data);

  @protected
  TData getInternal();
}
