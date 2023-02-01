//IT IS A MODEL FOR STORE VALUE USER GIVES
class ratingFeedback {
  String? rating;
  String? feedbacks;
  ratingFeedback({this.rating, this.feedbacks});
  factory ratingFeedback.fromJson(Map<String, dynamic> data) {
    return ratingFeedback(
      rating: data['Rating'],
      feedbacks: data['Feedbacks'],
    );
  }
  // MAPPING IN JSON FORMAT
  Map<String, dynamic> tojson() {
    return {
      'Rating': rating,
      'Feedbacks': feedbacks,
    };
  }
}
