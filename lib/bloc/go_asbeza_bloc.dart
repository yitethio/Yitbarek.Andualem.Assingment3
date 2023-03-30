import 'package:flutter_application_1/model/item.dart';

import '../model/servic.dart';
import '../service/apiservice.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'go_asbeza_event.dart';
part 'go_asbeza_state.dart';

class AsbezaBloc extends Bloc<GoasbezaEvent, GoAsbezaState> {
  final apiServiceProvider = ApiServiceProvider();
  final _service = Service();
  List Histo = [];
  List HistoLoad = [];
  AsbezaBloc() : super(GoAsbezaInitial()) {
    on<GoasbezaEvent>((event, emit) async {
      emit(GoAsbezaloding());
      try {
        final activity = await apiServiceProvider.fetchActivity();
        await _service.readGoAsbeza().then((val) => {
              Histo = val,
            });
        HistoLoad = Item.historyList(Histo);

        emit(GoAsbezaIsucsess(Goasbeza: activity!, Histo: HistoLoad));
      } catch (e) {
        emit(GoAsbezaInitial());
      }
    });
    on<Histoevent>((event, emit) => {
          {
            HistoLoad.add(event.data),
            _service.saveGoAsbeza(event.data),
          }
        });
  }
}
