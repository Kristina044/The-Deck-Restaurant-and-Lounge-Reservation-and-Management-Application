import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:the_deck/Controller/CustomerController.dart';
import 'package:the_deck/Core/Routes/routes_name.dart';
import 'package:the_deck/Core/app_colors.dart';
import 'package:the_deck/Core/assets_constantes.dart';
import 'package:the_deck/Core/font_size.dart';
import 'package:the_deck/Core/response_conf.dart';
import 'package:the_deck/Core/text_styles.dart';
import 'package:the_deck/Presentation/Base/base.dart';
import 'package:the_deck/Presentation/Profil/edit_personal_data_view.dart';
import 'package:the_deck/Presentation/Profil/screens/profile_info_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  final RegisterController _controller = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    _controller.getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final customer = _controller.userProfile.value;
      if (customer == null) {
        return Scaffold(
          appBar: buildAppBar(
              buildContext: context,
              screenTitle: "Profile Settings",
              isBackup: false),
          body: Center(child: CircularProgressIndicator()),
        );
      }
      return Scaffold(
        appBar: buildAppBar(
            buildContext: context,
            screenTitle: "Profile Settings",
            isBackup: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(24),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://172.25.40.14:8080/customer/image/${customer.image}'),
                      radius: getSize(50),
                    ),
                    Positioned(
                      left: getSize(72),
                      bottom: getSize(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.EditPersonalDataView);
                        },
                        child: Container(
                          width: getSize(32),
                          height: getSize(32),
                          padding: EdgeInsets.all(getSize(6)),
                          decoration: const BoxDecoration(
                              color: Color(0xFFF5F5FF), shape: BoxShape.circle),
                          child: Icon(
                            CupertinoIcons.pencil,
                            color: Pallete.orangePrimary,
                            size: getSize(20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(16),
                Text(
                  customer.name,
                  style: TextStyles.bodyLargeSemiBold.copyWith(
                      color: Pallete.neutral100,
                      fontSize: getFontSize(FontSizes.large)),
                ),
                const Gap(4),
                Text(
                  customer.email,
                  style: TextStyles.bodyMediumRegular.copyWith(
                      color: const Color(0xFF878787),
                      fontSize: getFontSize(FontSizes.medium)),
                ),
                const Gap(28),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(getSize(8)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(getSize(8)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Orders",
                            style: TextStyles.bodyLargeSemiBold.copyWith(
                                color: Pallete.neutral100,
                                fontSize: getFontSize(FontSizes.large)),
                          ),
                          Text(
                            "See All",
                            style: TextStyles.bodyMediumSemiBold.copyWith(
                                color: Pallete.orangePrimary,
                                fontSize: getFontSize(FontSizes.medium)),
                          ),
                        ],
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order ID",
                                style: TextStyles.bodySmallSemiBold.copyWith(
                                    color: const Color(0xFF878787),
                                    fontSize: getFontSize(FontSizes.small)),
                              ),
                              const Gap(4),
                              Text(
                                "888333777",
                                style: TextStyles.bodySmallSemiBold.copyWith(
                                    color: Pallete.neutral100,
                                    fontSize: getFontSize(FontSizes.small)),
                              ),
                            ],
                          ),
                          Container(
                            width: getWidth(67),
                            height: getHeight(24),
                            padding: EdgeInsets.symmetric(
                                horizontal: getWidth(8),
                                vertical: getHeight(4)),
                            decoration: ShapeDecoration(
                              color: Pallete.orangePrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(getSize(30)),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'In Delivery',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: getFontSize(FontSizes.superSmall),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Gap(12),
                      Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFEDEDED),
                            ),
                          ),
                        ),
                      ),
                      const Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: getHeight(54),
                                width: getWidth(52),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(getSize(8)),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            AssetsConstants.ordinaryBurger),
                                        fit: BoxFit.fill)),
                              ),
                              const Gap(14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Burger With Meat",
                                    style: TextStyles.bodyMediumSemiBold
                                        .copyWith(
                                            color: Pallete.neutral100,
                                            fontSize:
                                                getFontSize(FontSizes.medium)),
                                  ),
                                  const Gap(8),
                                  Text(
                                    "\$ 12,230",
                                    style: TextStyles.bodyMediumBold.copyWith(
                                        color: Pallete.orangePrimary,
                                        fontSize:
                                            getFontSize(FontSizes.medium)),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "14 items",
                            style: TextStyles.bodySmallMedium.copyWith(
                                color: Pallete.neutral100,
                                fontSize: getFontSize(FontSizes.small)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Gap(24),
                Container(
                  width: double.infinity,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFEDEDED),
                      ),
                    ),
                  ),
                ),
                const Gap(24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyles.bodySmallMedium.copyWith(
                          color: const Color(0xFF878787),
                          fontSize: getFontSize(FontSizes.small)),
                    ),
                    ProfileInfoTile(
                        function: () => Navigator.pushNamed(
                            context, RoutesName.personnalData),
                        prefixIcon: Icons.person,
                        title: "Personal Data"),
                    ProfileInfoTile(
                        function: () =>
                            Navigator.pushNamed(context, RoutesName.settings),
                        prefixIcon: Icons.settings,
                        title: "Settings"),
                  ],
                ),
                const Gap(16),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = _controller.logout,
                          text: 'Sign Out',
                          style: TextStyles.bodyMediumSemiBold.copyWith(
                            color: Pallete.orangePrimary,
                            fontSize: getFontSize(14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
