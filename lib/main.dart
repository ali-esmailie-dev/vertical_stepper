import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vertical_stepper/vertical_stepper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          background: Colors.white,
        ),
        fontFamily: 'IranYekanXFaNum',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          toolbarTextStyle: TextStyle(
            fontFamily: 'IranYekanXFaNum',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStepIndex = 1;
  final List<String> stepTitles = [
    'احراز هویت',
    'احراز محل سکونت',
    'اعتبار سنجی بانکی',
    'ارسال مدارک',
    'ارسال تصاویر و اطلاعات چک‌ها',
    'ارسال فیزیکی چک‌ها',
    'در انتظار تایید',
    'تخصیص اعتبار',
  ];
  final List<String> stepDescriptions = [
    'اطلاعات هویتی خود را وارد کنید. این اطلاعات برای شناسایی و احراز هویت شما نزد موسسه مالی تامین کننده اعتبار کاربرد دارد و اطلاعات شما محفوظ خواهد ماند.',
    'اطلاعات محل سکونت خود را به صورت دقیق وارد کنید. این اطلاعات برای شناسایی و  محل سکونت شما نزد موسسه مالی تامین کننده اعتبار کاربرد دارد و اطلاعات شما محفوظ خواهد ماند.',
    'اعتبار بانکی، اعتبار هر شخص را نزد بانک مرکز جمهوری اسلامی ایران نشان می‌دهد که جهت اعتبار سنجی اعتبار سنجی باید پرداخت کنید که این هزینه مربوط به بانک مرکزی می‌باشد.',
    'تصویر مدارک مورد نیاز را ثبت نموده و ارسال نمایید، توجه داشته باشید که تمامی تصاویر با کیفیت بالا ثبت شوند.',
    'اطلاعات چک‌های بانکی خود را پر کرده و تصویر هر چک را ثبت نموده و ارسال نمایید، توجه داشته باشید که تمامی تصاویر با کیفیت بالا ثبت شوند.',
    'اطلاعات چک‌های بانکی شما تایید شده است. چک ها را از طریق پست به آدرس تهران با کد پستی ۶۷۸۹۶۷۹۶۹۷ ارسال کنید و شماره مرسوله پستی را وارد نمایید. توجه داشته باشید که در صورت عدم ارسال تا پنج روز آینده دوباره نیاز به اعتبار سنجی بانکی خواهید داشت.',
    'تمامی اطلاعات و مدارک مورد نیاز با موفقیت دریافت شد. لطفا منتظر بررسی و تایید کارشناسان موسسه مالی تامین کننده اعتبار باشید.',
    'اعتبار درخواستی شما تخصیص داده شد و در زمان تعیین شده به کیف پول شما اضافه خواهد شد. هم اکنون می‌توانید از هزاران فروشگاه طرف قرارداد با ما خرید نمایید.',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مراحل دریافت اعتبار مالی'),
      ),
      body: ListView(
        children: [
          VerticalStepper(
            totalSteps: 8,
            currentStepIndex: currentStepIndex,
            stepTitles: stepTitles,
            stepDescriptions: stepDescriptions,
            onTap: (final int value) {
              setState(() {
                currentStepIndex = value;
              });
            },
            passedStepsBackgroundColor: Colors.green,
            currentStepBackgroundColor: Colors.blue,
            nextStepsBackgroundColor: Colors.black26,
            stepTextColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
