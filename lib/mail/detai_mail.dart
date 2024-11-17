import 'package:animal_ar/const/ar_color.dart';
import 'package:animal_ar/const/model/respone_mesage.dart';
import 'package:animal_ar/const/model/response_detail_mesage.dart';
import 'package:animal_ar/mail/end_points.dart';
import 'package:animal_ar/mail/gradient_header.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailMail extends StatefulWidget {
  const DetailMail({super.key, required this.token});

  final String token;

  @override
  State<DetailMail> createState() => _DetailMailState();
}

class _DetailMailState extends State<DetailMail> {
  @override
  void initState() {
    _getApi();
    super.initState();
  }

  Dio dio = Dio();
  List<ResponseDetailMail> _listResponseDetailMail = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const GradientHeader(
          text: Text(
            'Chi tiết mail',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: OneColors.white),
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            itemCount: _listResponseDetailMail.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: OneColors.bHA,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _listResponseDetailMail[index].subject ?? '',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _listResponseDetailMail[index].intro ?? '',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ));
            },
          ),
        ),
      ],
    ));
  }

  Future<void> _getApi() async {
    try {
      final response = await Dio().get(
        '${Endpoints.baseUrl}/messages',
        options: Options(
          responseType: ResponseType.json,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${widget.token}',
          },
        ),
      );

      final responseMail = ResponseMail.fromJson(response.data);

      if (responseMail.member != null) {
        setState(() {
          _listResponseDetailMail = responseMail.member ?? [];
        });
      }
    } catch (e) {}
  }
}
