enum ValidationType {
  email,
  phone,
  fixedCharacterLength,
}

class ValidatorInputUtils {
  final String name;
  final String? value;
  final bool isRequired;
  final ValidationType? validationType;
  final int? fixedCharacterLength;

  ValidatorInputUtils({
    required this.name,
    required this.value,
    this.isRequired = true,
    this.validationType,
    this.fixedCharacterLength,
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

    if (validationType == ValidationType.phone) {
      if (value!.length < 10 || value!.length > 15) {
        return "$name harus terdiri dari 10 hingga 15 digit";
      }
    }

    if (validationType == ValidationType.fixedCharacterLength) {
      if (value!.length != fixedCharacterLength) {
        return "$name harus terdiri dari $fixedCharacterLength digit";
      }
    }

    return null;
  }
}
