
class ApiDeclaration {
  static const baseUrl = "https://indian-souls-backend-d5g7geakhbazgzhj.southeastasia-01.azurewebsites.net";
  static String token = "";
  // static String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21lcl9pZCI6MTIsImlhdCI6MTc2NjQxNTIzMiwiZXhwIjoxNzY2NTAxNjMyfQ._KIQ8YVnwE6kg00BHEEPm8Ejxs2eHjnJYJZrEiQzbyc";


  static Map<String, dynamic> headersConfiguration(bool isAuthorize) {

    Map<String, dynamic> headers = {};
    if (isAuthorize) {
      headers["Authorization"] = "Bearer $token";
    }
    return headers;
  }
  // network msg
  static const noInterNet = "No internet  connection, Please check and try again later.";


  static const registerUrl = "$baseUrl/api/users/register";
  static const loginUrl = "$baseUrl/api/auth/login"; // done
  static const logoutUrl = "$baseUrl/api/auth/logout"; // done
  static const captchaUrl = "$baseUrl/api/captcha/image"; // not
  static const productsUrl = "$baseUrl/api/products"; // done
  static const profileUrl = "$baseUrl/api/users/profile"; // done
  // static const profileUrl = "$baseUrl/api/users/profile"; post body is required

}
