import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/add_closing_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/closing/district_closing_customer_model.dart'
    as district_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/province_closing_customer_model.dart'
    as province_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/regency_closing_customer_model.dart'
    as regency_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/village_closing_customer_model.dart'
    as village_closing_customer_model;
import 'package:dasarata_mobile/utilities/validator_input_utils.dart';
import 'package:dasarata_mobile/widgets/date_picker_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/dropdown_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/image_picker_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KtpFormAddClosingCustomerWidget extends StatelessWidget {
  const KtpFormAddClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddClosingCustomerController addClosingCustomerController =
        Get.find();
    return Obx(
      () {
        final genderOptions = [
          {
            "value": "male",
            "label": "Laki-laki",
          },
          {
            "value": "female",
            "label": "Perempuan",
          },
        ];
        final inputFields = [
          {
            "type": "input",
            "hint": "Masukkan NIK",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.number,
            "labelName": "NIK",
            "controller": addClosingCustomerController.nikController,
            "maxLines": 1,
            "validator": (String value) => ValidatorInputUtils(
                  name: "NIK",
                  value: value,
                  validationType: ValidationType.fixedCharacterLength,
                  fixedCharacterLength: 16,
                ).validate()
          },
          {
            "type": "input",
            "hint": "Masukkan nama lengkap",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Nama Lengkap",
            "controller": addClosingCustomerController.fullNameController,
          },
          {
            "type": "dropdown",
            "hint": "Pilih jenis kelamin",
            "labelName": "Jenis Kelamin",
            "items": genderOptions,
            "data": addClosingCustomerController.gender.value,
            "getValue": (dynamic item) => item["value"] as String,
            "getLabel": (dynamic item) => item["label"] as String,
            "onChanged": (value) {
              addClosingCustomerController.gender.value = value;
            },
          },
          {
            "type": "date",
            "controller": addClosingCustomerController.birthDateController,
            "labelName": "Tanggal Lahir",
            "onChanged": (value) => addClosingCustomerController.birthDate.value = value,
          },
          {
            "type": "input",
            "hint": "Masukkan alamat lengkap",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Alamat Lengkap",
            "controller": addClosingCustomerController.fullAddressController,
          },
          {
            "type": "dropdown",
            "hint": "Pilih provinsi",
            "labelName": "Provinsi",
            "items": addClosingCustomerController.provincesData.value ?? [],
            "data": addClosingCustomerController.province.value,
            "getValue": (dynamic item) =>
                (item as province_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) =>
                (item as province_closing_customer_model.Datum).name,
            "onChanged": (value) {
              addClosingCustomerController.getRegenciesData(value!);
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih kota",
            "labelName": "Kota",
            "items": addClosingCustomerController.regenciesData.value ?? [],
            "data": addClosingCustomerController.regency.value,
            "getValue": (dynamic item) =>
                (item as regency_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) =>
                (item as regency_closing_customer_model.Datum).name,
            "onChanged": (value) {
              addClosingCustomerController.getDistrictsData(value!);
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih kecamatan",
            "labelName": "Kecamatan",
            "items": addClosingCustomerController.districtsData.value ?? [],
            "data": addClosingCustomerController.district.value,
            "getValue": (dynamic item) =>
                (item as district_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) =>
                (item as district_closing_customer_model.Datum).name,
            "onChanged": (value) {
              addClosingCustomerController.getVillagesData(value!);
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih kelurahan",
            "labelName": "Kelurahan",
            "items": addClosingCustomerController.villagesData.value ?? [],
            "data": addClosingCustomerController.village.value,
            "getValue": (dynamic item) =>
                (item as village_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) =>
                (item as village_closing_customer_model.Datum).name,
            "onChanged": (value) {
              addClosingCustomerController.village.value = value;
            },
          },
          {
            "type": "input",
            "hint": "Masukkan RT",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "RT",
            "controller": addClosingCustomerController.rtController,
            "maxLines": 1,
          },
          {
            "type": "input",
            "hint": "Masukkan RW",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "RW",
            "controller": addClosingCustomerController.rwController,
            "maxLines": 1,
          },
          {
            "type": "image",
            "labelName": "Foto KTP",
            "onFileSelected": (XFile? file) {
              addClosingCustomerController.ktpPhoto.value = file;
            },
          }
        ];
        return Form(
          key: addClosingCustomerController.addClosingCustomerFormKeys[1],
          onChanged: () {},
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 104),
            separatorBuilder: (context, index) =>
                SpacingConstant.verticalSpacing16px,
            itemCount: inputFields.length,
            itemBuilder: (context, index) {
              final inputField = inputFields[index];
              if (inputField["type"] == "input") {
                return TextFieldGlobalWidget(
                  controller: inputField["controller"] as TextEditingController,
                  hint: inputField["hint"] as String,
                  textInputAction:
                      inputField["textInputAction"] as TextInputAction,
                  keyboardType: inputField["keyboardType"] as TextInputType,
                  labelName: inputField["labelName"] as String?,
                  onChanged: inputField["onChanged"] as Function(String)?,
                  maxLines: inputField["maxLines"] as int?,
                  validator:
                      inputField["validator"] as String? Function(String?)?,
                );
              } else if (inputField["type"] == "image") {
                return ImagePickerFieldGlobalField(
                  hint: "Pilih gambar",
                  labelName: inputField["labelName"] as String?,
                  onFileSelected:
                      inputField["onFileSelected"] as Function(XFile?)?,
                );
              } else if (inputField["type"] == "dropdown") {
                return DropdownFieldGlobalWidget(
                  hint: inputField["hint"] as String,
                  labelName: inputField["labelName"] as String,
                  items: inputField["items"] as List<dynamic>,
                  value: inputField["data"] as String?,
                  getValue: inputField["getValue"] as String Function(dynamic),
                  getLabel: inputField["getLabel"] as String Function(dynamic),
                  onChanged: inputField["onChanged"] as Function(String?),
                );
              } else {
                return DatePickerFieldGlobalWidget(
                  labelName: inputField["labelName"] as String?,
                  controller: inputField["controller"] as TextEditingController,
                  onChanged: inputField["onChanged"] as Function(String?)?,
                );
              }
            },
          ),
        );
      },
    );
  }
}
