import 'package:flutter/material.dart';

import '../../../../architecture/presentation/navigation/route_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/scope/scope_bundle.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_state.dart';
import '../../../../flutter_utils/architecture/presentation/view/widget_model_bundle.dart';
import '../../../models/contact.dart';
import '../../resources/app_images.dart';
import '../../widgets/initials_circle_avatar.dart';
import '../../widgets/input_status_button.dart';
import '../../resources/app_colors.dart';
import '../../app/yo_app_scope.dart';
import 'contact_list_model.dart';
import 'contact_list_scope.dart';

class ContactListState extends WidgetState<YoAppScope, ContactListScope, ContactListModel, void, void> {

  ContactListState(RouteBundle<YoAppScope, void, void> bundle) : super(bundle);

  @override
  ContactListScope createScope(ScopeBundle<YoAppScope, ContactListModel, void, void> bundle) =>
      ContactListScope(bundle);

  @override
  ContactListModel createViewModel(WidgetModelBundle<void> bundle) => ContactListModel(bundle);

  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody()
      );

  Widget _buildAppBar() =>
      AppBar(
          backgroundColor: Colors.white,
          title: Text("Contacts", style: TextStyle(color: AppColors.darkGray)),
          actions: _buildActions()
      );

  List<Widget> _buildActions() => [
      IconButton(
          icon: Icon(Icons.add, color: AppColors.darkGray),
          onPressed: () => scope.onOpenAddContactReaction.excite(null)
      )
  ];

  Widget _buildBody() => model.contacts.isNotEmpty ? buildContacts() : buildEmpty();

  Widget buildContacts() =>
      ListView.builder(
          itemCount: model.contacts.length,
          itemBuilder: (context, index) => _buildContact(model.contacts[index])
      );

  Widget _buildContact(Contact contact) =>
      ListTile(
          leading: _buildAvatar(contact),
          title: _buildName(contact.name),
          subtitle: _buildLabel(contact.isInApp),
          trailing: _buildButton(contact),
          contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 25)
      );

  Widget _buildAvatar(Contact contact) =>
      SizedBox(
          width: 60,
          height: 60,
          child: contact.avatarFile != null
              ? CircleAvatar(backgroundImage: FileImage(contact.avatarFile), radius: 30)
              : InitialsCircleAvatar(contact.name)
      );

  Widget _buildName(String name) =>
      Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.22, color: AppColors.darkGray)
          )
      );

  Widget _buildLabel(bool isInApp) =>
      Text(
          isInApp ? "In GetLike!" : "Not in the app",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, height: 1.47, color: AppColors.gray)
      );

  Widget _buildButton(Contact contact) =>
      SizedBox(
          width: 85,
          height: 36,
          child: _buildUnsizedButton(contact)
      );

  Widget _buildUnsizedButton(Contact contact) =>
      FlatButton(
          child: _buildButtonText(contact.isInApp),
          color: contact.isInApp ? theme.primaryColor : AppColors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () => _createButtonCallback(contact)
      );

  Widget _buildButtonText(bool isInApp) =>
      Text(
          isInApp ? "Like" : "Invite",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.47,
            color: Colors.white,
          )
      );

  VoidCallback _createButtonCallback(Contact contact) =>
      contact.isInApp
          ? () => scope.onOpenContactReaction.excite(contact)
          : () => scope.onInviteContactReaction.excite(null);

  Widget buildEmpty() =>
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 32, right: 32),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  _buildLogo(),
                  SizedBox(height: 42),
                  _buildEmptyTitle(),
                  SizedBox(height: 6),
                  _buildEmptySubtitle(),
                  SizedBox(height: 45),
                  _buildAddContactsButton()
              ]
          )
      );

  Widget _buildLogo() =>
      Container(
           width: 140,
           height: 140,
           decoration: BoxDecoration(color: AppColors.yellow, borderRadius: BorderRadius.circular(52)),
           child: Image.asset(AppImages.imgEmojiSunglassesBig)
      );

  Widget _buildEmptyTitle() =>
      Text(
          'Become popular!',
          style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              height: 1.5534,
              color: AppColors.darkGray
          )
      );

  Widget _buildEmptySubtitle() =>
      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                TextSpan(text: 'Friends help you collect'),
                TextSpan(text: ' 1 000 000 ', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: 'likes')
              ],
              style: TextStyle(
                fontSize: 18,
                height: 1.5534,
                color: AppColors.darkGray70,
              )
          )
      );

  Widget _buildAddContactsButton() =>
      Container(
          width: 212,
          height: 60,
          margin: EdgeInsets.only(bottom: 20),
          child: InputStatusButton(
              text: "Add friends",
              status: model.status,
              onPressed: () => scope.onAddContactsReaction.excite(null)
          )
      );
}
