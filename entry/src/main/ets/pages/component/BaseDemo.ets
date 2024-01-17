@Entry
@Component
struct ButtonDemo {
  options = [
    { label: "选项1", value: 1 },
    { label: "选项2", value: 2 },
    { label: "选项3", value: 3 },
    { label: "选项4", value: 4 },
    { label: "选项5", value: 5 },

  ]
  @State radioCheckVal1: string = "";
  @State radioCheckVal2: string = "";
  @State checkBoxArr: string[] = [];
  @State switchVisible: boolean = false;
  @State progressValue: number = 20;

  build() {
    Column() {
      Navigation() {
        List() {
          ListItem() {
            Column({ space: 10 }) {
              Text('Button').fontSize(30)
              Text('基础按钮 type:Normal/Capsule/Circle')
              Row({ space: 5 }) {
                Button('确认', { type: ButtonType.Normal, stateEffect: true })
                  .backgroundColor(0x317aff)
                  .width(90)
                  .height(32)
                Button('确认', { type: ButtonType.Capsule, stateEffect: true })
                  .backgroundColor(0x317aff)
                  .width(90)
                  .height(32)
                Button('确认', { type: ButtonType.Circle, stateEffect: true })
                  .backgroundColor(0x317aff)
                  .width(80)
                  .height(80)
              }.alignItems(VerticalAlign.Top)

              Text('自定义内容及样式')
              Button({ type: ButtonType.Normal, stateEffect: true }) {
                Row({ space: 5 }) {
                  Text('确认').fontColor(Color.White)
                  Image($r('app.media.arrow')).size({ width: 14, height: 14 }).fillColor(Color.White)
                }
              }
              .backgroundColor(0x317aff)
              .width(90)
              .height(32)
              .borderRadius(8)
              // border 里面的 radius 竟然没生效
              .border({ width: 1, color: Color.Red, radius: 8 })
            }
            .alignItems(HorizontalAlign.Start)
          }

          ListItem() {
            Column({ space: 10 }) {
              Text('Radio').fontSize(30)
              Flex({ wrap: FlexWrap.Wrap }) {
                ForEach(this.options, (item) => {
                  Row({ space: 5 }) {
                    Radio({ value: item.value, group: "RadioGroup2" })
                      .checked(this.radioCheckVal2 === item.value)
                      .onChange((isChecked) => {
                        this.radioCheckVal2 = item.value
                      });
                    Text(item.label)
                  }
                })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }

          ListItem() {
            Column({ space: 10 }) {
              Text('Toggle').fontSize(30)
              Text('ToggleType.Checkbox')
              Flex({ wrap: FlexWrap.Wrap }) {
                ForEach(this.options, (item) => {
                  Row({ space: 5 }) {
                    Toggle({ type: ToggleType.Checkbox, isOn: this.checkBoxArr.includes(item.value) })
                      .onChange((isOn: boolean) => {
                        if (isOn) {
                          this.checkBoxArr.push(item.value)
                        } else {
                          this.checkBoxArr = this.checkBoxArr.filter((i) => i !== item.value)
                        }
                      });
                    Text(item.label)
                  }
                })
              }

              Text('ToggleType.Switch:' + (this.switchVisible ? 'on' : 'off'))
              Toggle({ type: ToggleType.Switch, isOn: this.switchVisible })
                .onChange((isOn: boolean) => {
                  this.switchVisible = isOn;
                })
              Text('ToggleType.Button')
              Flex({ wrap: FlexWrap.Wrap }) {
                ForEach(this.options, (item) => {
                  Toggle({ type: ToggleType.Button, isOn: this.checkBoxArr.includes(item.value) }) {
                    Text(item.label)
                      .fontColor('#182431')
                      .fontSize(12)
                  }
                  .margin({right: 5})
                  .onChange((isOn: boolean) => {
                    if (isOn) {
                      this.checkBoxArr.push(item.value)
                    } else {
                      this.checkBoxArr = this.checkBoxArr.filter((i) => i !== item.value)
                    }
                  });
                })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }

          ListItem() {
            Column({ space: 10 }) {
              Row({ space: 5 }) {
                Text('Progress').fontSize(30)
                Button('增加值', { type: ButtonType.Capsule, stateEffect: true })
                  .height(26)
                  .onClick(() => {
                    if ( this.progressValue >= 100 ) {
                      this.progressValue = 0;
                    } else {
                      this.progressValue += 5;
                    }
                  })
              }
              Text('ProgressType.Linear')
              Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
                .width('80%')
                .height(12)
              Text('ProgressType.Ring')
              Row({ space: 5 }) {
                Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
                  .height(30)
                Progress({ value: this.progressValue, total: 100, type: ProgressType.Ring })
                  .height(30)
                  .color(Color.Grey)
                  .style({ strokeWidth: 5})
              }
              Text('ProgressType.Ring')
              Row({ space: 5 }) {
                Progress({ value: this.progressValue, total: 100, type: ProgressType.ScaleRing })
                  .height(50)
                  .backgroundColor(Color.Black)
                  .style({ scaleCount: 20, scaleWidth: 5 })    // 设置环形有刻度进度条总刻度数为20，刻度宽度为5vp
                Progress({ value: this.progressValue, total: 100, type: ProgressType.ScaleRing })
                  .height(50)
                  .backgroundColor(Color.Black)
                  .style({ strokeWidth: 10, scaleCount: 10, scaleWidth: 5 })    // 设置环形有刻度进度条宽度10，总刻度数为10，刻度宽度为5vp
              }
              Text('ProgressType.Eclipse')
              Progress({ value: this.progressValue, total: 100, type: ProgressType.Eclipse }).width(50).height(50)
              Text('ProgressType.Eclipse')
              Row({ space: 5 }) {
                Progress({ value: this.progressValue, total: 100, type: ProgressType.Capsule })
                  .width(60).height(30)
                Progress({ value: this.progressValue, total: 100, type: ProgressType.Capsule })
                  .width(30).height(60)
                  .color(Color.Grey)
                  .backgroundColor(Color.Green)
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
        }
        .width('100%')
        .padding(10)
      }
      .title('基础组件')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}