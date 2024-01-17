/*
 * 组件列表页
 * */

import router from '@ohos.router';
@Component
export default struct ComponentList {
  listData = [
    { title: '基础组件', path: 'pages/component/BaseDemo'},
    { title: '文本组件', path: 'pages/component/TextDemo'}
  ];

  build() {
    Column(){
      Navigation() {
        List() {
          ForEach(this.listData, (data) => {
            ListItem() {
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center}) {
                  Text(data.title)
                  Image($r('app.media.arrow')).size({width:10,height:10})
                }
              }
              .padding(10)
              .border({width: {top: 1}})
              .backgroundColor('#F1F3F5')
              .onClick(() => {
                router.pushUrl({
                  url: data.path
                }, router.RouterMode.Standard, (err) => {
                  if (err) {
                    console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
                    return;
                  }
                  console.info('Invoke pushUrl succeeded.');
                })
              })
            }
          })
        }
        .height('100%')
      }
      .title('组件')
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(true)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}