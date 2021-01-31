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
    //await driver.tap(find.text('Home'));
    final firstItem = find.byValueKey('Home');
    await driver.tap(firstItem);
    print('clicked on Home');
    //await driver.tap(find.text('Profile'));
    final secondItem = find.byValueKey('Profile');
    await driver.tap(secondItem);
    print('clicked on Profile');
    //await driver.tap(find.text('Post'));
    final thirdItem = find.byValueKey('Post');
    await driver.tap(thirdItem);
    print('clicked on Post');
    //await driver.tap(find.text('Achievements'));
    final fourthItem = find.byValueKey('Achievements');
    await driver.tap(fourthItem);
    print('clicked on Achievements');
    //await driver.tap(find.text('Leaderbaords'));
    final fifthItem = find.byValueKey('Leaderboards');
    await driver.tap(fifthItem);
    print('clicked on Leaderbaords');
  });
}