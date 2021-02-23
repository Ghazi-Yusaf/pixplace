
import 'package:http/http.dart' as http;
import 'dart:io';


void blurrFacePictures(File file) async {

  // var image = file.readAsBytesSync();

  String api_key = "7581273e14c54c72832c127f8789caca";
  String url = "https://res.cloudinary.com/demo/image/upload/e_blur_faces/young_couple.jpg";


  var request = http.MultipartRequest(
    "POST",
    Uri.parse(url),
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
  });
}


void main() {
  String filePath = Directory.current.path+"\\lib\\firebase\\services\\meme.png";

  File file = new File(filePath);



  blurrFacePictures(file);
}