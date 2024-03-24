class TextFormValidation {
  static usernameValidation(String? value) {
    if (value == null || value.isEmpty) return "Username shouldn't be empty";
    if (value.length < 4) {
      return "Username shouldn't be smaller than 4 characters";
    }
    if (!value.contains(RegExp(r'[a-z]')) &&
        !value.contains(RegExp(r'[A-Z]'))) {
      return "Username must have letters";
    }
  }

  static passwordValidation(String? value) {
    if (value == null || value.isEmpty) return "لا يجب أن يكون الحقل فارغ";
    if (value.length < 8) return "يجب ان يكون اكثر من 8 محارف";
    if (!value.contains(RegExp(r'[0-9]'))) return "يجب أن يحتوي رقم على الأقل";
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "يجب أن يحنوي على حرف على الاقل";
    }
    if (value.contains(" ")) return "لا يجب أن يحتوي على فراغات";
    return;
  }

  static emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "الحساب الالكتروني لا يجب ان يكون فارغ";
    }
    if (value.contains(" ")) return "الحساب لا يجب ان يحتوي على فراغات";
    if (value.contains('@gmail.com')) {
      return;
    } else {
      return "الحساب يجب ان يحتوي على gmail.com@";
    }
  }

  static passwordCheck({
    required String password,
    required String cPassword,
  }) {
    if (password != cPassword) return "Not Matched";
    return null;
  }


  static textFieldCheck({
    String? textController,
    required String fieldName,
    int? numberOfChars = 3,
  }) {
    RegExp textRegExp = RegExp('[a-zA-Z]{$numberOfChars,}');
    if (textController == null || textController.isEmpty) return "هذا الحقل لا يجب أن يكون فارغ";
    textController.trim();
    if (!textRegExp.hasMatch(textController)) {
      return " حقل $fieldName يجب أن يحتوي $numberOfChars محارف على الأقل ";
    }
    return null;
  }

  static numberCheck({
    String? number,
  }) {
    final RegExp numberRegExp = RegExp(r'\d');
    if (number == null || number.isEmpty) return "الرقم لا يجب أن يكون فارغ";
    number.trim();
    if (numberRegExp.hasMatch(number) && number.length < 10) {
      return "الرقم المدخل غير صحيح";
    }
    return null;
  }
}
