class Report {
  final int temp;
  final String wax; //type of wax
  final String line;
  final String timeStamp;

  Report({
    required this.temp,
    required this.wax,
    required this.line,
    required this.timeStamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'wax': wax,
      'line': line,
      'timeStamp': timeStamp,
    };
  }

  static Report fromJson(Map<String, dynamic> json) => Report(
        temp: json['temp'] as int,
        wax: json['wax'] as String,
        line: json['line'] as String,
        timeStamp: json['timeStamp'] as String,
      );
}
