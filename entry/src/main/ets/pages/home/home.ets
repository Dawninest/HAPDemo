/*
 * 首页
 * */
@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController()
  gridData = Array(20).fill(0).map((i, j) => {return {title: "网格", index: j}});
  @LocalStorageLink('tabBarIndex') currentIndex: number = 0;

  build() {
    Column(){
      Navigation() {
        Swiper(this.swiperController) {
          Text("轮播1")
            .width('90%')
            .height(160)
            .backgroundColor(Color.Gray)
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text("轮播2")
            .width('90%')
            .height(160)
            .backgroundColor(Color.Green)
            .textAlign(TextAlign.Center)
            .fontSize(30)
          Text("轮播3")
            .width('90%')
            .height(160)
            .backgroundColor(Color.Blue)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }
        .loop(true)
        .margin({bottom: 10})
        Column() {
          Grid() {
            ForEach(this.gridData, (data, index) => {
              GridItem(){
                Text(data.title + data.index)
                  .height(80)
                  .width(80)
                  .border({width: 1, color: Color.Gray, radius: 40})
                  .textAlign(TextAlign.Center)
              }
              .width('25%')
            })
          }
          .rowsTemplate('1fr 1fr') // 只设置rowsTemplate属性，当内容超出Grid区域时，可水平滚动。
          // .rowsGap(15) //行间距
          // .columnsGap(10) //列间距
        }
        .height(200)
        .width('100%')
        Column() {
          Button('跳转tab2', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .height(40)
            .onClick(() => {
              this.currentIndex = 1;
            })
        }
      }
      .title('Harmony')
      .menus([
        {value: "", icon: "../../../resources/base/media/menu.png", action: ()=> {}},
      ])
      .mode(NavigationMode.Auto)
      .titleMode(NavigationTitleMode.Full)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}