import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zhihu/component/cell/me_cell.dart';
import 'package:flutter_zhihu/me/me_header.dart';

class MePage extends StatefulWidget {

  MePage(){
  }


  @override
  State<StatefulWidget> createState() {
    return new _MePageState();
  }


}

class _MePageState extends State<MePage>{
  var titleTextString = "晶钻身体焕肤霜";
  _MePageState(){
    initData();
    initMsgChannel();
  }


  Future<String> _testLog() async{

    Map<String,String> map = {"data":"Flutter Hello !"};

    String result = await channel.invokeMethod(methodName,map);

    setState(() {
      titleTextString = result;
    });

  }

  initMsgChannel() async {
    await _testLog();
  }

  static const channelName = "com.mmd.flutterapp/plugin";

  static const methodName = "log";

  static const channel = MethodChannel(channelName);

  var urlList = List();
  var cellList = List<Cell>();
  var cellList2 = List<Cell>();
  void initData() {
    initUrl();
    initCellList1();
    initCellList2();
  }

  void initUrl() {
    urlList.add("https://pic4.zhimg.com/80/v2-8f96f7ada3e63908709b5be10e674dc0_400x224.jpg");
    urlList.add("https://pic4.zhimg.com/50/v2-5b0249fa20a164cc398accdf6d35d192_400x224.jpg");
    urlList.add("https://pic3.zhimg.com/50/v2-1a6124605fa761a6c20da9f83a10530b_400x224.jpg");
    urlList.add("https://pic4.zhimg.com/50/v2-c890cea29ebc2a0ed32e27796f1f4895_400x224.jpg");
  }


  void initCellList1() {
    cellList.add(new Cell("学习记录1", Icons.school));
    cellList.add(new Cell("已购1", Icons.shopping_basket));
    cellList.add(new Cell("余额礼券1", Icons.add_shopping_cart));
    cellList.add(new Cell("读书会1", Icons.book));
    cellList.add(new Cell("我的书架", Icons.collections_bookmark));
    cellList.add(new Cell("下载中心", Icons.file_download));
    cellList.add(new Cell("付费咨询", Icons.monetization_on));
    cellList.add(new Cell("活动广场", Icons.accessibility));

  }

  void initCellList2() {
    cellList2.add(new Cell("社区建设1", Icons.add_photo_alternate));
    cellList2.add(new Cell("反馈与帮助1", Icons.more));
    cellList2.add(new Cell("设置1",Icons.confirmation_number));
    cellList2.add(new Cell("GitHub1", Icons.person));

  }


  Container generatePicContainer(BuildContext context, var url){
    return new Container(
        width: MediaQuery.of(context).size.width / 2.5,
        margin: const EdgeInsets.only(right: 6.0),
        child: new AspectRatio(
            aspectRatio: 4.0 / 2.0,
            child: new Container(
              foregroundDecoration:new BoxDecoration(
                  image: new DecorationImage(
                    image: new NetworkImage(url),
                    centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                  borderRadius: const BorderRadius.all(const Radius.circular(16.0))
              ),
            )
        )
    );
  }


  List<Container> getPicContainerList(BuildContext context){
    var containerList = List<Container>();
    urlList.forEach((url)=>containerList.add(generatePicContainer(context, url)));
    return containerList;
  }

  Widget getPicContainerWrapper(BuildContext context) {
    return new Container(
      height: 100,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: new SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new Row(
          children: getPicContainerList(context),
        ),
      ),
    );
  }


  Widget barSearch() {
    return new Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new FlatButton.icon(
              color: Colors.black12,
              onPressed: () {},
              icon: new Icon(
                Icons.search,
                size: 18.0,
                color: Colors.grey,
              ),
              label: new Text(
                "搜索知乎内容",
                style: new TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.crop_free,
            color: Colors.grey,
            size: 32.0,
          ),
        )
      ],
    );
  }

  List<Widget> generateItemLIst(List cellList) {
    var list = List<Widget>();
    cellList.forEach((cell)=>list.add(MeCell(
        title: cell.title,
        icon: cell.icon,
        onPressed: () {
          _testLog();
        })));
    return list;
  }

  Container getVideoTitleContainer() {
    return new Container(
        margin: const EdgeInsets.only(left: 16.0, bottom: 20.0),
        child: new Row(
          children: <Widget>[
            new Container(
              child: new CircleAvatar(
                radius: 16.0,
                child: new Icon(Icons.videocam, color: Colors.white),
                backgroundColor: Colors.green,
              ),
            ),
            new Expanded(
              child: new Container(
                margin: const EdgeInsets.only(left: 8.0),
                child: new Text("视频创作", style: new TextStyle(
                    fontSize: 16.0, color: const Color(0xFFFF3030))),
              ),
            ),
            new Container(
              child: new FlatButton(
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      new Text("拍一个", style: new TextStyle(color: Colors.grey),),
                      Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 16.0,)
                    ],
                  )
              ),
            )
          ],
        )
    );
  }


  Widget videoCard(BuildContext context) {

    return new Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 6.0),
        padding: const EdgeInsets.only(top: 12.0),
        child: new Column(
          children: <Widget>[
            getVideoTitleContainer(),
            getPicContainerWrapper(context)
          ],
        )
    );
  }


  Widget buildItems(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        children: generateItemLIst(cellList),
      ),
    );
  }


  Widget buildItems2(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        children: generateItemLIst(cellList2),
      ),
    );
  }



  Widget goodsCard(BuildContext context) {

    var row = new Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:MainAxisAlignment.start,
      children: <Widget>[
        generatePicContainer2(context,
            "https://pic4.zhimg.com/50/v2-5b0249fa20a164cc398accdf6d35d192_400x224.jpg"),
        generateTwoColumn()
      ],
    );


    var sizedBox = new Container(
      margin: const EdgeInsets.all(20.0),
      width: 200,
      height: 75.0,
      decoration: new BoxDecoration(
        color: Colors.green,
        borderRadius: const BorderRadius.all(const Radius.circular(18.0)),
      ),
      child: row,
    );


    var container = new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          sizedBox
        ]
    );
    return container;
  }

  Container generatePicContainer2(BuildContext context, var url) {
    const radius = const Radius.circular(18.0);
    return new Container(
        width: 75,
        height: 75,
        margin: const EdgeInsets.only(right: 6.0),
        child: new AspectRatio(
            aspectRatio: 4.0 / 2.0,
            child: new Container(
              foregroundDecoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(url),
                  ),
                  borderRadius: const BorderRadius.only(topLeft:
                  radius,bottomLeft:radius)
              ),
            )
        )
    );
  }

  Widget generateTwoColumn() {
    var text = new Text(titleTextString,
        textAlign: TextAlign.left,
        style: new TextStyle(
            fontSize: 14.0, color: const Color(0xFF333333)));
    var text2 = new Text("¥ 1,870.00",
        textAlign: TextAlign.left,
        style: new TextStyle(
            fontSize: 14.0, color: const Color(0xFFFF3030)));
    var container1 = new Container(
      margin: const EdgeInsets.only(top: 5, bottom: 15),
      child: text2,
    );
    return new Container(
      margin: const EdgeInsets.only(top: 16.0, left: 6.0),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text,
            container1
          ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barSearch(),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            MeHeader(),
            SizedBox(height: 12),
            buildItems(context),
            SizedBox(height: 12),
            buildItems2(context),
            videoCard(context),
            SizedBox(height: 12),
            goodsCard(context)
          ],
        ),
      ),
    );
  }
}

class Cell {
  String title;
  IconData icon;
  Cell(String title, IconData icon){
    this.title = title;
    this.icon = icon;
  }
}
