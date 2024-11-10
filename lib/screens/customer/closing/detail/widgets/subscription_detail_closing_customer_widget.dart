import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionDetailClosingCustomerWidget extends StatelessWidget {
  const SubscriptionDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> subscritionInformation = [
          {
            "field": "Jenis Customer",
            "value": closingCustomerController.detailClosingCustomer.value!.customerCategory ?? "-",
          },
          {
            "field": "Paket Layanan",
            "value": closingCustomerController.detailClosingCustomer.value!.package.namePackage
          },
          {
            "field": "Program",
            "value": closingCustomerController.detailClosingCustomer.value!.program.nameProgram
          }
        ];
        return AccordionGlobalWidget(
          title: "Subscription",
          widgetItems: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: subscritionInformation.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final data = subscritionInformation[index];
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
