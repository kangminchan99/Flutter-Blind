import 'package:core_util/util.dart';
import 'package:flutter/material.dart';
import 'package:tool_blind_components/component.dart';
import 'package:tool_blind_components/gen/assets.gen.dart';

class BlindIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const BlindIcon({super.key, required this.icon, this.color, this.size});

  factory BlindIcon.arrowBack({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icArrowBack,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.bookmark({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icBookmark,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.cancel({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icCancel,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.chatBubble({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icChatBubble,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.chevronRight({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icChevronRight,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.circleNotifications({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icCircleNotifications,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.close({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icClose,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.doNotDisturbOn({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icDoNotDisturbOn,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.edit({Color? color, double? size}) {
    return BlindIcon(icon: Assets.images.svgs.icEdit, color: color, size: size);
  }

  factory BlindIcon.expandMore({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icExpandMore,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.favorite({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icFavorite,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.featuredSeasonalAndGifts({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icFeaturedSeasonalAndGifts,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.filterNone({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icFilterNone,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.flagCircle({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icFlagCircle,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.homeOff({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icHomeOff,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.homeOn({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icHomeOn,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.imagesMode({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icImagesMode,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.logo({Color? color, double? size}) {
    return BlindIcon(icon: Assets.images.svgs.icLogo, color: color, size: size);
  }

  factory BlindIcon.logoSmall({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icLogoSmall,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.logout({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icLogout,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.mail({Color? color, double? size}) {
    return BlindIcon(icon: Assets.images.svgs.icMail, color: color, size: size);
  }

  factory BlindIcon.moreHoriz({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icMoreHoriz,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.notificationsOff({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icNotificationsOff,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.notificationsOn({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icNotificationsOn,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.payments({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icPayments,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.personOff({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icPersonOff,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.personOn({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icPersonOn,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.restartAlt({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icRestartAlt,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.search({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icSearch,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.sms({Color? color, double? size}) {
    return BlindIcon(icon: Assets.images.svgs.icSms, color: color, size: size);
  }

  factory BlindIcon.sourceEnvironment({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icSourceEnvironment,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.upload({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icUpload,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.visibility({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icVisibility,
      color: color,
      size: size,
    );
  }

  factory BlindIcon.volunteerActivism({Color? color, double? size}) {
    return BlindIcon(
      icon: Assets.images.svgs.icVolunteerActivism,
      color: color,
      size: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlindSvgPicture.asset(icon, color: color, width: size, height: size);
  }
}

class BlindSvgPicture extends CoreSvgPicture {
  BlindSvgPicture.asset(
    super.assetName, {
    super.key,
    super.matchTextDirection,
    super.bundle,
    super.package = kToolBlindComponentPackageName,
    super.width,
    super.height,
    super.fit,
    super.alignment,
    super.allowDrawingOutsideViewBox,
    super.placeholderBuilder,
    super.semanticsLabel,
    super.excludeFromSemantics,
    super.clipBehavior,
    super.theme,
    super.colorFilter,
    super.color,
    super.colorBlendMode,
    super.cacheColorFilter,
  }) : super.asset();
}
