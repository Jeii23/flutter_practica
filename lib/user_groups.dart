import 'package:exercise_flutter_acs/info_groups.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'screen_group.dart';
import 'info.dart';
class UserGroupsInfo extends StatefulWidget {
  final UserGroup userGroup;

  UserGroupsInfo({Key? key, required this.userGroup}) : super(key: key);

  @override
  _UserGroupsInfoState createState() => _UserGroupsInfoState();
}

class _UserGroupsInfoState extends State<UserGroupsInfo> {
  late UserGroup userGroup;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: assign names like New group 1, New group 2...
          User newUser = User(
              Data.defaultName,
              Data.defaultDescription,
            );
          userGroup.users.add(newUser);
          setState(() {});
        },
      ),
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        foregroundColor: Theme
            .of(context)
            .colorScheme
            .onPrimary,
        title:  Text('Users of ' + userGroup.name),
      ),
      body: ListView.separated(
        // it's like ListView.builder() but better
        // because it includes a separator between items
        padding: const EdgeInsets.all(16.0),
        itemCount: userGroup.users.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildRow(userGroup.users[index], index),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  Widget _buildRow(User user, int index) {
    return ListTile(
      title: Text(user.name),
      trailing: Text('${user.credential}'),
      onTap: () =>
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
              builder: (context) => InfoGroups(user: user)),
          )
              .then((var v) => setState(() {})),
    );
  }
}
