class Validations {
  String? validateEmail(String? value) {
    if (value != null) {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      final email = value.replaceAll(' ', '');

      if (!regex.hasMatch(email)) {
        return "Please Enter a valid email";
      } else {
        return null;
      }
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value != null && value.isEmpty) return "This Field is Required";
    return null;
  }
}
