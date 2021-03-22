<<<<<<< HEAD
import 'dart:io';
import 'package:http/http.dart' as http;


void blurFacePictures(String filePath) async {
  File file = new File(filePath);

  String url = "176.58.121.80:5000";
=======
// import 'package:http/http.dart' as http;
// import 'dart:io';

// import 'package:image/image.dart';

// void blurFacePictures(File file) async {
//   String url = "176.58.121.80:5000";
>>>>>>> main

//   var request = http.MultipartRequest(
//     "POST",
//     Uri.http(url, "/"),
//   );

<<<<<<< HEAD
  request.headers["Content-Type"] = 'multipart/form-data';

  request.files.add(
    http.MultipartFile.fromBytes(
      "image",
      file.readAsBytesSync(),
    ),
  );
=======
//   request.headers["Content-Type"]='multipart/form-data';

//   request.files.add(
//     http.MultipartFile.fromBytes(
//       "image",
//       file.readAsBytesSync(),
//     //   contentType: MediaType(
//     //       "image", "${image.path.split(".").last}"),
//     ),
//   );
>>>>>>> main

//   var response = await request.send();

<<<<<<< HEAD
  List<List<int>> byteStream = await response.stream.toList();

  List<int> imageByteStream = byteStream.expand((element) => element).toList();
  print(imageByteStream);
}

void main() async {
  String filePath =
      Directory.current.path + "\\lib\\firebase\\services\\meme.png";

  blurFacePictures(filePath);
}
=======
//   await response.stream.toList().then((value) {
//     List<int> newbyteStream = value.expand((element) => element).toList();
//     print(newbyteStream);
//     Image image = decodeJpg(newbyteStream);

//     File('thumbnail.jpg')..writeAsBytesSync(encodePng(image));
//   });

//   // EXAMPLE
//   //https://pub.dev/packages/image

//   // print(response.statusCode);
//   // print(response.toString());
//   //
//   // print(response.headers);
//   print(response.stream.toString());
// }

// void main() {
//   String filePath = Directory.current.path+"\\lib\\firebase\\services\\meme.png";

//   File file = new File(filePath);

//   blurFacePictures(file);
// }
>>>>>>> main
