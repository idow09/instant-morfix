import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class FocusState {
  const FocusState();
}

class FocusEvent extends Equatable {
  const FocusEvent();

  @override
  List<Object> get props => [];
}

class FocusBloc extends Bloc<FocusEvent, FocusState> {
  @override
  FocusState get initialState => FocusState();

  @override
  Stream<FocusState> mapEventToState(FocusEvent event) async* {
    if (event is FocusEvent) {
      yield FocusState();
    }
  }
}
