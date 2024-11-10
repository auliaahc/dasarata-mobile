import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressDetailClosingCustomerWidget extends StatelessWidget {
  const AddressDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> addressInformation = [
          {
            "field": "Alamat Terpasang",
            "value": closingCustomerController.detailClosingCustomer.value!.installedAddress,
          },
          {
            "field": "Alamat Domisili",
            "value": closingCustomerController.detailClosingCustomer.value!.domicileAddress,
          },
          {
            "field": "Provinsi",
            "value": closingCustomerController.detailClosingCustomer.value!.provinces.name,
          },
          {
            "field": "Kota",
            "value": closingCustomerController.detailClosingCustomer.value!.regency.name,
          },
          {
            "field": "Kecamatan",
            "value": closingCustomerController.detailClosingCustomer.value!.district.name,
          },
          {
            "field": "Dusun",
            "value": closingCustomerController.detailClosingCustomer.value!.village.name,
          },
          {
            "field": "RT",
            "value": closingCustomerController.detailClosingCustomer.value!.rt,
          },
          {
            "field": "RW",
            "value": closingCustomerController.detailClosingCustomer.value!.rw,
          },
        ];
        return AccordionGlobalWidget(
          title: "Alamat",
          widgetItems: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: addressInformation.length,
            itemBuilder: (context, index) {
              final data = addressInformation[index];
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
