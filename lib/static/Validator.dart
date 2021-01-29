class Validator {

  static String usernameValidator(String username) {
    Pattern pattern = r"^(?=[a-zA-Z0-9._]{5,15}$)(?!.*[_.]{2})[^_.].*[^_.]$";
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(username)) {
      return "Invalid username.";
    }
    else {
      return null;
    }
  }

  static String emailValidator(String email) {
    Pattern pattern = r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(email)) {
      return "Invalid email.";
    }
    else {
      return null;
    }
  }

  static String passwordValidator(String password) {
    Pattern pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)\S{8,}$";
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(password)) {
      return "Invalid password. Include: an upper-case and lower-case letter, 1 number.";
    }
    else {
      return null;
    }
  }
}