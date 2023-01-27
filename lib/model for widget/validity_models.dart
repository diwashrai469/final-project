class validity {
  String? namevalidator(String? name) {
    if (name == null || name.isEmpty) {
      return "User name is required";
    }
    return null;
  }

  String? emailvalidator(String? email) {
    if (email == null) {
      return "Email is required";
    }
    if (email.isEmpty) {
      return "Email is empty";
    }
    if (email.contains("@") & email.contains(".")) {
      return null;
    }
  }

  String? passwordvalidator(String? password) {
    if (password == null) {
      return "Password is required";
    }
    if (password.isEmpty) {
      return "Password is empty";
    }
    if (password.length >= 6) {
      return null;
    } else {
      return "Password should be greater then 6";
    }
  }
}
