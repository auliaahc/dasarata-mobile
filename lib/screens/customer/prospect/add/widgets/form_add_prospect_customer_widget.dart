import 'package:dasarata_mobile/controllers/add_prospect_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/models/customer/prospect/category_prospect_customer_model.dart' as category_prospect_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart' as meet_prospect_customer_model;
import 'package:dasarata_mobile/utilities/validator_input_utils.dart';
import 'package:dasarata_mobile/widgets/dropdown_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';

class FormAddProspectCustomerWidget extends StatelessWidget {
  const FormAddProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProspectCustomerController addProspectCustomerController = Get.find();
    return Obx(
      () {
        final inputFields = [
          {
            "type": "input",
            "hint": "Masukkan nama",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Nama",
            "controller": addProspectCustomerController.name,
          },
          {
            "type": "input",
            "hint": "Masukkan alamat",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Alamat",
            "additionalLabel": "Maps",
            "controller": addProspectCustomerController.address,
            "additionalAction": () => Get.toNamed(AppRoute.prospectMaps),
          },
          {
            "type": "input",
            "hint": "Masukkan nomor telepon",
            "textInputAction": TextInputAction.done,
            "keyboardType": TextInputType.phone,
            "labelName": "Nomor Telepon",
            "controller": addProspectCustomerController.phone,
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
            "items": addProspectCustomerController.prospectMeetData.value ?? [],
            "data": addProspectCustomerController.prospectMeet.value,
            "getValue": (dynamic item) => (item as meet_prospect_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as meet_prospect_customer_model.Datum).meetCategory,
            "onChanged": (String? value) {
              addProspectCustomerController.prospectMeet.value = value;
              addProspectCustomerController.validateFormAddProspectCustomer();
            }
          },
          {
            "type": "dropdown",
            "hint": "Pilih status awal",
            "labelName": "Status Awal",
            "items": addProspectCustomerController.prospectCategoryData.value ?? [],
            "data": addProspectCustomerController.prospectCategory.value,
            "getValue": (dynamic item) => (item as category_prospect_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as category_prospect_customer_model.Datum).nameCategory,
            "onChanged": (String? value) {
              addProspectCustomerController.prospectCategory.value = value;
              addProspectCustomerController.validateFormAddProspectCustomer();
            }
          },
        ];
        return Form(
          key: addProspectCustomerController.addProspectFormKey,
          onChanged: () => addProspectCustomerController.validateFormAddProspectCustomer(),
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
