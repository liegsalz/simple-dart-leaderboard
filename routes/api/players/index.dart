import 'package:dart_frog/dart_frog.dart';

import '../../../provider/repo_provider.dart';

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method.value;

  switch (method) {
    case 'GET':
      return handleGet();
    case 'POST':
      return handlePost(context);
    case 'DELETE':
      return handleDelete();
    default:
      return Response(statusCode: 401, body: 'Method not allowed.');
  }
}

Future<Response> handleGet() async {
  final players = await getPlayerRepository().getAllPlayers();
  return Response.json(body: players);
}

Future<Response> handlePost(RequestContext context) async {
  final dynamic body;
  try {
    body = await context.request.json();
  } catch (e) {
    return Response(statusCode: 400, body: 'You must provide a body.');
  }

  if (body['name'] == null) {
    return Response(statusCode: 400, body: 'Name is required.');
  }

  final addedPlayer =
      await getPlayerRepository().addPlayer(body['name'] as String);

  return addedPlayer != null
      ? Response.json(body: addedPlayer)
      : Response(
          statusCode: 500,
          body: 'Error adding player. Something went wrong. Please try again.',
        );
}

Future<Response> handleDelete() async {
  final cleandDb = await getPlayerRepository().resetDb();

  return cleandDb
      ? Response()
      : Response(
          statusCode: 500,
          body: 'Error resetting database. Please try again.',
        );
}
