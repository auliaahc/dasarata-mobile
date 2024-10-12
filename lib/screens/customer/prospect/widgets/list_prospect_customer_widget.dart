import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/data/dummy_data.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/add_floating_button_prospect_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/prospect/widgets/detail_dialog_prospect_customer_widget.dart';
import 'package:dasarata_mobile/widgets/item_customer_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProspectCustomerWidget extends StatelessWidget {
  const ListProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      floatingActionButton: const AddFloatingButtonProspectCustomerWidget(),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              itemCount: DummyData.dummyCustomerData.length,
              separatorBuilder: (context, index) => SpacingConstant.verticalSpacing16px,
              itemBuilder: (context, index) {
                final customer = DummyData.dummyCustomerData[index];
                return ItemCustomerGlobalWidget(
                  onTap: () => showDialog(),
                  index: index,
                  name: customer["name"],
                  address: customer["address"],
                  telephoneNumber: customer["telephoneNumber"],
                  status: customer["status"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 // TODO: Hapus ini
  void showDialog() {
    Get.dialog(
      const DetailDialogProspectCustomerWidget(
        name: "John Doe",
        telephoneNumber: "6285739206149",
        meetMethod: "Chat",
        status: "QnA",
        address: "Jl. Raya Kenanga Indah",
      ),
    );
  }
}
