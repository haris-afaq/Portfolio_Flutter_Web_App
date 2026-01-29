import 'package:portfolio/core/constants/portfolio_data.dart';

class ContactController {
  ContactController({PortfolioProfile? profile})
      : _profile = profile ?? PortfolioData.profile;

  final PortfolioProfile _profile;

  bool canSubmit({required String name, required String message}) {
    return name.trim().isNotEmpty && message.trim().isNotEmpty;
  }

  String mailtoUrl({required String name, required String message}) {
    final subject = 'Portfolio inquiry';
    final body = 'Hi ${_profile.name},\n\n$message\n\n— $name';

    return Uri(
      scheme: 'mailto',
      path: _profile.email,
      query: _encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    ).toString();
  }

  String _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}
