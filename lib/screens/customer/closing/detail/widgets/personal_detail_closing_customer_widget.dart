import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/accordion_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDetailClosingCustomerWidget extends StatelessWidget {
  const PersonalDetailClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final List<Map<String, dynamic>> personalInformation = [
          {
            "field": "Nama Lengkap",
            "value": closingCustomerController.detailClosingCustomer.value!.fullName,
          },
          {
            "field": "NIK",
            "value": closingCustomerController.detailClosingCustomer.value!.nik,
          },
          {
            "field": "Jenis Kelamin",
            "value": closingCustomerController.detailClosingCustomer.value!.gender == "male" ? "Laki-laki" : "Perempuan",
          },
          {
            "field": "Nomor Telepon",
            "value": "085739206149" // TODO
          },
        ];
        return AccordionGlobalWidget(
          title: "Personal",
          widgetItems: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personalInformation.length,
            itemBuilder: (context, index) {
              final data = personalInformation[index];
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
