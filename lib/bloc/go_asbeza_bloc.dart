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
        HistoLoad = Item.historyList(HistoLoad);

        emit(GoAsbezaIsucsess(Goasbeza: activity!, Histo: Histo));
      } catch (e) {
        emit(GoAsbezaInitial());
      }
    });
    on<Histoevent>((event, emit) => {
          Histo.add(event.data),
          {
            HistoLoad.add(event.data),
            event.data.itemAdded = 1,
            _service.saveGoAsbeza(event.data),
          }
        });
  }
}
