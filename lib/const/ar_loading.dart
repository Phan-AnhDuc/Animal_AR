// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class OneLoading {
  OneLoading._();
  static Widget ar_loading = Lottie.asset(
    "assets/images/loadingAnimal.json",
    width: 120,
    height: 120,
    repeat: true,
    fit: BoxFit.contain,
  );
}

class OneLoadingAR {
  OneLoadingAR._();
  static Widget ar_loading = Lottie.asset(
    "assets/images/loadingAR.json",
    width: 120,
    height: 120,
    repeat: true,
    fit: BoxFit.contain,
  );
}
