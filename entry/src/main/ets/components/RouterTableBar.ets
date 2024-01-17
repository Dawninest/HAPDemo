/*
 * 路由使用的底部tabBar
 * */
@Component
export default struct RouterTableBar {
  @LocalStorageLink('tabBarIndex') currentIndex: number = 0;
  // @State currentIndex: number = 0
  private tabsController : TabsController = new TabsController()
  private tabOptions = [];
  @BuilderParam contextBuilder: (index: number) => void;

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController, index: this.currentIndex }) {
      ForEach(this.tabOptions, (option) => {
        TabContent() {
          this.contextBuilder(option.index);
        }
        .tabBar(this.TabBuilder(option.title, option.index, option.icon))
      })
    }.onChange((index) => {
      // 滑动tab的滚动触发
      // this.currentIndex = index;
    })
  }

  @Builder TabBuilder(title: string, targetIndex: number, icon: Resource) {
    Column() {
      Image(icon)
        .size({ width: 20, height: 20 })
        .fillColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
        .margin({bottom: 5})
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
        .fontSize(12)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
    })
  }
}