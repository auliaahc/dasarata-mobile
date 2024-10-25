import "package:dasarata_mobile/constants/spacing_constant.dart";
import "package:dasarata_mobile/routes/app_route.dart";
import "package:dasarata_mobile/widgets/text_field_global_widget.dart";
import "package:dasarata_mobile/widgets/dropdown_field_global_widget.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class FormAddProspectCustomerWidget extends StatelessWidget {
  const FormAddProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final inputFields = [
      {
        "type": "text",
        "hint": "Masukkan nama",
        "textInputAction": TextInputAction.next,
        "keyboardType": TextInputType.text,
        "labelName": "Nama",
        "controller": null,
      },
      {
        "type": "text",
        "hint": "Masukkan alamat",
        "textInputAction": TextInputAction.next,
        "keyboardType": TextInputType.text,
        "labelName": "Alamat",
        "additionalLabel": "Maps",
        "controller": null,
        "additionalAction": () => Get.toNamed(AppRoute.home)
      },
      {
        "type": "text",
        "hint": "Masukkan nomor telepon",
        "labelName": "Nomor Telepon",
        "textInputAction": TextInputAction.next,
        "keyboardType": TextInputType.phone,
      },
      {
        "type": "dropdown",
        "hint": "Pilih metode bertemu",
        "labelName": "Metode Bertemu",
        "controller": null,
        "items": ["Chat", "Ketemu"],
      },
      {
        "type": "dropdown",
        "hint": "Pilih status awal",
        "labelName": "Status awal",
        "controller": null,
        "items": ["Ragu", "QnA", "Un-Cover", "ODP Penuh"],
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.only(top: 32, bottom: 96),
      separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
      itemCount: inputFields.length,
      itemBuilder: (context, index) {
        final inputField = inputFields[index];
        if (inputField["type"] == "text") {
          return TextFieldGlobalWidget(
            controller: TextEditingController(),
            hint: inputField["hint"] as String,
            textInputAction: inputField["textInputAction"] as TextInputAction,
            keyboardType: inputField["keyboardType"] as TextInputType,
            labelName: inputField["labelName"] as String?,
            additionalLabel: inputField["additionalLabel"] as String?,
            additionalAction: inputField["additionalAction"] as Function()?,
          );
        } else if (inputField["type"] == "dropdown") {
          return DropdownFieldGlobalWidget(
            hint: inputField["hint"] as String,
            labelName: inputField["labelName"] as String?,
            additionalLabel: inputField["additionalLabel"] as String?,
            items: (inputField["items"] as List<String>),
            value: inputField["value"] as String?,
            onChanged: (selectedValue) {},
          );
        }
        return null;
      },
    );
  }
}
