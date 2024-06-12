part of 'item_bloc.dart';

@freezed
class ItemState with _$ItemState {
  const factory ItemState.initial() = _Initial;
  const factory ItemState.loading() = _Loading;
  const factory ItemState.success(List<Item> Items) = _Success;
  const factory ItemState.error(String message) = _Error;
}
