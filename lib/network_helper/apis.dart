class Apis extends Object {
  static const int single = 1;
  static const int list = 2;

  //states
  static String loadingState = 'LoadingState';
  static String dataFetchedState = 'DataFetchedState';

  static int codeSUCCESS = 200;
  static int codeERROR = 500;

  static String authorization = '';
  static String clientId = '';
  static String clientSecret = '';

  static var tokenValue = '';

  //static String baseUrl = 'http://165.232.114.22/';
  static String baseUrl = 'http://192.168.1.11:8000/';
  static String basePath = baseUrl + 'api/v1/';
  static String imageUrl = basePath;

  static String fetchAllNARRATIONS = '${basePath}narrations/';
  static String fetchAllBOOKS = '${basePath}books/';
  static String fetchAllCHAPTERS = '${basePath}chapters/';
  static String fetchAllPARTS = '${basePath}parts/';
  static String fetchAllPAGES = '${basePath}pages/';
  static String fetchAllRECITATIONS = '${basePath}recitations/';
  static String fetchAllRECITERS = '${basePath}reciters/';
}
