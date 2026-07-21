class DarwinSendMessageIntent {
  const DarwinSendMessageIntent({
    required this.recipients,
    required this.content,
    required this.sender,
    this.conversationTitle,
    this.icon,
  });

  final List<DarwinPerson> recipients;

  final String content;

  final String? conversationTitle;

  final String? icon;

  final DarwinPerson sender;
}

class DarwinPerson {
  const DarwinPerson({
    required this.name,
    this.isMe = false,
    this.icon,
  });

  /// Whether or not this person represents a machine rather than a human.
  final bool isMe;

  /// Icon for this person.
  final String? icon;

  /// Name of this person.
  final String name;
}
