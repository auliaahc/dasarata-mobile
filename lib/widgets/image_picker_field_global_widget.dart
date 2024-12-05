import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';

class ImagePickerFieldGlobalField extends StatefulWidget {
  final String hint;
  final String? labelName;
  final Function(XFile?)? onFileSelected;
  const ImagePickerFieldGlobalField({
    super.key,
    required this.hint,
    this.labelName,
    this.onFileSelected,
  });

  @override
  State<ImagePickerFieldGlobalField> createState() => _ImagePickerFieldGlobalFieldState();
}

class _ImagePickerFieldGlobalFieldState extends State<ImagePickerFieldGlobalField> {
  XFile? selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = null;
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
      if (widget.onFileSelected != null) {
        widget.onFileSelected!(pickedImage);
      }
    }
  }

  Future<void> _showImageSourceDialog() async {
    Get.dialog(
      AlertDialog(
        backgroundColor: ColorConstant.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          "Pilih Sumber Gambar",
          style: TextStyleConstant.semiboldParagraph.copyWith(
            color: ColorConstant.neutralColor900,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                LineIcons.camera,
                color: ColorConstant.primaryColor,
              ),
              title: const Text(
                "Ambil dari Kamera",
              ),
              onTap: () async {
                Navigator.pop(context);
                await _pickImage(ImageSource.camera);
              },
            ),
            SpacingConstant.verticalSpacing6px,
            ListTile(
              leading: Icon(
                LineIcons.photoVideo,
                color: ColorConstant.primaryColor,
              ),
              title: const Text(
                "Pilih dari Galeri",
              ),
              onTap: () async {
                Navigator.pop(context);
                await _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
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
          onTap: _showImageSourceDialog,
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
                  LineIcons.imageFile,
                  color: ColorConstant.primaryColor,
                ),
                SpacingConstant.horizontalSpacing8px,
                Expanded(
                  child: Text(
                    selectedImage == null
                        ? widget.hint
                        : File(selectedImage!.path).path.split('/').last,
                    style: selectedImage == null
                        ? TextStyleConstant.mediumParagraph.copyWith(
                            color: ColorConstant.neutralColor600,
                          )
                        : TextStyleConstant.regularParagraph.copyWith(
                            color: ColorConstant.neutralColor900,
                          ),
                    overflow: TextOverflow.ellipsis,
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
