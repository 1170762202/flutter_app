import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/base/app_page_route.dart';
import 'package:flutter_app/base/routes.dart';
import 'package:flutter_app/notify/count_notify.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:provider/provider.dart';

void main() {
  // debugPaintSizeEnabled = true; //打开视觉调试开关
  //必须要添加这个进行初始化 否则下面会错误，强制竖屏
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountNotify()),
      ],
      child: MyApp(),
    ));
  });
}
// ignore: top_level_function_literal_block
final onGenerateRoute = (RouteSettings settings) {
  final String? routeName = settings.name;
  final Function? pageBuilder = routes[routeName];
  final Route route = AppPageRoute(
      builder: (context) => pageBuilder!(context), settings: settings);
  return route;
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // 设计稿中设备的尺寸(单位随意,但在使用过程中必须保持一致)
      allowFontScaling: false, // 设置字体大小是否根据系统的“字体大小”辅助选项来进行缩放
      builder: () {
        return MaterialApp(
            title: 'MyApp',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              splashColor: Color(0),
              highlightColor: Color(0),
              primarySwatch: Colors.blue,
            ),
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute);
      },
    );
  }
}
