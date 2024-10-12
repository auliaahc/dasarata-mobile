import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/data/dummy_data.dart';
import 'package:dasarata_mobile/widgets/item_customer_global_widget.dart';
import 'package:flutter/material.dart';

class ListClosingCustomerWidget extends StatelessWidget {
  const ListClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
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
                  onTap: () {},
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
}
