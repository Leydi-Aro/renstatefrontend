
import 'dart:io';

import 'package:http/http.dart' as http;





class MediaService {

  final String apiUrl;

  MediaService() :this.apiUrl='http://192.168.18.15:8080/api/media/post';


  Future<void> _uploadImages(int postId, List<File> _images) async {


    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      for (var image in _images) {
        request.files.add(
          http.MultipartFile(
            'files',
            image.readAsBytes().asStream(),
            image.lengthSync(),
            filename: image.path.split("/").last,
          ),
        );
      }

      var response = await request.send();
      if (response.statusCode == 200) {
        print("Images uploaded successfully");
      } else {
        print("Error uploading images. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading images: $e");
    }
  }
}