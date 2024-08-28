import 'package:flutter/material.dart';
import 'package:twitterx/core/constants/constant.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  bool _isSettingToogled = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 250,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    foregroundImage:
                        AssetImage('assets/images/default_avatar.png'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Amod kumar',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                  ),
                  const Text(
                    '@Amodkumar848656',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '92',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                      children: [
                        const TextSpan(
                          text: ' Following ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: '16',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                        ),
                        const TextSpan(
                          text: ' Followers',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Divider(
                    color: Color.fromARGB(57, 158, 158, 158),
                    height: 1,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.check_box_rounded),
            title: const Text('Premium'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmarks'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.mic),
            title: const Text('Spaces'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text('Monetisation'),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {},
          ),
          const SizedBox(
            height: 24,
          ),
          const Divider(
            color: Color.fromARGB(57, 158, 158, 158),
            height: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            title: const Text('Settings & support'),
            trailing: _isSettingToogled
                ? const Icon(
                    Icons.arrow_drop_up,
                    color: kPrimaryColor,
                    size: 32,
                  )
                : const Icon(Icons.arrow_drop_down, size: 32,),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
            onTap: () {
              setState(() {
                _isSettingToogled = !_isSettingToogled;
              });
            },
          ),
          if (_isSettingToogled)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: ListTile(
                    leading: const Icon(Icons.settings, size: 16,),
                    title: const Text('Settings and privacy'),
                    titleTextStyle:
                        Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                    onTap: () {},
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.question_mark_rounded, size: 16,),
                  title: const Text('Help Center'),
                  titleTextStyle:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                  onTap: () {},
                ),
              ],
            ),
            const Text('Hello')
        ],
      ),
    );
  }
}
