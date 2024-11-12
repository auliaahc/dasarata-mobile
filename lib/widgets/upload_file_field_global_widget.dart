import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:image_picker/image_picker.dart'; // For image selection

class UploadFileFieldGlobalWidget extends StatefulWidget {
  final String hint;
  final String? labelName;
  final Function(String?)? onFileSelected;
  const UploadFileFieldGlobalWidget({
    super.key,
    required this.hint,
    this.labelName,
    this.onFileSelected,
  });

  @override
  State<UploadFileFieldGlobalWidget> createState() => _UploadFileFieldGlobalWidgetState();
}

class _UploadFileFieldGlobalWidgetState extends State<UploadFileFieldGlobalWidget> {
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = null;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
      if (widget.onFileSelected != null) {
        widget.onFileSelected!(pickedImage.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelName != null) ...[
          Text(
            widget.labelName!,
            style: TextStyleConstant.mediumParagraph,
          ),
          SpacingConstant.verticalSpacing6px,
        ],
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: ColorConstant.neutralColor700,
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  color: ColorConstant.primaryColor,
                ),
                SpacingConstant.horizontalSpacing8px,
                selectedImage == null
                    ? Text(
                        widget.hint,
                        style: TextStyleConstant.mediumParagraph.copyWith(
                          color: const Color(0XFFB5B7B9),
                        ),
                      )
                    : Expanded(
                        child: Image.file(
                          File(selectedImage!.path),
                          fit: BoxFit.cover,
                          height: 24,
                          width: 24,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
