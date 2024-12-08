import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/customer/prospect/response_form_prospect_customer_model.dart';
import 'package:dasarata_mobile/models/profile/response_profile_model.dart';
import 'package:dasarata_mobile/services/profile_service.dart';
import 'package:dasarata_mobile/services/prospect_customer_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/models/customer/prospect/category_prospect_customer_model.dart' as category_prospect_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/meet_prospect_customer_model.dart' as meet_prospect_customer_model;
import 'package:dasarata_mobile/models/customer/prospect/request_form_prospect_customer_model.dart';

class AddProspectCustomerController extends GetxController {
  ProfileService profileService = ProfileService();
  RxnString salesNip = RxnString();
  ProspectCustomerService prospectCustomerService = ProspectCustomerService();
  Rxn<List<category_prospect_customer_model.Datum>> prospectCategoryData = Rxn<List<category_prospect_customer_model.Datum>>();
  Rxn<List<meet_prospect_customer_model.Datum>> prospectMeetData = Rxn<List<meet_prospect_customer_model.Datum>>();
  final GlobalKey<FormState> addProspectFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  RxnString prospectMeet = RxnString();
  RxnString prospectCategory = RxnString();
  RxBool isFormAddProspectCustomerValid = RxBool(false);
  RxBool isLoadingProspectCategory = RxBool(false);
  RxBool isLoadingProspectMeet = RxBool(false);
  RxBool isLoadingAddProspectCustomer = RxBool(false);

  void fetchInitialData() {
    getProspectCategoryData();
    getProspectMeetData();
    getProfileData();
  }

  Future<void> getProfileData() async {
    try {
      final response = await profileService.getProfile();
      salesNip.value = response.data!.nip;
    } catch (e) {
      if (e is ResponseProfileModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    }
  }

  Future<void> getProspectCategoryData() async {
    isLoadingProspectCategory.value = true;
    try {
      final response = await prospectCustomerService.getProspectCategory();
      prospectCategoryData.value = response.data;
    } catch (e) {
      if (e is category_prospect_customer_model.CategoryProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingProspectCategory.value = false;
    }
  }

  Future<void> getProspectMeetData() async {
    isLoadingProspectMeet.value = true;
    try {
      final response = await prospectCustomerService.getProspectMeet();
      prospectMeetData.value = response.data;
    } catch (e) {
      if (e is meet_prospect_customer_model.MeetProspectCustomerModel) {
        SnackbarUtils.show(
          messageText: e.message,
          type: AnimatedSnackBarType.error,
        );
      }
    } finally {
      isLoadingProspectMeet.value = false;
    }
  }

  Future<void> submitFormAddProspectCustomer() async {
    if (addProspectFormKey.currentState!.validate()) {
      isLoadingAddProspectCustomer.value = true;
      RequestFormProspectCustomerModel prospectCustomerData = RequestFormProspectCustomerModel(
        nipSalesId: salesNip.value!,
        prospectCategoryId: int.parse(prospectCategory.value!),
        prospectMeetId: int.parse(prospectMeet.value!),
        name: name.text,
        phoneNumber: phone.text,
        installedAddress: address.text,
      );
      try {
        final response = await prospectCustomerService.createProspectCustomer(prospectCustomerData);
        if (response.success) {
          SnackbarUtils.show(
            messageText: "Data customer prospek berhasil ditambahkan!",
            type: AnimatedSnackBarType.success,
          );
        }
        Get.back();
        Get.delete<AddProspectCustomerController>();
      } catch (e) {
        if (e is ResponseFormProspectCustomerModel) {
          if (e.errors != null) {
            for (String data in e.errors!) {
              SnackbarUtils.show(
                messageText: data,
                type: AnimatedSnackBarType.error,
              );
            }
          } else {
            SnackbarUtils.show(
              messageText: e.message!,
              type: AnimatedSnackBarType.error,
            );
          }
        }
      } finally {
        isLoadingAddProspectCustomer.value = false;
      }
    }
  }

  void validateFormAddProspectCustomer() {
    isFormAddProspectCustomerValid.value = name.text.isNotEmpty &&
        address.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        prospectMeet.value != null &&
        prospectCategory.value != null;
  }
}