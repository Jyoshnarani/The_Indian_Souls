
class ApiDeclaration {



  static const baseUrl = "https://indian-souls-backend-d5g7geakhbazgzhj.southeastasia-01.azurewebsites.net";
  // static String token = "";
  static String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21lcl9pZCI6OSwiaWF0IjoxNzY2MTIzMzA4LCJleHAiOjE3NjYyMDk3MDh9.JOwB-zdV_CK9FR9KCLyMcV5MIXuf9qqw_KycMC0PEUs";


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
  static const logoutUrl = "$baseUrl/api/auth/logout";
  static const captchaUrl = "$baseUrl/api/captcha/image";
  static const productsUrl = "$baseUrl/api/products"; // done
  static const profileUrl = "$baseUrl/api/users/profile";

}
