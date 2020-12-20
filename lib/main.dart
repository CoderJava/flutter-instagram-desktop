import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

final color1 = Color(0xFF282A34);
final color2 = Color(0XFF3C3F51);
final color3 = Color(0xFFE2336B);
final color4 = Color(0xFFFCAC46);
final fontFamilyAvenir = 'Avenir';
final fontFamilyBillabong = 'Billabong';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          WidgetNavigationDrawer(),
          WidgetContent(),
        ],
      ),
    );
  }
}

class WidgetNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color1,
      width: 300,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWidgetInstagramLogo(),
          SizedBox(height: 24),
          _buildWidgetPhotoProfile(),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Hello Ditta',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                    fontFamily: fontFamilyAvenir,
                  ),
            ),
          ),
          Center(
            child: Text(
              '@helloditta',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontFamily: fontFamilyAvenir,
                    color: Colors.grey,
                  ),
            ),
          ),
          SizedBox(height: 16),
          _buildWidgetInfoPostsFollowersFollowing(context),
          SizedBox(height: 24),
          _buildWidgetItemMenu(
            context,
            'Feed',
            Icons.dashboard_outlined,
            isSelected: true,
          ),
          _buildWidgetItemMenu(
            context,
            'Explore',
            Icons.search,
          ),
          _buildWidgetItemMenu(
            context,
            'Notifications',
            Icons.notifications,
            badge: 4,
          ),
          _buildWidgetItemMenu(
            context,
            'Direct',
            Icons.near_me,
            badge: 1,
          ),
          _buildWidgetItemMenu(
            context,
            'IG TV',
            Icons.tv,
          ),
          _buildWidgetItemMenu(
            context,
            'Stats',
            Icons.bar_chart,
          ),
          _buildWidgetItemMenu(
            context,
            'Settings',
            Icons.settings,
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          _buildWidgetItemMenu(
            context,
            'Logout',
            Icons.logout,
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetItemMenu(
    BuildContext context,
    String label,
    IconData iconData, {
    bool isSelected = false,
    int badge = 0,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        top: 12.0,
        bottom: 12,
      ),
      child: Row(
        children: [
          isSelected
              ? ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      color3,
                      color4,
                    ],
                    stops: [
                      0.1,
                      0.9,
                    ],
                  ).createShader(bounds),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                )
              : Icon(
                  iconData,
                  color: Colors.white60,
                ),
          SizedBox(width: 24),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
              ),
            ),
          ),
          badge > 0
              ? Expanded(
                  child: Text(
                    '$badge',
                    style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey.withOpacity(.5)),
                    textAlign: TextAlign.start,
                  ),
                )
              : Container(),
          SizedBox(width: 16),
          isSelected
              ? Container(
                  width: 2,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: color3,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildWidgetInfoPostsFollowersFollowing(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                '702',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontFamily: fontFamilyAvenir,
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'Posts',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: 0.5,
          height: 48,
          color: Colors.grey,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '88.8k',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontFamily: fontFamilyAvenir,
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'Followers',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
        Container(
          width: 0.5,
          height: 48,
          color: Colors.grey,
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                '995',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white,
                      fontFamily: fontFamilyAvenir,
                    ),
              ),
              SizedBox(height: 8),
              Text(
                'Following',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetPhotoProfile() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              color3,
              color4,
            ],
            stops: [
              0.1,
              0.9,
            ],
          ),
        ),
        padding: EdgeInsets.all(2),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color1,
          ),
          padding: EdgeInsets.all(4),
          child: ClipOval(
            child: Image.asset(
              'assets/images/photo_profile.jpg',
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetInstagramLogo() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 24,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/instagram_logo.png',
            width: 32,
          ),
          SizedBox(width: 16),
          Text(
            'Instagram',
            style: TextStyle(
              fontFamily: fontFamilyBillabong,
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var widthScreen = mediaQueryData.size.width;
    return Expanded(
      child: Container(
        color: color2,
        height: double.infinity,
        padding: EdgeInsets.only(
          left: 24,
          top: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildWidgetTextFieldSearch(widthScreen),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildWidgetIconHeaderNotification(),
                      SizedBox(width: 32),
                      _buildWidgetIconHeaderDirect(),
                      SizedBox(width: 32),
                      _buildWidgetButtonAddPhoto(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            _buildWidgetTitleStories(context),
            SizedBox(height: 24),
            WidgetStories(),
            SizedBox(height: 32),
            _buildWidgetTitleFeedLatestPopular(context),
            SizedBox(height: 24),
            WidgetFeed(),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetTitleFeedLatestPopular(BuildContext context) {
    return Row(
      children: [
        Text(
          'Feed',
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white,
                fontFamily: fontFamilyAvenir,
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text(
                    'Latest',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 32),
              Column(
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 4,
                    height: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetTitleStories(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Stories',
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white,
                fontFamily: fontFamilyAvenir,
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white60),
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 14,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Watch all',
                style: TextStyle(
                  color: Colors.white60,
                  fontFamily: fontFamilyAvenir,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetIconHeaderNotification() {
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.white60,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: color3,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetIconHeaderDirect() {
    return SizedBox(
      width: 32,
      height: 32,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.near_me,
              color: Colors.white60,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: color3,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetButtonAddPhoto() {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              color3,
              color4,
            ],
            stops: [
              0.4,
              0.9,
            ],
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white30,
              ),
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Add photo',
              style: TextStyle(
                color: Colors.white,
                fontFamily: fontFamilyAvenir,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetTextFieldSearch(double widthScreen) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF484B5B),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              fontFamily: fontFamilyAvenir,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: Colors.white60,
            ),
          ),
          style: TextStyle(
            color: Colors.white60,
            fontFamily: fontFamilyAvenir,
          ),
        ),
      ),
    );
  }
}

class WidgetStories extends StatelessWidget {
  final listStories = <ItemStory>[
    ItemStory('Hello Ditta', 'assets/images/photo_profile.jpg'),
    ItemStory('Grissham', 'assets/images/photo_profile_user_11.jpg'),
    ItemStory('Agatha', 'assets/images/photo_profile_user_2.jpg'),
    ItemStory('Emily', 'assets/images/photo_profile_user_10.jpg'),
    ItemStory('Amanda', 'assets/images/photo_profile_user_3.jpg'),
    ItemStory('Elizabeth', 'assets/images/photo_profile_user_9.jpg'),
    ItemStory('Aland', 'assets/images/photo_profile_user_13.jpg'),
    ItemStory('Daroll', 'assets/images/photo_profile_user_16.jpg'),
    ItemStory('Amelia', 'assets/images/photo_profile_user_4.jpg'),
    ItemStory('Belinda', 'assets/images/photo_profile_user_5.jpg'),
    ItemStory('Caroline', 'assets/images/photo_profile_user_6.jpg'),
    ItemStory('Chloe', 'assets/images/photo_profile_user_7.jpg'),
    ItemStory('Hamilton', 'assets/images/photo_profile_user_19.jpg'),
    ItemStory('Davidson', 'assets/images/photo_profile_user_17.jpg'),
    ItemStory('Chayton', 'assets/images/photo_profile_user_12.jpg'),
    ItemStory('Elena', 'assets/images/photo_profile_user_8.jpg'),
    ItemStory('Alison', 'assets/images/photo_profile_user_14.jpg'),
    ItemStory('Alice', 'assets/images/photo_profile_user_1.jpg'),
    ItemStory('Ashton', 'assets/images/photo_profile_user_15.jpg'),
    ItemStory('Hugo', 'assets/images/photo_profile_user_18.jpg'),
    ItemStory('Jeremy', 'assets/images/photo_profile_user_20.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 117,
      child: ListView.builder(
        itemCount: listStories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var itemStory = listStories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 8,
              right: index == 19 ? 0 : 8,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            color3,
                            color4,
                          ],
                          stops: [
                            0.1,
                            0.9,
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color2,
                        ),
                        padding: EdgeInsets.all(4),
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                itemStory.photoProfile,
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                              ),
                            ),
                            index == 0
                                ? Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4C6AF9).withOpacity(.7),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    ),
                    index == 0
                        ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF4C6AF9),
                                width: 2,
                              ),
                            ),
                            width: 84,
                            height: 84,
                          )
                        : Container(),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 84,
                  child: Text(
                    itemStory.name,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: fontFamilyAvenir,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ItemStory {
  final String name;
  final String photoProfile;

  ItemStory(this.name, this.photoProfile);
}

class WidgetFeed extends StatelessWidget {
  final listFeeds = <ItemFeed>[
    ItemFeed('Grissham', 'assets/images/photo_profile_user_11.jpg', 'assets/images/photo_profile_user_11.jpg', 500179, 2013),
    ItemFeed('Agatha', 'assets/images/photo_profile_user_2.jpg', 'assets/images/photo_profile_user_2.jpg', 22, 17),
    ItemFeed('Emily', 'assets/images/photo_profile_user_10.jpg', 'assets/images/photo_profile_user_10.jpg', 311, 5),
    ItemFeed('Amanda', 'assets/images/photo_profile_user_3.jpg', 'assets/images/photo_profile_user_3.jpg', 17, 1),
    ItemFeed('Elizabeth', 'assets/images/photo_profile_user_9.jpg', 'assets/images/photo_profile_user_9.jpg', 41, 0),
    ItemFeed('Aland', 'assets/images/photo_profile_user_13.jpg', 'assets/images/photo_profile_user_13.jpg', 9, 122),
    ItemFeed('Daroll', 'assets/images/photo_profile_user_16.jpg', 'assets/images/photo_profile_user_16.jpg', 98, 15),
    ItemFeed('Amelia', 'assets/images/photo_profile_user_4.jpg', 'assets/images/photo_profile_user_4.jpg', 29, 0),
    ItemFeed('Belinda', 'assets/images/photo_profile_user_5.jpg', 'assets/images/photo_profile_user_5.jpg', 45, 1),
    ItemFeed('Caroline', 'assets/images/photo_profile_user_6.jpg', 'assets/images/photo_profile_user_6.jpg', 101, 1820),
    ItemFeed('Chloe', 'assets/images/photo_profile_user_7.jpg', 'assets/images/photo_profile_user_7.jpg', 4107, 121),
    ItemFeed('Hamilton', 'assets/images/photo_profile_user_19.jpg', 'assets/images/photo_profile_user_19.jpg', 129, 1),
    ItemFeed('Davidson', 'assets/images/photo_profile_user_17.jpg', 'assets/images/photo_profile_user_17.jpg', 10798, 2),
    ItemFeed('Chayton', 'assets/images/photo_profile_user_12.jpg', 'assets/images/photo_profile_user_12.jpg', 771, 9),
    ItemFeed('Elena', 'assets/images/photo_profile_user_8.jpg', 'assets/images/photo_profile_user_8.jpg', 51, 991),
    ItemFeed('Alison', 'assets/images/photo_profile_user_14.jpg', 'assets/images/photo_profile_user_14.jpg', 37, 777),
    ItemFeed('Alice', 'assets/images/photo_profile_user_1.jpg', 'assets/images/photo_profile_user_1.jpg', 1075, 1024),
    ItemFeed('Ashton', 'assets/images/photo_profile_user_15.jpg', 'assets/images/photo_profile_user_15.jpg', 87, 0),
    ItemFeed('Hugo', 'assets/images/photo_profile_user_18.jpg', 'assets/images/photo_profile_user_18.jpg', 991, 17),
    ItemFeed('Jeremy', 'assets/images/photo_profile_user_20.jpg', 'assets/images/photo_profile_user_20.jpg', 451, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          var itemFeed = listFeeds[index];
          var numberFormat = NumberFormat('#,##0');
          var strCountLike = numberFormat.format(itemFeed.countLike);
          var strCountComment = numberFormat.format(itemFeed.countComment);
          return Column(
            children: [
              _buildWidgetPhotoPost(itemFeed),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildWidgetPhotoProfileFeed(itemFeed),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      itemFeed.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: fontFamilyAvenir,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(
                    itemFeed.countLike % 3 != 0 ? CupertinoIcons.heart : CupertinoIcons.heart_fill,
                    color: Colors.white60,
                  ),
                  SizedBox(width: 4),
                  Text(
                    strCountLike,
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: fontFamilyAvenir,
                    ),
                  ),
                  SizedBox(width: 16),
                  Icon(
                    CupertinoIcons.chat_bubble,
                    color: Colors.white60,
                  ),
                  SizedBox(width: 4),
                  Text(
                    strCountComment,
                    style: TextStyle(
                      color: Colors.white60,
                      fontFamily: fontFamilyAvenir,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.count(1, 1);
        },
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
    );
  }

  Widget _buildWidgetPhotoProfileFeed(ItemFeed itemFeed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            color3,
            color4,
          ],
          stops: [
            0.1,
            0.9,
          ],
        ),
      ),
      padding: EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color2,
        ),
        padding: EdgeInsets.all(4),
        child: ClipOval(
          child: Image.asset(
            itemFeed.photoProfile,
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetPhotoPost(ItemFeed itemFeed) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(itemFeed.photoPost),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ItemFeed {
  final String name;
  final String photoProfile;
  final String photoPost;
  final int countLike;
  final int countComment;

  ItemFeed(
    this.name,
    this.photoProfile,
    this.photoPost,
    this.countLike,
    this.countComment,
  );
}
