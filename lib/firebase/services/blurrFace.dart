import 'dart:io';
import 'package:http/http.dart' as http;

Future<File> blurFacePictures(String filePath) async {
  File file = new File(filePath);

  String url = "176.58.121.80:5000";

//   var request = http.MultipartRequest(
//     "POST",
//     Uri.http(url, "/"),
//   );

  request.headers["Content-Type"] = 'multipart/form-data';

  request.files.add(
    http.MultipartFile.fromBytes(
      "image",
      file.readAsBytesSync(),
      //   contentType: MediaType(
      //       "image", "${image.path.split(".").last}"),
    ),
  );

//   var response = await request.send();

  List<List<int>> byteStream = await response.stream.toList();

  List<int> newbyteStream = byteStream.expand((element) => element).toList();
  print(newbyteStream.length);
}

void main() async {
  String filePath =
      Directory.current.path + "\\lib\\firebase\\services\\meme.png";

  File file = await blurFacePictures(filePath);
}
