import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/closing/program_closing_customer_model.dart'
    as program_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/service_package_closing_customer_model.dart'
    as service_package_closing_customer_model;
import 'package:dasarata_mobile/widgets/dropdown_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/image_picker_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerFormAddClosingCustomerWidget extends StatelessWidget {
  const CustomerFormAddClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final customerTypeOptions = ["Homepass", "Bussines"];
        final inputFields = [
          {
            "type": "input",
            "hint": "Nama customer prospect",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Nama Customer Prospek",
            "enabled": false,
            "maxLines": 1,
            "controller": closingCustomerController.nameProspectController,
            "onChanged": (String value) {},
          },
          {
            "type": "dropdown",
            "hint": "Pilih jenis customer",
            "labelName": "Jenis Customer",
            "items": customerTypeOptions,
            "data": closingCustomerController.customerType.value,
            "getValue": (dynamic item) => item as String,
            "getLabel": (dynamic item) => item as String,
            "onChanged": (String? value) {
              closingCustomerController.customerType.value = value;
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih paket layanan",
            "labelName": "Paket Layanan",
            "items": closingCustomerController.servicePackagesData.value ?? [],
            "data": closingCustomerController.servicePackage.value,
            "getValue": (dynamic item) =>
                (item as service_package_closing_customer_model.Datum)
                    .id
                    .toString(),
            "getLabel": (dynamic item) =>
                (item as service_package_closing_customer_model.Datum)
                    .packageName,
            "onChanged": (String? value) {
              closingCustomerController.servicePackage.value = value;
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih promo",
            "labelName": "Promo",
            "items": closingCustomerController.programsData.value ?? [],
            "data": closingCustomerController.program.value,
            "getValue": (dynamic item) =>
                (item as program_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) =>
                (item as program_closing_customer_model.Datum).nameProgram,
            "onChanged": (String? value) {
              closingCustomerController.program.value = value;
            },
          },
          {
            "type": "input",
            "hint": "Masukkan alamat terpasang",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Alamat Terpasang",
            "controller": closingCustomerController.installedAddressController,
            "onChanged": (String value) {}
          },
          {
            "type": "image",
            "labelName": "Foto Rumah",
          }
        ];
        return Form(
          key: closingCustomerController.addClosingCustomerFormKeys[0],
          onChanged: () {},
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text("Data Customer"),
                // SpacingConstant.verticalSpacing12px,
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      SpacingConstant.verticalSpacing16px,
                  itemCount: inputFields.length,
                  itemBuilder: (context, index) {
                    final inputField = inputFields[index];
                    if (inputField["type"] == "input") {
                      return TextFieldGlobalWidget(
                        controller:
                            inputField["controller"] as TextEditingController,
                        hint: inputField["hint"] as String,
                        textInputAction:
                            inputField["textInputAction"] as TextInputAction,
                        keyboardType:
                            inputField["keyboardType"] as TextInputType,
                        labelName: inputField["labelName"] as String?,
                        onChanged: inputField["onChanged"] as Function(String)?,
                        maxLines: inputField["maxLines"] as int?,
                        validator: inputField["validator"] as String? Function(
                            String?)?,
                        enabled: inputField["enabled"] as bool?,
                      );
                    } else if (inputField["type"] == "image") {
                      return ImagePickerFieldGlobalField(
                        hint: "Pilih gambar",
                        labelName: inputField["labelName"] as String?,
                      );
                    } else {
                      return DropdownFieldGlobalWidget(
                        hint: inputField["hint"] as String,
                        labelName: inputField["labelName"] as String,
                        items: inputField["items"] as List<dynamic>,
                        value: inputField["data"] as String?,
                        getValue:
                            inputField["getValue"] as String Function(dynamic),
                        getLabel:
                            inputField["getLabel"] as String Function(dynamic),
                        onChanged: inputField["onChanged"] as Function(String?),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
