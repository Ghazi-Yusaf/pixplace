import 'package:pixplace/entities/Tag.dart';

class Channel extends Tag {
  final String owner;

  Channel(String tagID, this.owner) : super(tagID);
}
