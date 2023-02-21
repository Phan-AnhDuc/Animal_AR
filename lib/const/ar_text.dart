// ignore_for_file: constant_identifier_names

class OneText {
  OneText._();
  static const String ar_text_1 =
      'Dòng thời gian lịch sử tiến hóa của sự sống liệt kê những sự kiện lớn trong dòng thời gian phát triển của sự sống trên Trái Đất. Để biết thêm chi tiết về các sự kiện này, xem Lịch sử Trái Đất, và niên đại địa chất. Thời gian liệt kê ở đây được ước tính dựa trên các chứng cứ khoa học.';
  static const String ar_text_2 =
      'Trong sinh học, tiến hóa là quá trình mà qua đó các sinh vật nhận được và truyền lại các đặc tính từ thế hệ này sang thế hệ khác. Việc diễn ra trong một thời gian rất dài của nó giải thích nguồn gốc của các loài mới và sự đa dạng của sinh giới. Các loài cùng thời nhau liên quan đến nhau bởi cùng gốc, sản phẩm của sự tiến hóa và sự hình thành loài qua hàng tỉ năm.';
}

class HistoryText {
  final String year;
  final String event;

  HistoryText({required this.year, required this.event});
}

List<HistoryText> history = [
  // HistoryText(year: 'Sự Kiện', event: 'Thời điểm'),
  HistoryText(year: '3500 triệu năm trước', event: 'Sinh vật nhân sơ'),
  HistoryText(year: '3000 triệu năm trước', event: 'Sinh vật quang hợp'),
  HistoryText(year: '2000 triệu năm trước', event: '	Sinh vật nhân chuẩn'),
  HistoryText(year: '1000 triệu năm trước', event: 'Sinh vật đa bào'),
  HistoryText(year: '650 triệu năm trước', event: '	Động vật đơn giản'),
  HistoryText(year: '570 triệu năm trước', event: '	Động vật chân đốt'),
  HistoryText(year: '540 triệu năm trước', event: 'Động vật có dây sống'),
  HistoryText(year: '500 triệu năm trước', event: 'Cá'),
  HistoryText(year: '500 triệu năm trước', event: 'Tổ tiên loài lưỡng cư'),
  HistoryText(year: '400 triệu năm trước', event: 'Côn trùng'),
  HistoryText(year: '370 triệu năm trước', event: 'Động vật lưỡng cư'),
  HistoryText(year: '320 triệu năm trước', event: 'Bò sát'),
  HistoryText(year: '220 triệu năm trước', event: 'Động vật có vú'),
  HistoryText(year: '150 triệu năm trước', event: 'Chim'),
  HistoryText(year: '65 triệu năm trước', event: 'Khủng long'),
  HistoryText(year: '2.5 triệu năm trước', event: 'Xuất hiện chi Người'),
];
