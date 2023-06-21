import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'num_count_event.dart';
part 'num_count_state.dart';
part 'num_count_bloc.freezed.dart';

class NumCountBloc extends Bloc<NumCountEvent, NumCountState> {
  NumCountBloc()
      : super(NumCountState.initial(
            result: [],
            status: Status.idle,
            numberController: TextEditingController())) {
    on<NumCountEventGetResultNumber1>(_onGetResultNumber1);
    on<NumCountEventGetResultNumber2>(_onGetResultNumber2);
    on<NumCountEventGetResultNumber3>(_onGetResultNumber3);
    on<NumCountEventGetResultNumber4>(_onGetResultNumber4);
  }

//untuk hasilnya saya taro di readme ya bang

  Future<void> _onGetResultNumber1(
      NumCountEventGetResultNumber1 event, Emitter<NumCountState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> result = [];

    for (var i = 1; i <= int.parse(event.number.toString()); i++) {
      result.add(i.toString());
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }

  Future<void> _onGetResultNumber2(
      NumCountEventGetResultNumber2 event, Emitter<NumCountState> emit) async {
    final List<String> result = [];

    emit(state.copyWith(
      status: Status.loading,
    ));

    for (var i = 1; i <= int.parse(event.number.toString()); i++) {
      result.add(i.toString());

      if (i == int.parse(event.number.toString())) {
        for (var j = int.parse(event.number.toString()) - 1; j > 0; j--) {
          result.add(j.toString());
        }
      }
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }

  Future<void> _onGetResultNumber3(
      NumCountEventGetResultNumber3 event, Emitter<NumCountState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> result = [];
    int firstIndex = 10;

    for (var i = 0; i < int.parse(event.number.toString()); i++) {
      result.add((firstIndex + i * 11).toString());
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }

  Future<void> _onGetResultNumber4(
      NumCountEventGetResultNumber4 event, Emitter<NumCountState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> result = [];

    for (var i = 1; i < int.parse(event.number.toString()) + 1; i++) {
      if (i % 5 == 0) {
        result.add('Lima');
      } else if (i % 7 == 0) {
        result.add('Tujuh');
      } else {
        result.add(i.toString());
      }
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }
}
