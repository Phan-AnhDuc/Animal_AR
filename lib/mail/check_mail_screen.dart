// ignore_for_file: use_build_context_synchronously

import 'package:animal_ar/const/app_key.dart';
import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/fireBase/fireBase_help.dart';
import 'package:animal_ar/mail/detai_mail.dart';
import 'package:animal_ar/mail/gradient_header.dart';
import 'package:animal_ar/service/mail_service.dart';
import 'package:animal_ar/service/share_preferent.dart';
import 'package:flutter/material.dart';
import 'package:mailtm_client/mailtm_client.dart';

class CheckMailScreen extends StatefulWidget {
  const CheckMailScreen({super.key});

  @override
  State<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends State<CheckMailScreen> {
  List<Map<String, dynamic>> _listMail = [];
  List<ValueNotifier<bool>> _isPasswordVisible = [];

  @override
  void initState() {
    super.initState();
    getListMail().then((listMail) {
      setState(() {
        _listMail = listMail;
      });
      _isPasswordVisible = List.generate(listMail.length, (_) => ValueNotifier<bool>(false));
    });
  }

  @override
  void dispose() {
    for (var notifier in _isPasswordVisible) {
      notifier.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const GradientHeader(
            text: Text(
              'List mail quản lý',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: OneColors.white),
            ),
            hasBackButton: false,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              itemCount: _listMail.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: MaterialButton(
                    elevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    padding: const EdgeInsets.only(top: 16, left: 20, right: 10, bottom: 10),
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () async {
                      try {
                        Token token = await ApiMailData.instance.restClient.getToken(_listMail[index]["address"], _listMail[index]["password"]);
                        SharedPreferencesHelper.setString(AppKeys.token, token.token);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailMail(
                            token: token.token.toString(),
                          );
                        }));
                      } catch (e) {}
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          _listMail[index]["address"],
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ValueListenableBuilder<bool>(
                                valueListenable: _isPasswordVisible[index],
                                builder: (context, isVisible, _) {
                                  return Text(
                                    isVisible ? _listMail[index]["password"] : "******",
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                  );
                                },
                              ),
                            ),
                            IconButton(
                              icon: ValueListenableBuilder<bool>(
                                valueListenable: _isPasswordVisible[index],
                                builder: (context, isVisible, _) {
                                  return Icon(
                                    isVisible ? Icons.visibility : Icons.visibility_off,
                                  );
                                },
                              ),
                              onPressed: () {
                                _isPasswordVisible[index].value = !_isPasswordVisible[index].value;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
