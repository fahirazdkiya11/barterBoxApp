import '../../core/constants/variabels.dart';
import 'auth_local_datasource.dart';
import '../models/response/item_response_models.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ItemRemoteDatasource {
  Future<Either<String, ItemsResponseModel>> getItems() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/items'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return right(ItemsResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  // Future<Either<String, AddItemResponseModels>> addProduct(
  //     ItemRequestModels itemRequestModel) async {
  //   final authData = await AuthLocalDataSource().getAuthData();
  //   final Map<String, String> headers = {
  //     'Authorization': 'Bearer ${authData.token}',
  //   };
  //   var request = http.MultipartRequest(
  //       'POST', Uri.parse('${Variables.baseUrl}/api/items'));
  //   request.fields.addAll(ItemRequestModels.toMap());
  //   request.files.add(await http.MultipartFile.fromPath(
  //       'image', itemRequestModel.image.path));
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   final String body = await response.stream.bytesToString();

  //   if (response.statusCode == 201) {
  //     return right(AddItemResponseModels.fromJson(body));
  //   } else {
  //     return left(body);
  //   }
  // }
}
