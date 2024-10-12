import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class ItemCustomerGlobalWidget extends StatelessWidget {
  final String name;
  final String address;
  final int telephoneNumber;
  final String status;
  final int index;
  final Function() onTap;
  const ItemCustomerGlobalWidget({
    super.key,
    required this.name,
    required this.address,
    required this.telephoneNumber,
    required this.status,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyleConstant.regularParagraph.copyWith(
      color: ColorConstant.neutralColor800,
    );

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 30,
            decoration: const BoxDecoration(
              color: Color(0XFFEAF0F5),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  (index + 1).toString(),
                  style: TextStyleConstant.semiboldCaption.copyWith(
                    color: ColorConstant.neutralColor800,
                  ),
                ),
                Icon(
                  LineIcons.horizontalEllipsis,
                  color: ColorConstant.neutralColor800,
                ),
              ],
            ),
          ),
          SpacingConstant.verticalSpacing4px,
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorConstant.whiteColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              boxShadow: ShadowConstant.shadowSm,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nama",
                      style: textStyle,
                    ),
                    const SizedBox(width: 81),
                    Text(
                      ":",
                      style: textStyle,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat",
                      style: textStyle,
                    ),
                    const SizedBox(width: 72),
                    Text(
                      ":",
                      style: textStyle,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            address,
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nomor Telepon",
                      style: textStyle,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      ":",
                      style: textStyle,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            telephoneNumber.toString(),
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: textStyle,
                    ),
                    const SizedBox(width: 79),
                    Text(
                      ":",
                      style: textStyle,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            status,
                            style: textStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
