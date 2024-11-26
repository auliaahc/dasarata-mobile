import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class DatePickerFieldGlobalWidget extends StatefulWidget {
  final String hint;
  final String? labelName;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final String? Function(String?)? validator;
  final double? height;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
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
    this.height,
  });

  @override
  State<DatePickerFieldGlobalWidget> createState() => _DatePickerFieldGlobalWidgetState();
}

class _DatePickerFieldGlobalWidgetState extends State<DatePickerFieldGlobalWidget> {
  DateTime? selectedDate;

  String _formatDateForReturn(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  String _formatDateForDisplay(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(date);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime firstDate = DateTime(1900);
    final DateTime lastDate =
        currentDate; // Rentang tahun sampai tahun sekarang

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
            ),
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
        widget.controller!.text = _formatDateForDisplay(selectedDate!);
      }
      if (widget.onChanged != null) {
        widget.onChanged!(_formatDateForReturn(selectedDate!));
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
            style: TextStyleConstant.regularParagraph,
            decoration: InputDecoration(
              errorText: widget.errorText,
              prefixIcon: Icon(
                LineIcons.calendar,
                color: ColorConstant.primaryColor,
              ),
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
