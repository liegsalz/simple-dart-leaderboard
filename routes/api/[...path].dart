import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context, String page) {
  return Response.json(
    statusCode: 404,
    body: 'This resource does not exist. 🤷',
  );
}
