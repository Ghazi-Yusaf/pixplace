import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';


void main() {

  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });


  test('bottomnavigationbar test', () async {
    await driver.waitFor(find.byValueKey('bottom'));

    final firstItem = find.byValueKey('Home');
    await driver.tap(firstItem);
    print('clicked on Home');

    final secondItem = find.byValueKey('Profile');
    await driver.tap(secondItem);
    print('clicked on Profile');

    final thirdItem = find.byValueKey('Post');
    await driver.tap(thirdItem);
    print('clicked on Post');

    final fourthItem = find.byValueKey('Achievements');
    await driver.tap(fourthItem);
    print('clicked on Achievements');

    final fifthItem = find.byValueKey('Leaderboards');
    await driver.tap(fifthItem);
    print('clicked on Leaderbaords');
  });
}