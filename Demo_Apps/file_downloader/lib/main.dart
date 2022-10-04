import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_downloader/upload_file_screen.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = false;
  double progress = 0;

  Future<bool> saveFile(String url, String filename) async {
    Directory? directory;
    print('start');
    try {
      if (Platform.isAndroid) {
        if (await requestPermission(Permission.storage)) {
          /*
          Path to a directory where the application may access top level storage.
           The current operating system should be determined before issuing this function
            call, as this functionality is only available on Android.
           */
          directory = await getExternalStorageDirectory();
          // /storage/emulated/0/Android/data/com.amaldev.file_downloader/files
          print(directory?.path);
          directory = Directory('/storage/emulated/0/DemoAppFolder');
          print(directory.path);
        } else {
          return false;
        }
      } else {
        directory = (await getApplicationDocumentsDirectory());
      }
      //If the directory doesn't exist then create it.
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        File saveFile = File(directory.path +
            '/$filename'); //this is complete path of the file that we want to create.
        //Now we have to download the file and save it at this path.
        await Dio().download(url, saveFile.path,
            onReceiveProgress: (downloadedSize, totalSize) {
          progress = downloadedSize / totalSize;
          print(progress);
          setState(() {});
        });

        print(saveFile.path);
        await OpenFile.open(saveFile.path);
        return true;
      }
    } on Exception catch (e) {
      print(e);
    }
    print('in the end');
    return false;
  }

  void downloadFile() async {
    setState(() {
      loading = true;
    });

    bool isDownloaded = await saveFile(
        'https://www.cs.purdue.edu/homes/ayg/CS251/slides/chap2.pdf',
        'chapter96_${DateTime.now()}.pdf');
    if (isDownloaded) {
      print("Downloaded");
    } else {
      print('error downloading');
    }

    setState(() {
      loading = false;
    });
  }

  //Handles the permission dialog.
  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      PermissionStatus result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  int currentActive = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentActive,
          onTap: (index) {
            currentActive = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Download'),
            BottomNavigationBarItem(
                icon: Icon(Icons.upload_file), label: 'Upload'),
          ]),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: currentActive == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      downloadFile();
                    },
                    child: const Text(
                      "Download",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                  ),
                  loading
                      ? LinearProgressIndicator(
                          value: progress,
                        )
                      : const SizedBox(width: 0, height: 0),
                ],
              ),
            )
          : const UploadFileScreen(),
    );
  }
}
