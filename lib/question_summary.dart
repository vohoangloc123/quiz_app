import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] as String == data['correct_answer'] as String;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Thêm khoảng cách giữa các hàng
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các widget theo đầu hàng
                children: [
                  CircleAvatar(
                    radius: 15.0, // Bán kính của hình tròn
                    backgroundColor: isCorrect ? Colors.blue : Colors.red, // Màu nền thay đổi dựa trên điều kiện
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white, // Màu chữ
                        fontSize: 14.0, // Kích thước chữ nhỏ hơn cho CircleAvatar
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Khoảng cách giữa CircleAvatar và nội dung
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các widget theo đầu hàng
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(fontSize: 15, color: Colors.white), // Có thể thêm style để nổi bật hơn
                        ),
                        const SizedBox(height: 5),
                        Text(data['correct_answer'] as String,
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(data['user_answer'] as String,
                        style: TextStyle(color: isCorrect?  Colors.blue: Colors.redAccent),),
                        ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
