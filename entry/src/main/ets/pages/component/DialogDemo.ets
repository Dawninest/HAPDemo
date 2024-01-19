@Entry
@Component
struct DialogDemo {

  selectedDate: Date = new Date("2010-1-1")
  private selectTime: Date = new Date('2020-12-25T08:30:00')

  @State select: number = 2
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5']

  alert: CustomDialogController = new CustomDialogController({
    builder: CustomDialogAlert({
      title: '对话框标题',
      detail: '对话框提示文本信息长短皆可的那种11231231231231',
      cancel: () => {
        console.log('cancel')
      },
      confirm: () => {
        console.log('confirm')
        this.alert.close();
      },
    }),
  })
  action: CustomDialogController = new CustomDialogController({
    builder: CustomDialogAction({
      title: '选择栏',
      buttonOptions: [
        { label: "选项1", onPress: () => console.log('tap 选项1') },
        { label: "选项2", onPress: () => console.log('tap 选项2') },
        { label: "选项3", onPress: () => console.log('tap 选项3') },
      ]
    }),
    offset:{dx: 0, dy: -20},
    alignment: DialogAlignment.Bottom,
    autoCancel: false, //是否允许点击遮障层退出。

  })

  build() {
    Column() {
      Navigation() {
        List() {
          ListItem() {
            Column({ space: 10 }) {
              Text('自定义弹窗').fontSize(30)
              Row({ space: 10 }) {
                Button('对话框Modal')
                  .onClick(() => {
                    this.alert.open()
                  })
                Button('选择栏Action')
                  .onClick(() => {
                    this.action.open()
                  })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }

          ListItem() {
            Column({ space: 10 }) {
              Text('AlertDialog').fontSize(30)
              Row({ space: 10 }) {
                Button('提示框')
                  .onClick(() => {
                    AlertDialog.show(
                      {
                        title: '标题',
                        message: '弹窗内容',
                        autoCancel: false,
                        alignment: DialogAlignment.Center,
                        offset: { dx: 0, dy: 0 },
                        confirm: {
                          value: '确定',
                          action: () => {
                            console.info('Button-clicking callback')
                          }
                        },
                        cancel: () => {
                          console.info('Closed callbacks')
                        }
                      }
                    )
                  })
                Button('对话框')
                  .onClick(() => {
                    AlertDialog.show(
                      {
                        title: '标题',
                        message: '弹窗内容',
                        autoCancel: false,
                        alignment: DialogAlignment.Center,
                        offset: { dx: 0, dy: 0 },
                        primaryButton: {
                          value: '取消',
                          fontColor: Color.Red,
                          action: () => {
                            console.info('Callback when the first button is clicked')
                          },
                        },
                        secondaryButton: {
                          value: '确认',
                          backgroundColor: Color.Blue,
                          fontColor: Color.White,
                          action: () => {
                            console.info('Callback when the second button is clicked')
                          }
                        },
                        cancel: () => {
                          console.info('Closed callbacks')
                        }
                      }
                    )
                  })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }

          ListItem() {
            Column({ space: 10 }) {
              Text('ActionSheet').fontSize(30)
              Button('列表选择')
                .onClick(() => {
                  ActionSheet.show({
                    title: '列表选择',
                    message: '选择一个列表内容',
                    autoCancel: true,
                    confirm: {
                      value: '选择完成',
                      action: () => {
                        console.log('Get Alert Dialog handled')
                      }
                    },
                    cancel: () => {
                      console.log('actionSheet canceled')
                    },
                    alignment: DialogAlignment.Bottom,
                    offset: { dx: 0, dy: -10 },
                    sheets: [
                      { title: '选项1', action: () => console.log('choose1')},
                      { title: '选项2', action: () => console.log('choose2')},
                      { title: '选项3', action: () => console.log('choose3')},
                      { title: '选项4', action: () => console.log('choose3')},
                      { title: '选项5', action: () => console.log('choose5')},
                      { title: '选项6', action: () => console.log('choose6')}
                    ]
                  })
                })
            }
            .alignItems(HorizontalAlign.Start)
          }

          ListItem() {
            Column({ space: 10 }) {
              Text('DatePickerDialog').fontSize(30)
              Row({ space: 10 }) {
                Button('日期选择')
                  .onClick(() => {
                    DatePickerDialog.show({
                      start: new Date("2000-1-1"),
                      end: new Date("2100-12-31"),
                      selected: this.selectedDate,
                      onAccept: (value: DatePickerResult) => {
                        // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                        this.selectedDate.setFullYear(value.year, value.month, value.day)
                        console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
                      },
                      onCancel: () => {
                        console.info("DatePickerDialog:onCancel()")
                      },
                      onChange: (value: DatePickerResult) => {
                        console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
                      }
                    })
                  })
                Button('农历日期选择')
                  .onClick(() => {
                    DatePickerDialog.show({
                      start: new Date("2000-1-1"),
                      end: new Date("2100-12-31"),
                      selected: this.selectedDate,
                      lunar: true,
                      onAccept: (value: DatePickerResult) => {
                        // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                        this.selectedDate.setFullYear(value.year, value.month, value.day)
                        console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
                      },
                      onCancel: () => {
                        console.info("DatePickerDialog:onCancel()")
                      },
                      onChange: (value: DatePickerResult) => {
                        console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
                      }
                    })
                  })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
          ListItem() {
            Column({ space: 10 }) {
              Text('TimePickerDialog').fontSize(30)
              Row({ space: 10 }) {
                Button('时间选择(12)')
                  .onClick(() => {
                    TimePickerDialog.show({
                      selected: this.selectTime,
                      onAccept: (value: TimePickerResult) => {
                        // 设置selectTime为按下确定按钮时的时间，这样当弹窗再次弹出时显示选中的为上一次确定的时间
                        this.selectTime.setHours(value.hour, value.minute)
                        console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                      },
                      onCancel: () => {
                        console.info("TimePickerDialog:onCancel()")
                      },
                      onChange: (value: TimePickerResult) => {
                        console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                      }
                    })
                  })
                Button('时间选择(24)')
                  .onClick(() => {
                    TimePickerDialog.show({
                      selected: this.selectTime,
                      useMilitaryTime: true,
                      onAccept: (value: TimePickerResult) => {
                        this.selectTime.setHours(value.hour, value.minute)
                        console.info("TimePickerDialog:onAccept()" + JSON.stringify(value))
                      },
                      onCancel: () => {
                        console.info("TimePickerDialog:onCancel()")
                      },
                      onChange: (value: TimePickerResult) => {
                        console.info("TimePickerDialog:onChange()" + JSON.stringify(value))
                      }
                    })
                  })
              }
            }
            .alignItems(HorizontalAlign.Start)
          }
          ListItem() {
            Column({ space: 10 }) {
              Text('TextPickerDialog').fontSize(30)
              Button('picker选择')
                .onClick(() => {
                  TextPickerDialog.show({
                    range: this.fruits,
                    selected: this.select,
                    onAccept: (value: TextPickerResult) => {
                      // 设置select为按下确定按钮时候的选中项index，这样当弹窗再次弹出时显示选中的是上一次确定的选项
                      this.select = value.index
                      console.info("TextPickerDialog:onAccept()" + JSON.stringify(value))
                    },
                    onCancel: () => {
                      console.info("TextPickerDialog:onCancel()")
                    },
                    onChange: (value: TextPickerResult) => {
                      console.info("TextPickerDialog:onChange()" + JSON.stringify(value))
                    }
                  })
                })
            }
            .alignItems(HorizontalAlign.Start)
          }
        }
        .width('100%')
        .padding(10)

      }
      .title('弹窗组件')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}

@CustomDialog
struct CustomDialogAction {
  controller: CustomDialogController
  title: string
  buttonOptions: any[]

  build() {
    Column() {
      Text(this.title)
        .fontSize(12)
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({ top: 10, bottom: 10 })
        .fontColor('#323232')
        .backgroundColor(Color.White)
      ForEach(this.buttonOptions, (button, idx) => {
        Button(button.label, { type: ButtonType.Capsule, stateEffect: true })
          .onClick(() => {
            this.controller.close();
            button.onPress();
          })
          .backgroundColor(Color.White)
          .width('100%')
          .fontColor('#323232')
      })
      Blank()
        .width('100%')
        .height(10)
        .borderRadius({ bottomLeft: 10, bottomRight: 10 })
        .backgroundColor(Color.White)

      Button('取消', { type: ButtonType.Capsule, stateEffect: true })
        .onClick(() => {
          this.controller.close();
        })
        .width('100%')
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
    }
    .width('100%')
    .padding(10)
  }
}

@CustomDialog
struct CustomDialogAlert {
  controller: CustomDialogController
  title: string
  detail: string
  cancel: () => void
  confirm: () => void

  build() {
    Column() {
      Text(this.title)
        .fontSize(15)
        .padding({ top: 10, bottom: 10 })
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontColor('#323232')
        .backgroundColor(Color.White)
        .borderRadius({ topLeft: 10, topRight: 10 })
      Text(this.detail)
        .fontSize(14)
        .padding(20)
        .width('100%')
        .textAlign(TextAlign.Center)
        .constraintSize({
          minHeight: 100
        })
        .backgroundColor(Color.White)
      Flex({justifyContent: FlexAlign.SpaceAround}) {
        Button("取消", { type: ButtonType.Capsule, stateEffect: true })
          .onClick(() => {
            this.controller.close();
            this.cancel();
          })
          .width('47%')
          .backgroundColor(Color.White)
          .fontColor(Color.Red)

        Button("确定", { type: ButtonType.Capsule, stateEffect: true })
          .onClick(this.confirm)
          .width('47%')
          .backgroundColor('#2772F0')
          .fontColor(Color.White)
      }.margin(10)
    }
    .width('100%')
  }
}
