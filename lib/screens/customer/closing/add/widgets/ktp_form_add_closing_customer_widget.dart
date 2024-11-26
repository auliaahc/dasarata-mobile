import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/models/customer/closing/district_closing_customer_model.dart'
    as district_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/province_closing_customer_model.dart'
    as province_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/regency_closing_customer_model.dart'
    as regency_closing_customer_model;
import 'package:dasarata_mobile/models/customer/closing/village_closing_customer_model.dart'
    as village_closing_customer_model;
import 'package:dasarata_mobile/widgets/date_picker_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/dropdown_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/image_picker_field_global_widget.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KtpFormAddClosingCustomerWidget extends StatelessWidget {
  const KtpFormAddClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.find();
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
            "controller": closingCustomerController.nikController,
            "maxLines": 1,
            "onChanged": (value) {},
          },
          {
            "type": "input",
            "hint": "Masukkan nama lengkap",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Nama Lengkap",
            "controller": closingCustomerController.fullNameController,
            "onChanged": (value) {},
          },
          {
            "type": "dropdown",
            "hint": "Pilih jenis kelamin",
            "labelName": "Jenis Kelamin",
            "items": genderOptions,
            "data": closingCustomerController.gender.value,
            "getValue": (dynamic item) => item["value"] as String,
            "getLabel": (dynamic item) => item["label"] as String,
            "onChanged": (value) {
              closingCustomerController.gender.value = value;
            },
          },
          {
            "type": "date",
            "controller": TextEditingController(),
            "labelName": "Tanggal Lahir",
          },
          {
            "type": "input",
            "hint": "Masukkan alamat lengkap",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "Alamat Lengkap",
            "controller": closingCustomerController.fullAddressController,
            "onChanged": (value) {}
          },
          {
            "type": "dropdown",
            "hint": "Pilih provinsi",
            "labelName": "Provinsi",
            "items": closingCustomerController.provincesData.value ?? [],
            "data": closingCustomerController.province.value,
            "getValue": (dynamic item) => (item as province_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as province_closing_customer_model.Datum).name,
            "onChanged": (value) {
              closingCustomerController.getRegenciesData(value!);
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih kota",
            "labelName": "Kota",
            "items": closingCustomerController.regenciesData.value ?? [],
            "data": closingCustomerController.regency.value,
            "getValue": (dynamic item) => (item as regency_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as regency_closing_customer_model.Datum).name,
            "onChanged": (value) {
              closingCustomerController.getDistrictsData(value!);
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih kecamatan",
            "labelName": "Kecamatan",
            "items": closingCustomerController.districtsData.value ?? [],
            "data": closingCustomerController.district.value,
            "getValue": (dynamic item) => (item as district_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as district_closing_customer_model.Datum).name,
            "onChanged": (value) {
              closingCustomerController.getVillagesData(value!);
            },
          },
          {
            "type": "dropdown",
            "hint": "Pilih kelurahan",
            "labelName": "Kelurahan",
            "items": closingCustomerController.villagesData.value ?? [],
            "data": closingCustomerController.village.value,
            "getValue": (dynamic item) => (item as village_closing_customer_model.Datum).id.toString(),
            "getLabel": (dynamic item) => (item as village_closing_customer_model.Datum).name,
            "onChanged": (value) {
              closingCustomerController.village.value = value;
            },
          },
          {
            "type": "input",
            "hint": "Masukkan RT",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "RT",
            "controller": closingCustomerController.rtController,
            "maxLines": 1,
            "onChanged": (value) {}
          },
          {
            "type": "input",
            "hint": "Masukkan RW",
            "textInputAction": TextInputAction.next,
            "keyboardType": TextInputType.text,
            "labelName": "RW",
            "controller": closingCustomerController.rwController,
            "maxLines": 1,
            "onChanged": (value) {}
          },
          {
            "type": "image",
            "labelName": "Foto KTP",
          }
        ];
        return Form(
          key: closingCustomerController.addClosingCustomerFormKeys[1],
          onChanged: () {},
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 104),
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
                  onChanged: inputField["onChanged"] as Function(String)?,
                  maxLines: inputField["maxLines"] as int?,
                  validator: inputField["validator"] as String? Function(String?)?,
                );
              } else if (inputField["type"] == "image") {
                return ImagePickerFieldGlobalField(
                  hint: "Pilih gambar",
                  labelName: inputField["labelName"] as String?,
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
                );
              }
            },
          ),
        );
      },
    );
  }
}
