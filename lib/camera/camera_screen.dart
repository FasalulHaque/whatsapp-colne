import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];
int index = 0;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? cameraValue;
  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.ultraHigh);
    cameraValue = _cameraController.initialize();
    // ignore: avoid_print
    print(cameraValue);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: cameraValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // ignore: avoid_print
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.panorama,
                  size: 40,
                  color: Colors.white,
                ),
                const Icon(
                  Icons.panorama_fish_eye,
                  size: 75,
                  color: Colors.white,
                ),
                IconButton(
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // ignore: avoid_print
                      print(index);
                      setState(() {
                        index = index == 0 ? 1 : 0;
                        _cameraController = CameraController(
                            cameras[index], ResolutionPreset.max);
                        cameraValue = _cameraController.initialize();
                      });
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
