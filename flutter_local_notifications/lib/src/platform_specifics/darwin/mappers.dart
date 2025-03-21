import 'initialization_settings.dart';
import 'notification_action.dart';
import 'notification_attachment.dart';
import 'notification_category.dart';
import 'notification_details.dart';
import 'send_message_intent.dart';

// ignore_for_file: public_member_api_docs

extension DarwinNotificationActionMapper on DarwinNotificationAction {
  Map<String, Object> toMap() => <String, Object>{
        'identifier': identifier,
        'title': title,
        'options': options
            .map((e) => 1 << e.index) // ignore: always_specify_types
            .toList(),
        'type': type.name,
        if (buttonTitle != null) 'buttonTitle': buttonTitle!,
        if (placeholder != null) 'placeholder': placeholder!,
      };
}

extension DarwinNotificationCategoryMapper on DarwinNotificationCategory {
  Map<String, Object> toMap() => <String, Object>{
        'identifier': identifier,
        'actions': actions
            .map((e) => e.toMap()) // ignore: always_specify_types
            .toList(),
        'options': options
            .map((e) => 1 << e.index) // ignore: always_specify_types
            .toList(),
      };
}

extension DarwinInitializationSettingsMapper on DarwinInitializationSettings {
  Map<String, Object> toMap() => <String, Object>{
        'requestAlertPermission': requestAlertPermission,
        'requestSoundPermission': requestSoundPermission,
        'requestBadgePermission': requestBadgePermission,
        'requestProvisionalPermission': requestProvisionalPermission,
        'requestCriticalPermission': requestCriticalPermission,
        'defaultPresentAlert': defaultPresentAlert,
        'defaultPresentSound': defaultPresentSound,
        'defaultPresentBadge': defaultPresentBadge,
        'defaultPresentBanner': defaultPresentBanner,
        'defaultPresentList': defaultPresentList,
        'notificationCategories': notificationCategories
            .map((e) => e.toMap()) // ignore: always_specify_types
            .toList(),
      };
}

extension on DarwinNotificationAttachmentThumbnailClippingRect {
  Map<String, Object> toMap() => <String, Object>{
        'x': x,
        'y': y,
        'width': width,
        'height': height,
      };
}

extension DarwinNotificationAttachmentMapper on DarwinNotificationAttachment {
  Map<String, Object?> toMap() => <String, Object?>{
        'identifier': identifier ?? '',
        'filePath': filePath,
        'hideThumbnail': hideThumbnail,
        'thumbnailClippingRect': thumbnailClippingRect?.toMap(),
      };
}

extension DarwinPersonMapper on DarwinPerson {
  Map<String, Object?> toMap() => <String, Object?>{
        'name': name,
        'isMe': isMe,
        if (icon != null) 'icon': icon,
      };
}

extension DarwinSendMessageIntentMapper on DarwinSendMessageIntent {
  Map<String, Object?> toMap() => <String, Object?>{
        'recipients': recipients
            .map((a) => a.toMap()) // ignore: always_specify_types
            .toList(),
        'content': content,
        if (conversationTitle != null) 'conversationTitle': conversationTitle,
        if (icon != null) 'icon': icon,
        'sender': sender.toMap(),
      };
}

extension DarwinNotificationDetailsMapper on DarwinNotificationDetails {
  Map<String, Object?> toMap() => <String, Object?>{
        'presentAlert': presentAlert,
        'presentSound': presentSound,
        'presentBadge': presentBadge,
        'presentBanner': presentBanner,
        'presentList': presentList,
        'subtitle': subtitle,
        'sound': sound,
        'badgeNumber': badgeNumber,
        'threadIdentifier': threadIdentifier,
        'interruptionLevel': interruptionLevel?.index,
        'attachments': attachments
            ?.map((a) => a.toMap()) // ignore: always_specify_types
            .toList(),
        'sendMessageIntent': sendMessageIntent?.toMap(),
        'categoryIdentifier': categoryIdentifier,
      };
}
