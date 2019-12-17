import 'package:flutter/foundation.dart';

import '../event_emitter/event_emitter.dart';

abstract class Task<TArg, TResult> {

  final onCompleteEventEmitter = EventEmitter<TResult>();
  final onErrorEventEmitter = EventEmitter<Exception>();

  final _argToFutureMap = <TArg, Future<TResult>>{};

  Future<TResult> execute(TArg arg) {
    _argToFutureMap[arg] ??= createAndConfigureTaskFuture(arg);
    return _argToFutureMap[arg];
  }

  @protected
  Future<TResult> createAndConfigureTaskFuture(TArg arg) async {
    TResult result = await createTaskFuture(arg);
    _argToFutureMap[arg] = null;
    onCompleteEventEmitter.emitEvent(result);
    return result;
  }

  @protected
  Future<TResult> createTaskFuture(TArg arg);
}
