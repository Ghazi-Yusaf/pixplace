
import 'package:http/http.dart' as http;
import 'dart:io';


void blurrFacePictures(File file) async {

  // var image = file.readAsBytesSync();


  String url = "176.58.121.80:5000";


  var request = http.MultipartRequest(
    "POST",
    Uri.http(url, "/"),
  );

  request.headers["Content-Type"]='multipart/form-data';

  print(file.path.split(".").last);
  request.files.add(
    http.MultipartFile.fromBytes(
      "image",
      file.readAsBytesSync(),
    //   contentType: MediaType(
    //       "image", "${image.path.split(".").last}"),
    ),
  );

  request.send().then((value) {
    print(value.statusCode);
    print(value.toString());

    print(value.headers);
    print(value.stream);
    return;
  });
}


void main() {
  String filePath = Directory.current.path+"\\lib\\firebase\\services\\meme.png";

  File file = new File(filePath);



  blurrFacePictures(file);
}