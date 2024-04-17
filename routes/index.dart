import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response(
    headers: {HttpHeaders.contentTypeHeader: ContentType.html.value},
    body: html,
  );
}

const html = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API Documentation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #dddddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        h1, h2 {
            color: #333;
        }
        p {
            color: #666;
        }
    </style>
</head>
<body>
    <h1>API Documentation</h1>
    <p>The following documentation outlines the available routes for the Player's API.</p>

    <h2>/api/players</h2>
    <p>Retrieves a list of all players currently in the system.</p>
    <table>
        <tr>
            <th>Method</th>
            <th>Route</th>
            <th>Description</th>
            <th>body</th>
        </tr>
        <tr>
            <td>GET</td>
            <td>/api/players</td>
            <td>Gets all players.</td>
            <td>n/a</td>
        </tr>

        <tr>
            <td>POST</td>
            <td>/api/players</td>
            <td>Creates a new player with the given name.</td>
            <td>{"name": "Bryan Liegsalz"}</td>
        </tr>

          <tr>
            <td>DELETE</td>
            <td>/api/players</td>
            <td>Resets database.</td>
            <td>n/a</td>
        </tr>
    </table>

    <h2>/api/players/&lt;player_id&gt;</h2>
    <p>Retrieves information about a specific player by their ID.</p>
    <table>
        <tr>
            <th>Method</th>
            <th>Route</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>GET</td>
            <td>/api/players/&lt;player_id&gt;</td>
            <td>Gets player with id <i>player_id</i>.</td>
        </tr>
    </table>

    <h2>/api/players/&lt;player_id&gt;/score/win</h2>
    <p>Adds a win to the player's score with the specified ID.</p>
    <table>
        <tr>
            <th>Method</th>
            <th>Route</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>POST</td>
            <td>/api/players/&lt;player_id&gt;/score/win</td>
            <td>Adds a win to the player with id <i>player_id</i>.</td>
        </tr>
    </table>
</body>
</html>
""";
