enum ValidationType {
  email,
}

class ValidatorInputUtils {
  final String name;
  final String? value;
  final bool isRequired;
  final ValidationType? validationType;

  ValidatorInputUtils({
    required this.name,
    required this.value,
    this.isRequired = true,
    this.validationType,
  });

  String? validate() {
    if (isRequired) {
      if (value == null || value!.isEmpty) {
        return "$name tidak boleh kosong";
      }
    }

    if (validationType == ValidationType.email) {
      if (!value!.contains('@')) {
        return "Format $name tidak valid";
      }
    }

    return null;
  }
}
