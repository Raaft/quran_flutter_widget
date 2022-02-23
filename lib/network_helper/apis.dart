class Apis extends Object {
  static const int SINGLE = 1;
  static const int LIST = 2;

  static const int LIKE = 1;
  static const int UNLIKE = 0;

  //states
  static String LOADING_STATE = "LoadingState";
  static String DATA_FETCHED_STATE = "DataFetchedState";

  static String REQ_SUCCESS = "success";
  static int CODE_SUCCESS = 200;
  static int CODE_ERROR = 500;
  static String REQ_NOT_ALLOWED = "NotAllowed";
  static String REQ_DATA_RETURNED = "DataReturn";
  static String REQ_EMPTY_DATA = "EmptyData";
  static String REQ_FAILED = "failed";

  static String Authorization = '';
  static String clientId = '';
  static String clientSecret = '';

  static var tokenValue = "";

  static String BASE_API = "http://165.232.114.22/api/v1/";
  static String BASE_PATH = "";
  static String IMAGE_URL = "$BASE_PATH";

  static String FETCH_ALL_NARRATIONS = "${BASE_PATH}narrations/";
  static String FETCH_ALL_BOOKS = "${BASE_PATH}books/";
  static String FETCH_ALL_CHAPTERS = "${BASE_PATH}chapters/";
  static String FETCH_ALL_PARTS = "${BASE_PATH}parts/";
  static String FETCH_ALL_PAGES = "${BASE_PATH}pages/";
  static String FETCH_ALL_RECITATIONS = "${BASE_PATH}recitations/";
  static String FETCH_ALL_RECITERS = "${BASE_PATH}reciters/";
}
