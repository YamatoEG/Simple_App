import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key});

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  String model = 'Loading...';
  String os = 'Loading...';
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    //this will fetch device info after the build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDeviceInfo();
    });
  }

  Future<void> getDeviceInfo() async {
    try {
      if (Theme.of(context).platform == TargetPlatform.android) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        setState(() {
          model = androidInfo.model ?? 'Unknown Android Device';
          os = 'Android ${androidInfo.version.release}';
        });
      } else if (Theme.of(context).platform == TargetPlatform.iOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        setState(() {
          model = iosInfo.model ?? 'Unknown iOS Device';
          os = 'iOS ${iosInfo.systemVersion}';
        });
      }
    } catch (e) {
      print('Error getting device info: $e');
      setState(() {
        model = 'Error: ${e.toString()}';
        os = 'Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Device Model: $model",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Device OS: $os",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
