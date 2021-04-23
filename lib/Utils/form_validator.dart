class FormValidator {
  String? isNullOrEmpty(val) {
    if (val?.isEmpty ?? false) return 'Can not be empty!';

    return null;
  }
}
