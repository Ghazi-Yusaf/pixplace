import 'package:flutter/material.dart';

import 'package:clean_settings/clean_settings.dart';
import 'package:pixplace/widgets/ButtonWidget.dart';

// docs:
// https://pub.dev/packages/clean_settings

// VARIABLES IMPORTANT!
String status = "Available";
bool smartReply = true;
bool notifications = true;

SettingSection appSection() => SettingSection(title: "App", items: [
      SettingItem(title: "Privacy Policy", onTap: () => {}),
      SettingItem(title: "Help", onTap: () => {}),
    ]);

SettingSection accountSection() => SettingSection(title: "Account", items: [
      SettingRadioItem<String>(
          title: "Status",
          displayValue: "($status)",
          selectedValue: status,
          items: [
            SettingRadioValue("Busy", "Busy"),
            SettingRadioValue("Available", "Available"),
            SettingRadioValue("Offline", "Offline")
          ],
          onChanged: (v) => status = v)
    ]);

SettingSection generalSection() => SettingSection(
      title: "General",
      items: [
        SettingCheckboxItem(
          title: 'Location',
          value: smartReply,
          onChanged: (v) => smartReply = v,
          description: 'Tracks your position while using the app',
          priority: ItemPriority.low,
        ),
        SettingSwitchItem(
          title: "Notifications",
          value: notifications,
          onChanged: (v) => notifications = v,
          description: "Notifies you about important updates",
        ),
      ],
    );

Widget SettingsPage() => SettingContainer(
    sections: [generalSection(), accountSection(), appSection()]);
