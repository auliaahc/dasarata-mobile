import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/utilities/image_preview_utils.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentationDetailClosingCustomerWidget extends StatelessWidget {
  const DocumentationDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> documentationInformation = [
          {
            "field": "Foto KTP",
            "value": closingCustomerController.detailClosingCustomer.value!.photoKtpUrl,
          },
          {
            "field": "Foto Rumah",
            "value": "https://awsimages.detik.net.id/community/media/visual/2022/11/03/gambar-dekoratif-2.jpeg?w=1200",
          },
        ];
        return AccordionGlobalWidget(
          title: "Dokumentasi",
          widgetItems: ListView.builder(
            itemCount: documentationInformation.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final data = documentationInformation[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["field"],
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                      onPressed: () {
                        ImagePreviewUtils.showFullscreenImagePreview(
                          imageUrl: data["value"],
                          heroTag: data["value"],
                        );
                      },
                      child: const Text(
                        "Lihat Pratinjau",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
