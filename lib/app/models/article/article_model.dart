import 'package:ecosan/app/constants/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ArticleModel extends Equatable {
  final String title;
  final String desc;
  final int like;
  final int comment;
  final String image;
  final String source;

  ArticleModel(
      this.title, this.desc, this.like, this.comment, this.image, this.source);

  ArticleModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        desc = json['desc'],
        like = json['like'],
        comment = json['comment'],
        image = json['image'],
        source = json['source'];

  String getDate() {
    String input = source;
    String datePattern = r'\d{2}/\d{2}/\d{4}';
    RegExp regExp = RegExp(datePattern);
    Match? match = regExp.firstMatch(input);
    String date = match!.group(0)!;
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    DateTime dateTime = formatter.parse(date);
    return "${dateTime.day} ${Utils.getMonthFromInt(dateTime.month)} ${dateTime.year}";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [title, like, comment, image, source];
}
