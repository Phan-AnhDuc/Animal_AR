import 'package:flutter/material.dart';

class OneColors {
  OneColors._();

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  //Text Colors
  static const Color textGrey1 = Color(0xFF9E9E9E);
  static const Color textGrey2 = Color(0xFF6D6D6D);
  static const Color textGrey3 = Color(0xFF454545);
  static const Color textGreyDark = Color(0xFF050505);
  static const Color textGreyDark2 = Color(0xFF272727);
  static const Color textPrice = Color(0xFFBC2218);
  static const Color textPriceDown = Color(0xFFB9603B);
  static const Color textPriceUp = Color(0xFF0C957C);
  static const Color textPrice2 = Color(0xFFF2323F);
  static const Color textGray = Color(0xFF404145);
  static const Color textBlack = Color(0xFF141518);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textRed = Color(0xFFF2323F);
  static const Color textSuccess = Color(0xFF3DBA4E);
  static const Color textOrange = Color(0xFFF48331);
  static const Color textFlag1 = Color(0xFF43a047);
  static const Color textFlag2 = Color(0xFF2b58a7);
  static const Color textGuide = Color(0xFFAFBCCB);

  //Brand Colors
  static const Color brandVNP = Color(0xFF00A2E5);
  static const Color brandVNPT = Color(0xFF0066FF);
  static const LinearGradient gradient = LinearGradient(
    colors: [Color(0xFF00A3FF), Color(0xFF0066FF)],
    begin: Alignment(0, -1.4),
    end: Alignment(0.05, 1.5),
  );
  static const LinearGradient gradient2 = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
    begin: Alignment(0, -1.4),
    end: Alignment(0.05, 1.5),
  );
  static const LinearGradient gradient3 = LinearGradient(
    colors: [Color.fromARGB(128, 255, 255, 255), Color.fromARGB(128, 255, 255, 255)],
    begin: Alignment(0, -1.4),
    end: Alignment(0.05, 1.5),
  );
  static Shader gradientShader = gradient.createShader(const Rect.fromLTRB(0, 0, 24, 24));
  //Basic Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color yellow = Color(0xFFFCB017);
  static const Color red = Color(0xFFF2323F);
  //Notifications Colors
  static const Color error = Color(0xFFF2323F);
  static const Color success = Color(0xFF4CAF50);
  static const Color default_ = Color(0xFF9FA1A6);
  static const Color info = Color(0xFF37CDFA);
  static const Color warning = Color(0xFFFCB017);
  static const Color errorLight = Color(0xFFFCDCDD);
  static const Color successLight = Color(0xFFDCFAE0);
  static const Color defaultLight = Color(0xFFF8F9FA);
  static const Color infoLight = Color(0xFFDDF3FF);
  static const Color warningLight = Color(0xFFFDF1D3);
  static const Color badge = Color(0xFFF14666);
  // ignore: constant_identifier_names
  static const Color warning_internet = Color(0xFFFFAFAF);
  //Border Colors
  static const Color shadow = Color(0xFF4C4B5E);
  static const Color borderGrey = Color(0xFFD5D7DB);
  static const Color borderYellow = Color(0xFFFCB017);
  static const Color borderRed = Color(0xFFFC9C9E);
  static const Color borderGreen = Color(0xFF8AE896);
  static const Color dividerGrey = Color(0xFFE0E0E0);
  static const Color blueGrey = Color(0xFFEEF1F3);
  static const Color borderGreyWhite = Color(0xFFE4DBD6);
  static const Color borderDotted = Color(0xFFC0C7CE);

  //Other(backgroud&line)
  static const Color background = Color(0xFFFFFFFF);
  static const Color bgBangKe = Color(0xFFE6F0FB);
  static const Color greyLight = Color(0xFFF3F3F5);
  static const Color bgHeaderThiCong = Color(0xFFE5E8EF);
  static const Color bgSegmentedControl = Color(0xFFD9E0E9);
  static const Color bgPageNumber = Color(0xFFD5ECF8);
  static const Color bgTag = Color(0xFFF7F8FF);
  static const Color bgHeaderItem = Color(0xFFE3E8EF);
  static const Color bgChildItem = Color(0xFFF0F4F9);
  static const Color bgQRCode = Color(0xFF7B7B7B);
  static const Color bgAvatar = Color(0xFFC6E2FF);
  static const Color blueLight = Color(0xFF00A3FF);

  //OneSales Colors
  static const Color bHA = Color(0xFF1CC39B);
  static const Color bgHA = Color(0xFFECFFEE);
  static const Color bHB = Color(0xFF3B94E7);
  static const Color bgHB = Color(0xFFF6F8FD);
  static const Color bHC = Color(0xFFFCB242);
  static const Color bgHC = Color(0x0DFCB242);
  static const Color bHD = Color(0xFFEC3A2E);
  static const Color bgHD = Color(0xFFFDF6F6);
  static const Color bHE = Color(0xFF923CBA);
  static const Color bgHE = Color(0x0D923CBA);
  static const Color bHF = Color(0xFF9A1402);
  static const Color bgHF = Color(0x0D9A1402);
  static const Color qrLine = Color(0xFFFF6666);
  static const Color bgButtonIcon = Color(0xFFE8F0F8);
  static const Color bgHen = Color(0xFFD2F4D6);
  static const Color qrDot = Color(0xFF1265B6);

  //ThiCong Colors
  static const Color bgMenuThiCong = Color(0xFFEBF2FC);
  static const Color titleMenuThiCong = Color(0xFF1476D4);
  static const Color line = Color(0xFFE3E6ED);
  static const Color bgGianDo1 = Color(0xFFD6EAF9);
  static const Color bgLineGianDo1 = Color(0xFF24BA8D);
  static const Color bgGianDoItem1 = Color(0xFF2D6FAF);
  static const Color bgGianDoItem2 = Color(0xFF255889);

  //ChuKy Colors
  static const Color bgSignature = Color(0xFFF9FBFD);
  static const Color borderSignature = Color(0xFFC0C7CE);
  static const Color bgNote = Color(0xFFF6F6F6);

  //Khao Sat
  static const Color bgArea = Color(0xFF1CC49B);

  //Tra cuu danh ba
  static const Color bgThumbKH = Color(0xFF216DC6);
  static const Color bgThumbTT = Color(0xFF8647C6);
  static const Color bgThumbTB = Color(0xFF058365);
  static const Color bgLine = Color(0xFFE2E4EA);

  //Bao cao
  static const Color bgItemBC = Color(0xFFF7F9FC);
  static const Color backButton = Color(0xFFB7E2FB);

  //RANDOM
  static const Color bgRandom1 = Color(0xFFCCECFA);
  static const Color bgRandom2 = Color(0xFFFFE5BD);
  static const Color bgRandom3 = Color(0xFFC8F0E9);
  static const Color bgRandom4 = Color(0xFFFAD4CC);
  static const Color bgRandom5 = Color(0xFFFFD9ED);
  static const Color bgRandom6 = Color(0xFFC5D0F9);
  static const bgRandomList = [
    OneColors.bgRandom1,
    OneColors.bgRandom2,
    OneColors.bgRandom3,
    OneColors.bgRandom4,
    OneColors.bgRandom5,
    OneColors.bgRandom6,
  ];
}
