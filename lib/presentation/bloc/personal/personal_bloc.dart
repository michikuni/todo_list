import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/bloc/personal/personal_event.dart';
import 'package:todo_list/presentation/bloc/personal/personal_state.dart';

class PersonalBloc extends Bloc<PersonalEvent, PersonalState> {

  PersonalBloc()
    : super(const PersonalInitial()) {
    on<OnChangedLocale>((event, emit) {
      emit(LocaleChangedState(event.locale, state.status));
      // log(state.locale.toString());
    });

    on<OnChangedTheme>((event, emit) {
      emit(LocaleChangedState(state.locale, !state.status));
      // log(state.status.toString());
    });
  }
}
