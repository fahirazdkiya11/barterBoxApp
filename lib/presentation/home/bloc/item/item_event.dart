part of 'item_bloc.dart';

@freezed
class ItemEvent with _$ItemEvent {
  const factory ItemEvent.started() = _Started;
  // ini untuk fetch / ambil data dari api
  const factory ItemEvent.fetch() = _Fetch;
  // Fetch data produk dari lokal
  const factory ItemEvent.fetchLocal() = _FetchLocal;
  // Search Item
  const factory ItemEvent.searchItem(String query) = _SearchItem;
  // fetch from state
  const factory ItemEvent.fetchAllFromState() = _FetchAllFromState;
}
