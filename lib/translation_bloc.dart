import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:instant_morfix/translation_engine.dart';
import 'package:meta/meta.dart';

import 'models.dart';

abstract class TranslationState extends Equatable {
  const TranslationState();

  @override
  List<Object> get props => [];
}

class NoTranslation extends TranslationState {}

class TranslationLoading extends TranslationState {}

class TranslationLoaded extends TranslationState {
  final FullTranslation translation;

  const TranslationLoaded({@required this.translation})
      : assert(translation != null);

  @override
  List<Object> get props => [translation];
}

class TranslationError extends TranslationState {}

abstract class TranslationEvent extends Equatable {
  const TranslationEvent();
}

class FetchTranslation extends TranslationEvent {
  final String query;

  const FetchTranslation({@required this.query}) : assert(query != null);

  @override
  List<Object> get props => [query];
}

class TranslationBloc extends Bloc<TranslationEvent, TranslationState> {
  final TranslationEngine translationEngine;

  TranslationBloc({@required this.translationEngine})
      : assert(translationEngine != null);

  @override
  TranslationState get initialState => NoTranslation();

  @override
  Stream<TranslationState> mapEventToState(TranslationEvent event) async* {
    if (event is FetchTranslation) {
      yield TranslationLoading();
      try {
        final FullTranslation translation =
            await translationEngine.translate(event.query);
        yield TranslationLoaded(translation: translation);
      } catch (_) {
        yield TranslationError();
      }
    }
  }
}
