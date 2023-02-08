//IT IS A MODEL FOR STORE VALUE USER GIVES
class ratingFeedback {
  String? rating;
  String? feedbacks;
  String? name;
  String? id;
  ratingFeedback({this.rating, this.name, this.feedbacks, this.id});
  factory ratingFeedback.fromJson(Map<String, dynamic> data) {
    return ratingFeedback(
        rating: data['Rating'],
        feedbacks: data['Feedbacks'],
        name: data['name'],
        id: data['id']);
  }
  // MAPPING IN JSON FORMAT
  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'Rating': rating,
      'Feedbacks': feedbacks,
      "id": id,
    };
  }
}
