// import 'package:barterboxapp/core/constants/variabels.dart';
// import 'package:barterboxapp/data/datasources/auth_local_datasource.dart';
// import 'package:barterboxapp/data/models/request/item_request_models.dart';
// import 'package:http/http.dart' as http;

// class OrderRemoteDatasource {
//   Future<bool> sendOrder(ItemRequestModels requestModel) async {
//     final url = Uri.parse('${Variables.baseUrl}/api/orders');
//     final authData = await AuthLocalDataSource().getAuthData();
//     final Map<String, String> headers = {
//       'Authorization': 'Bearer ${authData.token}',
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//     };
//     print(requestModel.toJson());
//     final response = await http.post(
//       url,
//       headers: headers,
//       body: requestModel.toJson(),
//     );

//     if(response.statusCode == 201) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }