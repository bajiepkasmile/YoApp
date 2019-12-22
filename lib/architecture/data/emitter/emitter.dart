import '../../presentation/reaction/reaction.dart';

/// Излучатель непользовательских событий. Например, малый заряд батареи или новое сообщение от контакта.
class Emitter<TArg> {

  final _reactions = <Reaction<TArg>>[];

  void addReaction(Reaction<TArg> reaction) => _reactions.add(reaction);

  void removeReaction(Reaction<TArg> reaction) => _reactions.remove(reaction);

  void emitEvent(TArg arg) => _reactions.forEach((reaction) => reaction.excite(arg));
}
