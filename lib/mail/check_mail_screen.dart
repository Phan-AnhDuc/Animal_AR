// ignore_for_file: use_build_context_synchronously

import 'package:animal_ar/const/app_key.dart';
import 'package:animal_ar/const/app_loading.dart';
import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/fireBase/fireBase_help.dart';
import 'package:animal_ar/mail/detai_mail.dart';
import 'package:animal_ar/mail/gradient_header.dart';
import 'package:animal_ar/service/mail_service.dart';
import 'package:animal_ar/service/share_preferent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mailtm_client/mailtm_client.dart';

class CheckMailScreen extends StatefulWidget {
  const CheckMailScreen({super.key});

  @override
  State<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends State<CheckMailScreen> {
  List<Map<String, dynamic>> _listMail = [];
  List<ValueNotifier<bool>> _isPasswordVisible = [];
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getMail();
    });
    super.initState();
  }

  void _getMail() {
    getListIdMail().then((listMail) {
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
      body: Stack(
        children: [
          Column(
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
                    return Slidable(
                      direction: Axis.horizontal,
                      endActionPane: ActionPane(motion: const BehindMotion(), extentRatio: 0.2, children: [
                        Builder(builder: (contexts) {
                          return GestureDetector(
                            onTap: () async {
                              Slidable.of(contexts)?.close();
                              AppLoading.showLoading(context);
                              await deleteMailData(_listMail[index]["id"]).then((value) {
                                _getMail();
                              });
                              AppLoading.hideLoading(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_rounded,
                                    size: 30,
                                    color: OneColors.red,
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                      ]),
                      child: Padding(
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
                              AppLoading.showLoading(context);
                              Token token = await ApiMailData.instance.restClient.getToken(_listMail[index]["address"], _listMail[index]["password"]);
                              SharedPreferencesHelper.setString(AppKeys.token, token.token);
                              AppLoading.hideLoading(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return DetailMail(
                                  token: token.token.toString(),
                                );
                              }));
                            } finally {}
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                addressController.clear();
                passwordController.clear();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Thêm mail'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: addressController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Mật khẩu',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Hủy'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final String address = addressController.text.trim();
                            final String password = passwordController.text.trim();

                            if (address.isEmpty || password.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Vui lòng nhập đầy đủ thông tin'),
                                ),
                              );
                              return;
                            }
                            AppLoading.showLoading(context);
                            await addMailData(address, password).then((value) {
                              _getMail();
                            });
                            AppLoading.hideLoading(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Thêm tài khoản thành công!'),
                              ),
                            );

                            Navigator.pop(context);
                          },
                          child: const Text('Lưu'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 23),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
