class Constants {
  static String baseDomain="https://fakestoreapi.com/";
}

class Timeouts {
  static const connectTimeout = 30000; // 30 seconds
  static const receiveTimeout = 30000; // 30 seconds
  static const imageConnectTimeout = 45000; // 30 seconds
  static const imageReceiveTimeout = 45000; // 30 seconds
}

class ErrorMessages {
  static const noInternet = 'Please check your internet connection';
  static const connectionTimeout = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
}

class ApiPaths{
  static String login ='auth/login/';
  static String products ='products/';
}