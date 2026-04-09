import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:intl/intl.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoInputFileUpload extends StatefulWidget {
  const DemoInputFileUpload({super.key});

  @override
  State<DemoInputFileUpload> createState() => _DemoInputFileUploadState();
}

class _DemoInputFileUploadState extends State<DemoInputFileUpload> {
  /// Themes
  late FUIThemeCommonColors fuiColors;

  /// Controllers
  late DropzoneViewController dzvCtrl;
  late _FileItemController fiCtrl;

  /// Attributes & Flags
  List<FUIFileUploadItem> fuItemList = [];
  Map<Key, FUIFUItemController> fuItemCtrlMap = {};

  @override
  void initState() {
    super.initState();

    fiCtrl = _FileItemController();
  }

  @override
  void dispose() {
    var itr = fuItemCtrlMap.values.iterator;

    while (itr.moveNext()) {
      itr.current.close();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H5(const Text('File Select / Dropbox')),
          FUISpacer.vSpace10,
          kIsWeb ? _buildFileSelectForWeb() : _buildFileSelectMobileApp(),
          FUISpacer.vSpace10,
          BlocProvider(
            create: (_) => fiCtrl,
            child: BlocBuilder(
              bloc: fiCtrl,
              builder: (BuildContext context, List<_FileItem>? fileItemList) {
                if (fileItemList != null) {
                  var itr = fileItemList.iterator;

                  while (itr.moveNext()) {
                    _FileItem fi = itr.current;

                    if (fi.delete != null && fi.delete!) {
                      _mockDeleteFile(fi);
                    } else {
                      _mockUploadFile(fi);
                    }
                  }
                }

                return _buildFileListWidget();
              },
            ),
          )
        ],
      ),
    );
  }

  _buildFileListWidget() {
    return SizedBox(
      height: 200,
      child: ImplicitlyAnimatedList<Widget>(
        items: fuItemList,
        areItemsTheSame: (a, b) => a.key == b.key,
        itemBuilder: (context, animation, item, index) {
          return SizeFadeTransition(
            sizeFraction: 0.7,
            curve: Curves.easeInOut,
            animation: animation,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: item,
            ),
          );
        },
        removeItemBuilder: (context, animation, oldItem) {
          return FadeTransition(
            opacity: animation,
            child: oldItem,
          );
        },
      ),
    );
  }

  _buildFileSelectForWeb() {
    return GestureDetector(
      onTap: () async {
        dzvCtrl.pickFiles(multiple: true).then((htmlFileList) {
          _readHtmlFileList(htmlFileList);
        });
      },
      child: SizedBox(
        height: FUIFileUploadTheme.dropboxHeight,
        child: Stack(
          children: [
            DropzoneView(
              onCreated: (DropzoneViewController _) {
                dzvCtrl = _;
              },
              onError: (String? msg) {},
              onDropFiles: (List<dynamic>? htmlFileList) {
                _readHtmlFileList(htmlFileList);
              },
              onLeave: () {},
            ),
            FUIFileUploadDropbox(),
          ],
        ),
      ),
    );
  }

  _buildFileSelectMobileApp() {
    return GestureDetector(
      onTap: () async {
        FilePickerResult? result = await FilePicker.pickFiles(allowMultiple: true);

        if (result != null) {
          _readDartIOFileList(result.files);
        }
      },
      child: FUIFileUploadDropbox(),
    );
  }

  /// Only for Web DropzoneView (Don't use this for native mobile file picker)
  _readHtmlFileList(List<dynamic>? htmlFileList) async {
    if (htmlFileList != null) {
      var itr = htmlFileList.iterator;

      List<_FileItem> itemList = [];

      while (itr.moveNext()) {
        var htmlFile = itr.current;
        String filename = await dzvCtrl.getFilename(htmlFile);
        String mimeType = await dzvCtrl.getFileMIME(htmlFile);
        int size = await dzvCtrl.getFileSize(htmlFile);

        itemList.add(_FileItem(
          fuItemKey: UniqueKey(),
          filename: filename,
          mimeType: mimeType,
          size: size,
          htmlFile: htmlFile,
        ));
      }

      fiCtrl.addFileItems(itemList);
    }
  }

  _readDartIOFileList(List<PlatformFile> dartIOFileList) async {
    if (dartIOFileList.isNotEmpty) {
      List<_FileItem> itemList = [];
      var itr = dartIOFileList.iterator;

      while (itr.moveNext()) {
        PlatformFile ioFile = itr.current;
        String filename = ioFile.name;
        String mimeType = 'Whatever';
        int size = ioFile.size;

        itemList.add(_FileItem(
          fuItemKey: UniqueKey(),
          filename: filename,
          mimeType: mimeType,
          size: size,
          platformFile: ioFile,
        ));
      }

      fiCtrl.addFileItems(itemList);
    }
  }

  _mockUploadFile(_FileItem fileItemEvent) {
    FUIFUItemController fuCtrl = FUIFUItemController();
    NumberFormat nf = NumberFormat('#');

    FUIFileUploadItem item = FUIFileUploadItem(
      key: fileItemEvent.fuItemKey,
      fuiFUItemController: fuCtrl,
      descLine1: Text(fileItemEvent.filename),
      descLine2: Text('Type: ${fileItemEvent.mimeType}'),
      descLine3: Text('Uploading: 0kb'),
      paceBarPosition: FUIPanePaceBarPosition.bottom,
      paceBarCurrentValue: 0,
      paceBarRepeating: false,
      sidePopupMenuIconButtonShowOnHover: true,
      sidePopupMenuIconButton: FUIPopupMenuIconButton(
        icon: const Icon(CupertinoIcons.ellipsis_vertical),
        fuiPopupMenuItemList: [
          FUIPopupMenuItem(
            icon: const Icon(CupertinoIcons.trash),
            label: const Text('Delete'),
            onTap: () {
              fiCtrl.deleteFileItems([
                _FileItem(
                  fuItemKey: fileItemEvent.fuItemKey,
                  filename: '',
                  mimeType: '',
                  size: 0,
                  delete: true,
                ),
              ]);
            },
          ),
        ],
      ),
    );

    fuItemCtrlMap[fileItemEvent.fuItemKey] = fuCtrl;
    fuItemList.add(item);

    /// Simulate a mock upload process
    beginMockUploadProcess() {
      fuCtrl.trigger(const FUIFUItemEvent(
        enable: false,
        blur: true,
        paceBarShow: true,
        paceBarValue: 0,
        spinnerShow: true,
      ));

      Future.delayed(const Duration(seconds: 1), () {
        // 33%
        double size = (fileItemEvent.size / 1000 / 3);
        String sizeStr = '${nf.format(size)}kb';

        fuCtrl.trigger(FUIFUItemEvent(
          descLine3: Text('Uploaded: $sizeStr'),
          paceBarValue: 33,
        ));

        Future.delayed(const Duration(seconds: 1), () {
          // 66%
          double size = (fileItemEvent.size / 1000000 / 3 * 2);
          String sizeStr = '${nf.format(size)}kb';

          fuCtrl.trigger(FUIFUItemEvent(
            descLine3: Text('Uploaded: $sizeStr'),
            paceBarValue: 66,
          ));

          Future.delayed(const Duration(seconds: 1), () {
            // 100%
            double size = (fileItemEvent.size / 1000000);
            String sizeStr = '${nf.format(size)}kb';

            fuCtrl.trigger(FUIFUItemEvent(
              descLine3: Text('Completed: $sizeStr'),
              paceBarValue: 100,
            ));

            Future.delayed(const Duration(seconds: 1), () {
              fuCtrl.trigger(FUIFUItemEvent(
                enable: true,
                blur: false,
                descLine3: Text('Size: $sizeStr'),
                spinnerShow: false,
                paceBarShow: false,
                paceBarValue: 0,
              ));
            });
          });
        });
      });
    }

    beginMockUploadProcess();
  }

  _mockDeleteFile(_FileItem fileItemEvent) {
    var itr = fuItemList.iterator;

    while (itr.moveNext()) {
      var item = itr.current;
      if (fileItemEvent.fuItemKey == item.key) {
        if (fuItemCtrlMap.containsKey(item.key)) {
          fuItemCtrlMap[item.key]!.close();
          fuItemCtrlMap.remove(item.key);
        }

        fuItemList.remove(item);

        break;
      }
    }
  }
}

class _FileItem {
  final Key fuItemKey;
  final String filename;
  final String mimeType;
  final int size;
  final dynamic htmlFile;
  final dynamic platformFile;
  final bool? delete;

  _FileItem({
    required this.fuItemKey,
    required this.filename,
    required this.mimeType,
    required this.size,
    this.htmlFile,
    this.platformFile,
    this.delete,
  });
}

class _FileItemController extends Cubit<List<_FileItem>?> {
  List<_FileItem>? demoFileItemList;

  _FileItemController({this.demoFileItemList}) : super(demoFileItemList);

  addFileItems(List<_FileItem> demoFileItemList) {
    this.demoFileItemList = demoFileItemList;
    emit(demoFileItemList);
  }

  deleteFileItems(List<_FileItem> demoFileItemList) {
    this.demoFileItemList = demoFileItemList;
    emit(demoFileItemList);
  }
}
