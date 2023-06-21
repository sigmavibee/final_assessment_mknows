part of 'num_count_bloc.dart';

@freezed
class NumCountEvent with _$NumCountEvent {
  const factory NumCountEvent.onGetResultNumber1(int number) =
      NumCountEventGetResultNumber1;
  const factory NumCountEvent.onGetResultNumber2(int number) =
      NumCountEventGetResultNumber2;
  const factory NumCountEvent.onGetResultNumber3(int number) =
      NumCountEventGetResultNumber3;
  const factory NumCountEvent.onGetResultNumber4(int number) =
      NumCountEventGetResultNumber4;
}
