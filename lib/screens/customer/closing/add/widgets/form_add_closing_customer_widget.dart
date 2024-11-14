import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart';
import 'package:dasarata_mobile/widgets/date_picker_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/widgets/dropdown_field_global_widget.dart';

class FormAddClosingCustomerWidget extends StatelessWidget {
  const FormAddClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Datum> customerTypeData = [
      Datum(
          id: 1,
          meetCategory: "Test 1",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
      Datum(
          id: 2,
          meetCategory: "Test 2",
          createdAt: DateTime.now(),
          updatedAt: DateTime.now()),
    ];

    String? selectedValue;
    final inputFields = [
      {
        "type": "input",
        "hint": "Masukkan nama customer prospect",
        "labelName": "Nama Customer Prospect",
        "controller": TextEditingController(),
        "onChanged": (String value) {},
      },
      {
        "type": "dropdown",
        "hint": "Pilih jenis customer",
        "labelName": "Jenis Customer",
        "items": customerTypeData,
        "data": selectedValue,
        "getValue": (dynamic item) => (item as Datum).id.toString(),
        "getLabel": (dynamic item) => (item as Datum).meetCategory,
        "onChanged": (String? value) {}
      },
      {
        "type": "dropdown",
        "hint": "Pilih paket layanan",
        "labelName": "Paket Layanan",
        "items": customerTypeData,
        "data": selectedValue,
        "getValue": (dynamic item) => (item as Datum).id.toString(),
        "getLabel": (dynamic item) => (item as Datum).meetCategory,
        "onChanged": (String? value) {}
      },
      {
        "type": "dropdown",
        "hint": "Pilih promo",
        "labelName": "Promo",
        "items": customerTypeData,
        "data": selectedValue,
        "getValue": (dynamic item) => (item as Datum).id.toString(),
        "getLabel": (dynamic item) => (item as Datum).meetCategory,
        "onChanged": (String? value) {}
      },
      {
        "type": "input",
        "hint": "Masukkan alamat terpasang",
        "labelName": "Alamat Terpasang",
        "controller": TextEditingController(),
        "onChanged": (String value) {}
      },
      {
        "type": "dropdown",
        "hint": "Pilih jenis kelamin",
        "labelName": "Jenis Kelamin",
        "items": customerTypeData,
        "data": selectedValue,
        "getValue": (dynamic item) => (item as Datum).id.toString(),
        "getLabel": (dynamic item) => (item as Datum).meetCategory,
        "onChanged": (String? value) {}
      },
    ];

    return Form(
      key: GlobalKey<FormState>(),
      onChanged: () {},
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 32, bottom: 96),
        separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
        itemCount: inputFields.length,
        itemBuilder: (context, index) {
          final inputField = inputFields[index];
          if (inputField["type"] == "input") {
            return DatePickerFieldGlobalWidget(
  controller: TextEditingController(),
  labelName: "Date of Birth",
  hint: "Select your date of birth",
  textInputAction: TextInputAction.done,
  keyboardType: TextInputType.datetime,
  onChanged: (value) {
  },
  additionalLabel: "Help",
  additionalAction: () {
    // Handle additional action, e.g., show info about the date field
  },
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
  }
}
