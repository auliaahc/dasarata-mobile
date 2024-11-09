import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TechnicalDetailClosingCustomerWidget extends StatelessWidget {
  const TechnicalDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> technicalInformation = [
          {
            "field": "Area Cover",
            "value": closingCustomerController.detailClosingCustomer.value!.coverageAreaId.toString(),
          },
          {
            "field": "Spliter",
            "value": closingCustomerController.detailClosingCustomer.value!.spliterId.toString(),
          },
          {
            "field": "Latitude",
            "value": closingCustomerController.detailClosingCustomer.value!.latitude.toString(),
          },
          {
            "field": "Longitude",
            "value": closingCustomerController.detailClosingCustomer.value!.longitude.toString(),
          }
        ];
        return AccordionGlobalWidget(
          title: "Teknis",
          widgetItems: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: technicalInformation.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final data = technicalInformation[index];
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
                    Text(
                      data["value"],
                      style: const TextStyle(fontSize: 14, color: Colors.black),
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
