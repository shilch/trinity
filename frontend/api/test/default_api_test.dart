import 'package:openapi/openapi.dart';
import 'package:test/test.dart';

/// tests for DefaultApi
void main() {
  final instance = Openapi().getDefaultApi();

  group(DefaultApi, () {
    // Change display name
    //
    //Future changeDisplayName(String username, String displayName) async
    test('test changeDisplayName', () async {
      // TODO
    });

    // Grid power information
    //
    // Get current information of the power grid
    //
    //Future<BuiltList<Grid>> getGrids() async
    test('test getGrids', () async {
      // TODO
    });

    // Log the user in
    //
    //Future login(String username, String password) async
    test('test login', () async {
      // TODO
    });

    // Show user information
    //
    //Future showUserInfo() async
    test('test showUserInfo', () async {
      // TODO
    });
  });
}
