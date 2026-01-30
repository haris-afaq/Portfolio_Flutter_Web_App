import 'package:flutter/material.dart';

import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/portfolio_data.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/services/external_links.dart';
import 'package:portfolio/features/contact/presentation/controllers/contact_controller.dart';
import 'package:portfolio/shared/widgets/hover_card.dart';
import 'package:portfolio/shared/widgets/primary_button.dart';
import 'package:portfolio/shared/widgets/section_shell.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key, required this.sectionKey});

  final Key sectionKey;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _controller = ContactController();

  final _name = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = PortfolioData.profile;

    return SectionShell(
      sectionKey: widget.sectionKey,
      title: 'Contact',
      subtitle: 'Want to build something polished and performant? Let’s talk.',
      background: theme.colorScheme.surfaceContainerLowest,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final size = Responsive.deviceSizeForWidth(constraints.maxWidth);
          final left = _ContactCard(profile: profile);
          final right = _ContactForm(
            nameController: _name,
            messageController: _message,
            controller: _controller,
          );

          return switch (size) {
            DeviceSize.desktop => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: left),
                  const SizedBox(width: AppSpacing.xl),
                  Expanded(child: right),
                ],
              ),
            DeviceSize.mobile || DeviceSize.tablet => Column(
                children: [
                  left,
                  const SizedBox(height: AppSpacing.xl),
                  right,
                ],
              ),
          };
        },
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.profile});

  final PortfolioProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Get in touch', style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          _RowLink(
            icon: Icons.mail_rounded,
            label: profile.email,
            onTap: () => ExternalLinks.openEmail(profile.email),
          ),
          const SizedBox(height: AppSpacing.sm),
          _RowLink(
            icon: Icons.work_rounded,
            label: 'LinkedIn',
            onTap: () => ExternalLinks.openUrl(profile.linkedin),
          ),
          const SizedBox(height: AppSpacing.sm),
          _RowLink(
            icon: Icons.code_rounded,
            label: 'GitHub',
            onTap: () => ExternalLinks.openUrl(profile.github),
          ),
          const SizedBox(height: AppSpacing.sm),
          _RowLink(
            icon: Icons.call,
            label: 'Whatsapp',
            onTap: () => ExternalLinks.openUrl(profile.whatsapp),
          ),
          const SizedBox(height: AppSpacing.lg),
          Divider(color: theme.colorScheme.outlineVariant),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'I typically respond within 24–48 hours.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _RowLink extends StatelessWidget {
  const _RowLink({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: AppRadii.button,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.primary),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
            Icon(
              Icons.arrow_outward_rounded,
              size: 18,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm({
    required this.nameController,
    required this.messageController,
    required this.controller,
  });

  final TextEditingController nameController;
  final TextEditingController messageController;
  final ContactController controller;

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();

  bool _submitted = false;

  void _submit() {
    setState(() => _submitted = true);
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final url = widget.controller.mailtoUrl(
      name: widget.nameController.text,
      message: widget.messageController.text,
    );
    ExternalLinks.openUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final canSubmit = widget.controller.canSubmit(
      name: widget.nameController.text,
      message: widget.messageController.text,
    );

    return HoverCard(
      child: Form(
        key: _formKey,
        autovalidateMode: _submitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send a message', style: theme.textTheme.titleLarge),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: widget.nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: 'Your name'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter your name'
                  : null,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: widget.messageController,
              maxLines: 6,
              decoration: const InputDecoration(labelText: 'Message'),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter a message'
                  : null,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Open email draft',
              icon: Icons.send_rounded,
              onPressed: canSubmit ? _submit : null,
            ),
          ],
        ),
      ),
    );
  }
}
