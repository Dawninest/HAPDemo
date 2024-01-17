@Entry
@Component
struct TextDemo {
  build() {
    Column() {
      Navigation() {
        List() {
          ListItem() {
            Column({ space: 10 }) {
              Text('Text/Span').fontSize(30)
              Text('Text读取资源$r("app.string.module_desc")[resource/zh_CN/string]:')
              Text($r('app.string.module_desc'));
              Text('Span组件只能在Text内使用,span的值会覆盖Text的值')
              Text('Text') {
                Span("span")
                Span("span").decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
                Span("span")
                  .fontStyle(FontStyle.Italic)
                  .decoration({ type: TextDecorationType.Underline, color: Color.Black })
                Span("span").textCase(TextCase.UpperCase)
              }.border({width: 1})
              Text('长文本，超出的部分显示省略号。111111111111111111111111111')
                .width('100%')
                .textOverflow({ overflow: TextOverflow.Ellipsis })
                .maxLines(1)
                .border({ width: 1 }).padding(10)
              Text('长文本，lineHeight30,超出的部分换行。222222222222222222222222222')
                .width('100%')
                .lineHeight(30)
                .border({ width: 1 }).padding(10)
              Text('可复制文本')
                .copyOption(CopyOptions.InApp)
                .border({ width: 1 }).padding(10)
              Text() {
                Span('*').fontColor(Color.Red).fontSize(14)
                Span('2,355').fontColor(Color.Gray)
                Span('$').fontColor(Color.Red).fontSize(16)
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
          ListItem() {
            Column({ space: 10 }) {
              Text('TextInput').fontSize(30)
              Text('TextArea').fontSize(30)
            }
          }
          ListItem() {
            Column({ space: 10 }) {

            }
          }
        }
        .height('100%')
        .width('100%')
        .padding(10)
      }
      .title('文本组件')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}