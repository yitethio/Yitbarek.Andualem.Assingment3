part of 'go_asbeza_bloc.dart';

class GoasbezaEvent extends Equatable {
  const GoasbezaEvent();
  @override
  List<Object> get props => [];
}

class GoasbezaFetchEvent extends GoasbezaEvent {
  const GoasbezaFetchEvent();
  @override
  List<Object> get props => [];
}

class Histoevent extends GoasbezaEvent {
  final Item goasbeza;
  const Histoevent({required this.goasbeza});

  @override
  List<Object> get props => [];

  get data => goasbeza;
}
