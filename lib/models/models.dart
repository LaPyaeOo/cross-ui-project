class Attachment {
  const Attachment({required this.url});

  final String url;
}

class Email {
  const Email({
    required this.sender,
    required this.recipients,
    required this.subject,
    required this.content,
    this.attachments = const [],
    this.replies = 0,
  });

  final User sender;
  final List<User> recipients;
  final String subject;
  final String content;
  final List<Attachment> attachments;
  final int replies;
}

class Name {
  const Name({required this.firstName, required this.lastName});

  final String firstName;
  final String lastName;

  String get fullName => "$firstName $lastName";
}

class User {
  const User({
    required this.name,
    required this.avatarUrl,
    required this.lastActive,
  });

  final Name name;
  final String avatarUrl;
  final DateTime lastActive;
}
