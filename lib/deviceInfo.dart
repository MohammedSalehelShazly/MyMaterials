import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//import 'package:flutter/services.dart;

class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {

  List infoList = [];
  Map infoMap = {};


  static DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  static AndroidDeviceInfo MyandroidInfo ;
  _myDeviceInfo() async{
    MyandroidInfo = await deviceInfo.androidInfo ;
    setState(() {
      infoMap = {
        'brand' : '${MyandroidInfo.brand}' ,
        'Running on' : '${MyandroidInfo.model}',
        'id' : '${MyandroidInfo.id}' ,
        'androidId' : '${MyandroidInfo.androidId}' ,
        'isPhysicalDevice' : '${MyandroidInfo.isPhysicalDevice}' ,
        'board' : '${MyandroidInfo.board}' ,
        'bootloader' : '${MyandroidInfo.bootloader}' ,
        'device' : '${MyandroidInfo.device}',
        'hardware ' : '${MyandroidInfo.hardware}',
        'host' : '${MyandroidInfo.host}' ,
        'product' : '${MyandroidInfo.product}'  ,
        'version' : '${MyandroidInfo.version}' ,
        'type' : '${MyandroidInfo.type}' ,
        'tags' : '${MyandroidInfo.tags}'  ,
        'supportedAbis' : '${MyandroidInfo.supportedAbis}' ,
        'supported64BitAbis' : '${MyandroidInfo.supported64BitAbis}' ,
        'display' : '${MyandroidInfo.display}' ,
        'fingerprint' : '${MyandroidInfo.fingerprint}' ,
        'systemFeatures' : '${MyandroidInfo.systemFeatures}' ,
      };


      infoList = [
        'brand.......${MyandroidInfo.brand}' ,
        'Running on.......${MyandroidInfo.model}' ,
        'id.......${MyandroidInfo.id}' ,
        'androidId.......${MyandroidInfo.androidId}' ,
        'isPhysicalDevice.......${MyandroidInfo.isPhysicalDevice}',
        'board.......${MyandroidInfo.board}',
        'bootloader.......${MyandroidInfo.bootloader}' ,
        'device.......${MyandroidInfo.device}',
        'hardware.......${MyandroidInfo.hardware}',
        'host.......${MyandroidInfo.host}' ,
        'product.......${MyandroidInfo.product}'  ,
        'version.......${MyandroidInfo.version}' ,
        'type.......${MyandroidInfo.type}' ,
        'tags.......${MyandroidInfo.tags}'  ,
        'supportedAbis.......${MyandroidInfo.supportedAbis}' ,
        'supported64BitAbis.......${MyandroidInfo.supported64BitAbis}' ,
        'display.......${MyandroidInfo.display}' ,

        //'fingerprint.......${MyandroidInfo.fingerprint}' ,
        //'systemFeatures.......${MyandroidInfo.systemFeatures}' ,
      ];

    });
  }

  _myTextStyle ()=> TextStyle(color: Colors.white ,fontWeight: FontWeight.bold ,fontSize: MediaQuery.textScaleFactorOf(context)*17);

  var scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    _myDeviceInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Center(
              //child: SelectableText(infoList.map((element) => '$element' ).toList().toString() ,),

              child: Column(
                children: List.generate(infoMap.length, (index) =>
                    /*Card(
                      color: Colors.purple[800],
                      child: ListTile( /// how copy with long press ??
                        title: SelectableText(infoMap.keys.toList()[index].toString() ,style: _myTextStyle(myColor: Colors.blue[100])),
                        trailing: SelectableText(infoMap.values.toList()[index].toString() ,style: _myTextStyle() ,textAlign: TextAlign.right,),
                      ),
                    )*/
                    InkWell(
                      onLongPress: (){
                        copy(infoMap.values.toList()[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: index.isEven ? Colors.blueGrey : Colors.black87,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(child: Text(infoMap.keys.toList()[index].toString() ,style: _myTextStyle())),
                            Expanded(child: Text(infoMap.values.toList()[index].toString() ,style: _myTextStyle() ,textAlign: TextAlign.left,)),
                          ],
                        ),
                      ),
                    )
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
  copy(String txt){
    Clipboard.setData(ClipboardData(text: txt));
    return scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Copied' ,style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
      duration: Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
    ));
  }

}