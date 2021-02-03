import 'package:flutter/material.dart';

import 'package:clean_settings/clean_settings.dart';

// docs:
// https://pub.dev/packages/clean_settings

String username = "lovely_username";
String bio =
    "Using hardware rendering with device sdk gphone x86 arm. If you notice graphics artifacts, consider enabling software rendering with";

SettingSection detailsSection() => SettingSection(title: "Details", items: [
      SettingTextItem(
        title: "Username",
        displayValue: username,
        onChanged: (value) => {},
      ),
      SettingTextItem(
        title: "Bio",
        displayValue: bio,
        onChanged: (value) => {},
      ),
    ]);

SettingSection gameSection() => SettingSection(title: "Game", items: [
      SettingItem(title: "Channels", onTap: () => {}),
      SettingItem(title: "Friends", onTap: () => {}),
    ]);

Widget EditProfilePage() =>
    SettingContainer(sections: [detailsSection(), gameSection()]);
