import 'package:flutter/foundation.dart';

import '../emitter/emitter.dart';

/// Настройка, сохраняющаяся при закрытии приложения.
///
/// Например, сколько раз пользователь открыл приложение или стоит ли отображать дату на постах. Значение, которое
/// сохраняется в настройках, НЕ должно быть коллекцией. Списки следует хранить в базе данных. Настройка является
/// единичным объектом.
abstract class Setting<TData> {

  final onChangedEmitter = Emitter<TData>();

  Future<void> set(TData data) async {
    await setInternal(data);
    onChangedEmitter.emitEvent(data);
  }

  Future<TData> get() => getInternal();

  Future<void> reset() => resetInternal();

  @protected
  Future<void> setInternal(TData data);

  @protected
  Future<TData> getInternal();

  @protected
  Future<void> resetInternal();
}
