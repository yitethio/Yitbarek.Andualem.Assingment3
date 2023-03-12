import 'package:flutter_application_1/model/item.dart';

import '../service/apiservice.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'go_asbeza_event.dart';
part 'go_asbeza_state.dart';

class AsbezaBloc extends Bloc<GoasbezaEvent, GoAsbezaState> {
  final apiServiceProvider = ApiServiceProvider();
  List Histo = [];
  AsbezaBloc() : super(GoAsbezaInitial()) {
    on<GoasbezaEvent>((event, emit) async {
      emit(GoAsbezaloding());
      try {
        final activity = await apiServiceProvider.fetchActivity();

        emit(GoAsbezaIsucsess(Goasbeza: activity!, Histo: Histo));
      } catch (e) {
        emit(GoAsbezaInitial());
      }
    });
    on<Histoevent>((event, emit) => {Histo.add(event.data)});
  }
}
