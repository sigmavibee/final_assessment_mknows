part of 'num_count_bloc.dart';

enum Status { idle, loading, succes }

@freezed
class NumCountState with _$NumCountState {
  const factory NumCountState.initial(
      {required List<String> result,
      required Status status,
      required TextEditingController numberController}) = NumCountStateInitial;
}
