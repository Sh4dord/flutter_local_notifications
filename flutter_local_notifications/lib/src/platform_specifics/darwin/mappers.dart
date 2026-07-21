import 'initialization_settings.dart';
import 'notification_action.dart';
import 'notification_attachment.dart';
import 'notification_category.dart';
import 'notification_details.dart';
import 'send_message_intent.dart';

extension DarwinNotificationActionMapper on DarwinNotificationAction {
  Map<String, Object> toMap() => <String, Object>{
    'identifier': identifier,
    'title': title,
    'options': options.map((e) => e.value).toList(),
    'type': type.name,
    'buttonTitle': ?buttonTitle,
    'placeholder': ?placeholder,
  };
}

extension DarwinNotificationCategoryMapper on DarwinNotificationCategory {
  Map<String, Object> toMap() => <String, Object>{
    'identifier': identifier,
    'actions': actions.map((e) => e.toMap()).toList(),
    'options': options.map((e) => e.value).toList(),
  };
}

extension DarwinInitializationSettingsMapper on DarwinInitializationSettings {
  Map<String, Object> toMap() => <String, Object>{
    'requestAlertPermission': requestAlertPermission,
    'requestSoundPermission': requestSoundPermission,
    'requestBadgePermission': requestBadgePermission,
    'requestProvisionalPermission': requestProvisionalPermission,
    'requestCriticalPermission': requestCriticalPermission,
    'requestProvidesAppNotificationSettings':
        requestProvidesAppNotificationSettings,
    'defaultPresentAlert': defaultPresentAlert,
    'defaultPresentSound': defaultPresentSound,
    'defaultPresentBadge': defaultPresentBadge,
    'defaultPresentBanner': defaultPresentBanner,
    'defaultPresentList': defaultPresentList,
    'notificationCategories': notificationCategories
        .map((e) => e.toMap())
        .toList(),
  };
}

extension IOSInitializationSettingsMapper on IOSInitializationSettings {
  Map<String, Object> toMap() {
    final DarwinInitializationSettings darwinSettings =
        this as DarwinInitializationSettings;
    final Map<String, Object> map = darwinSettings.toMap();
    map['requestCarPlayPermission'] = requestCarPlayPermission;
    return map;
  }
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
        'criticalSoundVolume': criticalSoundVolume,
      };
}
