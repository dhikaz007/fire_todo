import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_terms_viewer/flutter_terms_viewer.dart';
import 'package:gap/gap.dart';

import '../../../../constant/constant.dart';
import '../../../../shared/widgets/widgets.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final _kFireTodoPrivacyPolicy = {
    "children": [
      {
        "text":
            "Welcome to <b>Fire Todo</b>. At Fire Todo, we respect your privacy and are committed to protecting the personal data you share with us. This Privacy Policy outlines how we handle your information.",
      },
      {
        "title": "<b>Information We Collect</b>",
        "order_style": "number",
        "children": [
          {
            "title": "Account Data: ",
            "order_style": "●",
            "text": "Email address and password for Sign Up and Login.",
          },
          {
            "title": "Verification Data: ",
            "order_style": "●",
            "text": "Email address for Email Verification purposes.",
          },
          {
            "title": "User Content: ",
            "order_style": "●",
            "text":
                "Tasks (Todos) you Create, Edit, or Delete within the application.",
          },
          {
            "title": "Profile Information: ",
            "order_style": "●",
            "text": "Any additional data provided in your Profile section.",
          }
        ],
      },
      {
        "title": "<b>How We Use Your Information</b>",
        "order_style": "number",
        "children": [
          {
            "order_style": "●",
            "text": "To maintain your account security and authentication.",
          },
          {
            "order_style": "●",
            "text": "To synchronize your tasks across multiple devices.",
          },
          {
            "order_style": "●",
            "text":
                "To provide the core functionality of managing and storing your todos.",
          }
        ],
      },
      {
        "title": "<b>Data Control</b>",
        "order_style": "number",
        "children": [
          {
            "title": "Edit/Delete: ",
            "order_style": "●",
            "text":
                "You have full control to modify or remove individual tasks at any time.",
          },
          {
            "title": "Delete All: ",
            "order_style": "●",
            "text":
                "You can use this feature to permanently clear all your stored tasks from our database.",
          }
        ],
      },
      {
        "title": "<b>Security</b>",
        "order_style": "number",
        "children": [
          {
            "text":
                "We implement standard security measures to protect your data, but please ensure you use a strong and unique password for your account.",
          }
        ],
      },
      {
        "title": "<b>Contact</b>",
        "order_style": "number",
        "children": [
          {
            "text":
                "If you have questions or concerns regarding this policy, please contact the Fire Todo development team at:",
          },
          {
            "text": "<u>support@firetodo.app</u>",
          }
        ],
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primary(10),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: kToolbarHeight),
                child: NavigationToolbar(
                  leading: BackButton(
                    color: ColorApp.black,
                    onPressed: () {
                      Modular.to.maybePop();
                    },
                  ),
                  centerMiddle: true,
                  middle: const TextApp(
                    text: 'Privacy Policy',
                    size: FontAppSize.font_20,
                    weight: FontAppWeight.semiBold,
                  ),
                ),
              ),
              const Gap(20),
              Container(
                color: ColorApp.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const TextApp(
                      text: 'Last Updated: December 2025',
                      size: FontAppSize.font_16,
                      weight: FontAppWeight.semiBold,
                    ),
                    const Gap(20),
                    TermsViewer(
                      data: Terms.from(_kFireTodoPrivacyPolicy),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
