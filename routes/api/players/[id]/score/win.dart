import 'package:dart_frog/dart_frog.dart';

import '../../../../../provider/repo_provider.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final method = context.request.method.value;

  switch (method) {
    case 'POST':
      return handlePost(id);
    default:
      return Response(statusCode: 401, body: 'Method not allowed.');
  }
}

Future<Response> handlePost(String id) async {
  final player = await getPlayerRepository().addWinForPlayerWithId(id);

  return player != null
      ? Response.json(body: player)
      : Response(
          statusCode: 500,
          body: 'Error adding win. Something went wrong. Please try again.',
        );
}
