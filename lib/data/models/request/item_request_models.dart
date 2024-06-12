// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

class ItemRequestModels {
  final int userId;
  final String namaPemilik;
  final String namaItem;
  final String status;
  final String catatanTambahan;
  final XFile image;
  final String lokasi;

  ItemRequestModels({
    required this.userId,
    required this.namaPemilik,
    required this.namaItem,
    required this.status,
    required this.catatanTambahan,
    required this.image,
    required this.lokasi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'namaPemilik': namaPemilik,
      'namaItem': namaItem,
      'status': status,
      'catatanTambahan': catatanTambahan,
      'lokasi': lokasi,
    };
  } 
}
