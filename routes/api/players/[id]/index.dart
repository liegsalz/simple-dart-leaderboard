import 'package:dart_frog/dart_frog.dart';

import '../../../../provider/repo_provider.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final method = context.request.method.value;

  switch (method) {
    case 'GET':
      return handleGet(id);
    default:
      return Response(statusCode: 401, body: 'Method not allowed.');
  }
}

Future<Response> handleGet(String id) async {
  final foundPlayer = await getPlayerRepository().getPlayerWithId(id);
  return foundPlayer == null
      ? Response(statusCode: 404, body: 'Player with id $id not found.')
      : Response.json(body: foundPlayer);
}
