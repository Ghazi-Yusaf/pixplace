import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

// run test using "flutter drive --target=test_driver/HomeState.dart" in terminal

void main() {

  FlutterDriver driver;

  // initiates connection to the driver
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // severs connection to the driver after test is complete
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });


  test('bottomnavigationbar test', () async {

    // locates the section of code for testing using Keys
    await driver.waitFor(find.byValueKey('bottom'));

    // driver taps on the button with the specified Key and prints the message if successful
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
    print('clicked on Leaderboards');
  });
}