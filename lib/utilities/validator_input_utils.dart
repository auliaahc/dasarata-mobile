class ValidatorInputUtils {
  final String name;
  final String? value;
  ValidatorInputUtils({required this.name, this.value});

  String? validate() {
    if (value == null || value!.isEmpty) {
      return "$name tidak boleh kosong";
    }
    return null;
  }
}
