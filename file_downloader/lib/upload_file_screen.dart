import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({Key? key}) : super(key: key);

  @override
  _UploadFileScreenState createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  File? _file;

  Future getFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf', 'doc'], type: FileType.custom);

    print(result);
    if (result != null) {
      _file = File(result.files.single.path!);
      print("FILE PATH " + _file!.path);
      setState(() {});
    } else {
      //user cancelled the file picker.
      print('cancelled');
    }
  }

  void _uploadFile(filePath) async {
    String fileName = path.basename(filePath.path);

    print("file base name:$fileName");

    try {
      FormData formData = FormData.fromMap({
        "name": "rajika",
        "age": 22,
        "file": await MultipartFile.fromFile(filePath.path, filename: fileName),
      });

      Response response = await Dio().post('url', data: formData);
      print("File upload response: $response");
      // _showSnackBarMsg(response.data['message']);
    } catch (e) {
      print("expectation Caugch: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async {
              await getFile();
            },
            child: Text(
              "Upload",
              style: TextStyle(color: Colors.black),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
          ),
          _file == null
              ? Container()
              : Container(
                  child: Text('file selected : ${path.basename(_file!.path)}'),
                ),
        ],
      ),
    );
  }
}
