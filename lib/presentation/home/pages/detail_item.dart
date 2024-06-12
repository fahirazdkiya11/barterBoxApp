import 'package:barterboxapp/core/constants/variabels.dart';
import 'package:barterboxapp/data/models/response/item_response_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:barterboxapp/core/constants/colors.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://whatsform.com/nIZtDr');

class DetailItemPage extends StatelessWidget {
  final Item data;
  const DetailItemPage({
    super.key,
    required this.data,
  });

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    var unescape = HtmlUnescape();
    // Decode HTML entities and remove HTML tags
    String descriptionWithoutHtml =
        removeHtmlTags(unescape.convert(data.catatanTambahan));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 28,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detail Item',
          style: TextStyle(
            color: AppColors.primary,
            letterSpacing: 3,
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.primary,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '2',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
                imageUrl: '${Variables.imageBaseUrl}${data.image}',
                width: 365,
                height: 365,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                        height: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('yyyy-MM-dd – kk:mm')
                                  .format(data.createdAt),
                              style: const TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            data.lokasi,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.namaItem,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        descriptionWithoutHtml,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const InkWell(
                            onTap: _launchUrl,
                            child: Center(
                              child: Text(
                                'Chat Via WhatsApp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception("Could not launch $_url");
  }
}



















