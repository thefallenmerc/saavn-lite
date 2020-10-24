part of 'theme.dart';

class ThemeColorsLight {
  ThemeColorsLight._();

  static const Color disableButtonColor = Color(0xFF848d95);
  static const Color primaryDarkColor = Color(0xFFfefefe);
  static const Color primaryExtraDarkColor = Color(0xFFfefefe);
  static const Color onPrimary = Color(0xFFffffff);
  static const Color appBarColor = Color(0xFFfafafa);
  static const Color secondary = Color(0xFF0545FF);

  static const Color primary = Color(0xFF0084ff);
  static const Color primaryLight = Color(0xFFfBCDFFF);
  static const Color accentColor = Color(0xffff0000);
  static const Color background = Color(0xFFffffff);
  static const Color cardColor = Color(0xFFededed);
  static const Color surfaceColor = Color(0xFFf8f8f8);
  static const Color onSurfaceLightColor = Color(0xFFfbfbfc);
  static const Color onSurfaceDarkColor = Color(0xFF94959e);

  static const Color black = Color(0xFF24292e);
  static const Color gray = Color(0xFF6a737d);
  static const Color blue = Color(0xFF0366d6);
  static const Color green = Color(0xFf009688);
  static const Color purple = Color(0xFF6f42c1);
  static const Color yellow = Color(0xFFffd33d);
  static const Color orange = Color(0xFFd15704);
  static const Color red = Color(0xFFd73a49);
  static const Color pink = Color(0xFFea4aaa);
  static const Color white = Color(0xFFffffff);

  static Color randomColor(String text) {
    final colors = <Color>[
      Color(0xffFF7878),
      Color(0xffFFA959),
      Color(0xff83DA2D),
      Color(0xff1FE2D7),
      Color(0xffC13E6B),
      Color(0xffFF7878),
      Color(0xff07B7A6),
      Color(0xff1F7ACD),
      Color(0xffBB78FF),
      Color(0xffF14CD7),
      Color(0xffFF5757),
    ];
    if(text != null){
      return colors[text.length %11];
    }
    Random ran = Random.secure();
    return colors[ran.nextInt(10)];
  }
}
