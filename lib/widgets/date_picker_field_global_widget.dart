import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class DatePickerFieldGlobalWidget extends StatefulWidget {
  final String hint;
  final String? labelName;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final double? height;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
  final String? additionalLabel;
  final Function()? additionalAction;
  const DatePickerFieldGlobalWidget({
    super.key,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.controller,
    this.hint = "Pilih tanggal",
    this.labelName,
    this.errorText,
    this.validator,
    required this.textInputAction,
    required this.keyboardType,
    this.height,
    this.additionalLabel,
    this.additionalAction,
  });

  @override
  State<DatePickerFieldGlobalWidget> createState() => _DatePickerFieldGlobalWidgetState();
}

class _DatePickerFieldGlobalWidgetState extends State<DatePickerFieldGlobalWidget> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime firstDate = DateTime(currentDate.year - 1);
    final DateTime lastDate = DateTime(currentDate.year + 1);

    final DateTime? pickedDate = await showDatePicker(
      confirmText: "Pilih",
      context: context,
      initialDate: selectedDate ?? currentDate,
      firstDate: firstDate,
      lastDate: lastDate,
      locale: const Locale("id", "ID"),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorConstant.primaryColor,
            ),
            dialogBackgroundColor: Colors.white,
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: ColorConstant.primaryColor,
              headerForegroundColor: ColorConstant.whiteColor,
              backgroundColor: ColorConstant.whiteColor,
            )
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
      if (widget.controller != null) {
        widget.controller!.text = "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      }
      if (widget.onChanged != null) {
        widget.onChanged!("${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.labelName != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.labelName!,
                style: TextStyleConstant.mediumParagraph,
              ),
              if (widget.additionalLabel != null)
                GestureDetector(
                  onTap: widget.additionalAction,
                  child: Text(
                    "${widget.additionalLabel!} >",
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
          SpacingConstant.verticalSpacing6px
        ],
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.height ?? 48,
          ),
          child: TextFormField(
            controller: widget.controller,
            readOnly: true,
            onTap: () => _selectDate(context),
            validator: widget.validator,
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            style: TextStyleConstant.regularParagraph,
            decoration: InputDecoration(
              errorText: widget.errorText,
              prefixIcon: Icon(
                Icons.calendar_today,
                color: ColorConstant.primaryColor,
              ),
              suffixIcon: widget.controller?.text.isNotEmpty == true
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          widget.controller?.clear();
                        });
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              hintText: widget.hint,
              hintStyle: TextStyleConstant.mediumParagraph.copyWith(
                color: const Color(0XFFB5B7B9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: ColorConstant.secondaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: ColorConstant.neutralColor700,
                  width: 0.5,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: ColorConstant.dangerColor,
                  width: 1.5,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: ColorConstant.dangerColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
