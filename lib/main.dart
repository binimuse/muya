import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muya/app/app_language/translations.dart';
import 'package:muya/app/utils/lang_util.dart';
import 'package:muya/app/utils/prefrence_utility.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'app/routes/app_pages.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upgrader/upgrader.dart';
import 'dart:js' as js;
import 'package:muya/app/services/telegram_service.dart';

final botToastBuilder = BotToastInit();
late String selectedLocale;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();

  selectedLocale = LanUtil.getSelecctedLanguage();

  // Only show the delay on mobile platforms
  if (!kIsWeb) {
    await Future<void>.delayed(const Duration(milliseconds: 5000));
  }

  // Initialize Telegram WebApp
  try {
    final telegramWebApp = js.context['Telegram']?['WebApp'];
    if (telegramWebApp != null) {
      // Initialize the WebApp
      telegramWebApp.callMethod('ready');
      telegramWebApp.callMethod('expand');
    }
  } catch (e) {
    print('Error initializing Telegram WebApp: $e');
  }

  // Initialize GetX
  Get.put(TelegramService());

  runApp(
    ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return kIsWeb
            ? GetMaterialApp(
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              translations: MainTranslations(),
              locale: Locale(selectedLocale),
              navigatorObservers: [BotToastNavigatorObserver()],
              theme: ThemeData.light(),
              title: 'Muya'.tr,
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                child = botToastBuilder(context, child);
                return MediaQuery(
                  data: MediaQuery.of(
                    context,
                  ).copyWith(textScaler: const TextScaler.linear(0.8)),
                  child: child,
                );
              },
            )
            : UpgradeAlert(
              barrierDismissible: false,
              dialogStyle: UpgradeDialogStyle.cupertino,
              shouldPopScope: () => false,
              showIgnore: false,
              showLater: false,
              onUpdate: () => true,
              child: GetMaterialApp(
                initialRoute: AppPages.INITIAL,
                getPages: AppPages.routes,
                translations: MainTranslations(),
                locale: Locale(selectedLocale),
                navigatorObservers: [BotToastNavigatorObserver()],
                theme: ThemeData.light(),
                title: 'Muya'.tr,
                debugShowCheckedModeBanner: false,
                builder: (context, child) {
                  child = botToastBuilder(context, child);
                  return MediaQuery(
                    data: MediaQuery.of(
                      context,
                    ).copyWith(textScaler: const TextScaler.linear(0.8)),
                    child: child,
                  );
                },
              ),
            );
      },
    ),
  );
}
