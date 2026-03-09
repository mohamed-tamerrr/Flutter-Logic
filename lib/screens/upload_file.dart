import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_file/open_file.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? _fileName;
  String? _filePath;

  Future<void> _pickFile() async {
    FilePicker.platform
        .pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'docx', 'doc', 'jpg'],
        )
        .then((value) {
          if (value != null) {
            setState(() {
              _fileName = value.files.single.name;
              _filePath = value.files.single.path;
            });
          }
        });
  }

  Future<void> _viewFile() async {
    /// open file package to view file
    if (_filePath != null) {
      await OpenFile.open(_filePath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130),
            Container(
              width: 350,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    width: 60,
                    "assets/svgs/doc.svg",
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _fileName == null
                            ? "Upload File"
                            : "$_fileName",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("pdf, docx, doc, jpg"),
                    ],
                  ),
                  Spacer(),

                  PopupMenuButton(
                    color: Colors.white,
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          onTap: _pickFile,
                          child: Row(
                            children: [
                              Icon(Icons.upload_file),
                              SizedBox(width: 13),
                              Text("Upload"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: _viewFile,
                          child: Row(
                            children: [
                              Icon(Icons.visibility),
                              SizedBox(width: 13),
                              Text("View"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: _pickFile,
                          child: Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 13),
                              Text("Change"),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () => setState(() {
                            _fileName = null;
                            _filePath = null;
                          }),
                          child: Row(
                            children: [
                              Icon(Icons.delete),
                              SizedBox(width: 13),
                              Text(
                                "Delete",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
