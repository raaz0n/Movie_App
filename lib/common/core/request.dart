import 'api_constant.dart';

abstract class RequestData {
  //live
  // static const host = "https://app.nea.org.np/api/v1";

  //uat
  // static const host = "https://app-uat.neamobileapp.com/api/v1";

  //dev
  static const host = ApiConstant.BASE_URL;

  static const _authentication = 'Authorization';

  static const _refreshToken = 'refreshToken';
  static const _bearer = 'Bearer ';

  String getUrl();

  String getBody();

  Map<String, String> getHeaders();

  static String createUrl(String path) {
    return '$host/$path';
  }

  static String createUrlWithoutVersion(String path) {
    return '$host$path';
  }

  static String createUrlwithId(String version, String path, String id) {
    return '$host$version/$path/$id';
  }

  static String createGetUrl(String path, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrl(path));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String createParamsGetUrl(
      String path, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrl(path));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String createGetBaseUrl(String path, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrl(path));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String createGetUrlwithId(
      String version, String path, String id, Map<String, dynamic> parameters) {
    final uri = Uri.parse(createUrlwithId(version, path, id));
    final ret = uri.replace(queryParameters: parameters);
    return ret.toString();
  }

  static String urlEncodeForFormData(Map<String, String> map) {
    return map.keys
        .map((key) =>
            '${Uri.encodeComponent(key)}=${Uri.encodeComponent("${map[key]}")}')
        .join('&');
  }

  static Map<String, String> createHeader() {
    final header = <String, String>{};
    header['Accept'] = 'application/json';
    header['Content-Type'] = 'application/json';

    return header;
  }

  static Map<String, String> createAuthHeader(String token) {
    final authHeader = <String, String>{};
    authHeader[_authentication] = '$_bearer$token';
    authHeader['Accept'] = 'application/json';
    authHeader['Content-Type'] = 'application/json';

    return authHeader;
  }

  static Map<String, String> createAuthHeaderWithProfileHeader(
      String token, String header) {
    final authHeader = <String, String>{};
    authHeader[_authentication] = '$_bearer$token';
    authHeader['Accept'] = 'application/json';
    authHeader['Content-Type'] = 'application/json';

    if (header.isNotEmpty) {
      authHeader['only-image'] = header;
    }
    return authHeader;
  }

  static Map<String, String> createAuthHeaderWithBillDetailsHeader(
      String token, String header) {
    final authHeader = <String, String>{};
    authHeader[_authentication] = '$_bearer$token';
    authHeader['Accept'] = 'application/json';
    authHeader['Content-Type'] = 'application/json';

    if (header.isNotEmpty) {
      authHeader['pay-now'] = header;
    }
    return authHeader;
  }

  static Map<String, String> createAuthHeaderWithDeviceCode(
      String token, String deviceCode) {
    final authHeader = <String, String>{};
    authHeader[_authentication] = '$_bearer$token';
    authHeader['Content-Type'] = 'application/json';
    authHeader['Accept'] = 'application/json';

    return authHeader;
  }

  static Map<String, String> createAuthHeaderRefreshToken(
      String token, String deviceCode, String refresToken) {
    final authHeader = <String, String>{};
    authHeader[_authentication] = '$_bearer$token';
    authHeader['Content-Type'] = 'application/json';
    authHeader['Accept'] = 'application/json';

    authHeader[_refreshToken] = refresToken;

    return authHeader;
  }

  static Map<String, String> toParamMap(String key, List<String> list) {
    final ret = <String, String>{};
    list.asMap().forEach((index, value) {
      ret['$key[$index]'] = value.toString();
    });
    return ret;
  }
}
