import 'dart:io';
import 'package:http/http.dart' as http;


void blurFacePictures(String filePath) async {
  File file = new File(filePath);

  String url = "176.58.121.80:5000";

  var request = http.MultipartRequest(
    "POST",
    Uri.http(url, "/"),
  );

  request.headers["Content-Type"] = 'multipart/form-data';

  request.files.add(
    http.MultipartFile.fromBytes(
      "image",
      file.readAsBytesSync(),
    ),
  );

  var response = await request.send();

  List<List<int>> byteStream = await response.stream.toList();

  List<int> imageByteStream = byteStream.expand((element) => element).toList();
  print(imageByteStream);
}

void main() async {
  String filePath =
      Directory.current.path + "\\lib\\firebase\\services\\meme.png";

  blurFacePictures(filePath);
}
