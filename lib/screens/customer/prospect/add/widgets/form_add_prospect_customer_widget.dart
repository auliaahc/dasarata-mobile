import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/routes/app_route.dart';
import 'package:dasarata_mobile/utilities/validator_input_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart' as meet_prospect_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/category_prospect_customer_model.dart' as category_prospect_customer_model;
import 'package:dasarata_mobile/widgets/dropdown_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';

class FormAddProspectCustomerWidget extends StatelessWidget {
  const FormAddProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.find();
    return Obx(
      () {
        final inputFields = [
          {
            "type": "input",
            "hint": "Masukkan nama",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Nama",
            "controller": prospectCustomerController.nameController,
            "onChanged": (String value) => prospectCustomerController.name.value = value,
          },
          {
            "type": "input",
            "hint": "Masukkan alamat",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Alamat",
            "additionalLabel": "Maps",
            "controller": prospectCustomerController.addressController,
            "additionalAction": () => Get.toNamed(AppRoute.prospectMaps),
            "onChanged": (String value) => prospectCustomerController.address.value = value,
          },
          {
            "type": "input",
            "hint": "Masukkan nomor telepon",
            "textInputAction": TextInputAction.done,
            "keyboardType": TextInputType.phone,
            "labelName": "Nomor Telepon",
            "controller": prospectCustomerController.phoneController,
            "onChanged": (String value) => prospectCustomerController.phone.value = value,
            "maxLines": 1,
            "validator": (String? value) => ValidatorInputUtils(
              name: "Nomor Telepon",
              value: value,
              validationType: ValidationType.phone,
              ).validate()
          },
          {
            "type": "dropdown",
            "hint": "Pilih metode bertemu",
            "labelName": "Metode Bertemu",
            "items": prospectCustomerController.prospectMeetData.value ?? [],
            "data": prospectCustomerController.prospectMeetValue.value,
            "getValue": (dynamic item) => (item as meet_prospect_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as meet_prospect_customer_model.Datum).meetCategory,
            "onChanged": (String? value) {
              prospectCustomerController.prospectMeetValue.value = value;
              prospectCustomerController.validateFormAddProspectCustomer();
            }
          },
          {
            "type": "dropdown",
            "hint": "Pilih status awal",
            "labelName": "Status Awal",
            "items": prospectCustomerController.prospectCategoryData.value ?? [],
            "data": prospectCustomerController.prospectCategoryValue.value,
            "getValue": (dynamic item) => (item as category_prospect_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as category_prospect_customer_model.Datum).nameCategory,
            "onChanged": (String? value) {
              prospectCustomerController.prospectCategoryValue.value = value;
              prospectCustomerController.validateFormAddProspectCustomer();
            }
          },
        ];
        return Form(
          key: prospectCustomerController.addProspectFormKey,
          onChanged: () => prospectCustomerController.validateFormAddProspectCustomer(),
          child: ListView.separated(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 96,
            ),
            separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
            itemCount: inputFields.length,
            itemBuilder: (context, index) {
              final inputField = inputFields[index];
              if (inputField["type"] == "input") {
                return TextFieldGlobalWidget(
                  controller: inputField["controller"] as TextEditingController,
                  hint: inputField["hint"] as String,
                  textInputAction: inputField["textInputAction"] as TextInputAction,
                  keyboardType: inputField["keyboardType"] as TextInputType,
                  labelName: inputField["labelName"] as String?,
                  additionalLabel: inputField["additionalLabel"] as String?,
                  additionalAction: inputField["additionalAction"] as Function()?,
                  onChanged: inputField["onChanged"] as Function(String)?,
                  maxLines: inputField["maxLines"] as int?,
                  validator: inputField["validator"] as String? Function(String?)?,
                );
              } else {
                return DropdownFieldGlobalWidget(
                  hint: inputField["hint"] as String,
                  labelName: inputField["labelName"] as String,
                  items: inputField["items"] as List<dynamic>,
                  value: inputField["data"] as String?,
                  getValue: inputField["getValue"] as String Function(dynamic),
                  getLabel: inputField["getLabel"] as String Function(dynamic),
                  onChanged: inputField["onChanged"] as Function(String?),
                );
              }
            },
          ),
        );
      },
    );
  }
}
