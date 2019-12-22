import 'package:flutter/foundation.dart';

import '../emitter/emitter.dart';

abstract class Task<TArg, TResult> {

  final onCompleteEmitter = Emitter<TResult>();
  final onErrorEmitter = Emitter<Exception>();

  final _argToFutureCountMap = <TArg, int>{};

  Future<TResult> execute(TArg arg) {
    _argToFutureCountMap[arg]++;
    return createAndConfigureTaskFuture(arg);
  }

  bool isExecuting(TArg arg) => _argToFutureCountMap[arg] == 0;

  @protected
  Future<TResult> createAndConfigureTaskFuture(TArg arg) async {
    try {
      TResult result = await createTaskFuture(arg);
      _argToFutureCountMap[arg]--;
      onCompleteEmitter.emitEvent(result);
      return result;
    } catch (exception) {
      _argToFutureCountMap[arg]--;
      onErrorEmitter.emitEvent(exception);
    }
  }

  @protected
  Future<TResult> createTaskFuture(TArg arg);
}
