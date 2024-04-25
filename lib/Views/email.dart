import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class EmailSenderScreen extends StatelessWidget {
  final TextEditingController _recipientController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Email Sender'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _recipientController,
              decoration: InputDecoration(labelText: 'Recipient'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _bodyController,
              maxLines: 8,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                final Email email = Email(
                  body: 'Email body',
                  subject: 'Email subject',
                  recipients: ["bilalkarim20@live.com"],
                  cc: ['cc@example.com'],
                  bcc: ['bcc@example.com'],
                  isHTML: false,
                );

                await FlutterEmailSender.send(email);
              },
              child: Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
