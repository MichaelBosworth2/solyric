class FormValidations {
  static String emailValidation(String email) => RegExp(
        "\\b[A-Z0-9._%-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}\\b",
        caseSensitive: false,
        multiLine: false,
      ).hasMatch(email)
          ? null
          : "Invalid Email Address";

  static String passwordValidation(String password) => password.length < 8
      ? "Password needs to be at least 8 characters long"
      : null;
}
