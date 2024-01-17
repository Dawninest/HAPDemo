import RouterTableBar from '../components/RouterTableBar'
import Home from './home/home';
let storage = new LocalStorage({ 'tabBarIndex': 0 });

@Entry(storage)
@Component
struct Index {
  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      RouterTableBar({ tabOptions: [
        {
          title: "首页",
          index: 0,
          icon: $r('app.media.home')
        },
        {
          title: "组件",
          index: 1,
          icon: $r('app.media.component')
        },
        {
          title: "关于",
          index: 2,
          icon: $r('app.media.about')
        }
      ],
        contextBuilder: this.buildTabContent
      });
    }
  }
  @Builder buildTabContent(index: number) {
    if (index === 0) {
      Home();
    }
    if (index === 1) {
      Text('推荐的组件').fontSize(30)
    }
    if (index === 2) {
      Text('关于的内容').fontSize(30)
    }
  }
}
