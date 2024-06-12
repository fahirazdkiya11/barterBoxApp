// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barterboxapp/data/datasources/item_local_datasource.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:barterboxapp/data/datasources/item_remote_datasource.dart';
import 'package:barterboxapp/data/models/response/item_response_models.dart';

part 'item_bloc.freezed.dart';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRemoteDatasource _itemRemoteDatasource;
  List<Item> items = [];
  ItemBloc(
    this._itemRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const ItemState.loading());
      final response = await _itemRemoteDatasource.getItems();
      response.fold(
        (l) => emit(ItemState.error(l)),
        (r) {
          items = r.data;
          emit(ItemState.success(r.data));
        },
      );
    });

    // Ini untuk Fetch Data Lokal
    on<_FetchLocal>((event, emit) async {
      final localItems = await ItemLocalDatasource.instance.getAllItem();
      items = localItems;
      emit(ItemState.success(items));
    });

    // Ini buat search data product
    on<_SearchItem>((event, emit) async {
      emit(const ItemState.loading());

      final newItem = items
          .where((element) => element.namaItem
              .toLowerCase()
              .contains(event.query.toLowerCase()))
          .toList();

      emit(ItemState.success(newItem));
    });

    // Ini buat ngembaliin ke halaman awal
    on<_FetchAllFromState>((event, emit) async {
      emit(const ItemState.loading());

      emit(ItemState.success(items));
    });
  }
}
