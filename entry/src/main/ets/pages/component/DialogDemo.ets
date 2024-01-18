@Entry
@Component
struct DialogDemo {
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
      }
    }),
  })

  action: CustomDialogController = new CustomDialogController({
    builder: CustomDialogAction({
      title: '选择栏',
      buttonOptions: [
        {label: "选项1", onPress: () => console.log('tap 选项1')},
        {label: "选项2", onPress: () => console.log('tap 选项2')},
        {label: "选项3", onPress: () => console.log('tap 选项3')},
      ]
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true,
  })


  build() {
    Column() {
      Navigation() {
        Column({space: 10}) {
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
        .fontSize(14)
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding({ top: 4, bottom: 4 })
        .border({width: {bottom: 1}, color: '#E5E5E5'})
        .fontColor('#323232')
        .backgroundColor(Color.White)
        .borderRadius({topLeft: 10, topRight: 10})
      ForEach(this.buttonOptions, (button, idx) => {
        Button(button.label,{ type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            this.controller.close();
            button.onPress();
          })
          .width('100%')
          .backgroundColor(Color.White)
          .fontColor('#323232')
          .border({width: 1, radius: {bottomLeft: 10}})
          .borderRadius({ bottomLeft: 10, bottomRight: 10})
      })



      // Button('取消',{ type: ButtonType.Normal, stateEffect: true })
      //   .onClick(() => {
      //     this.controller.close();
      //   })
      //   .width('100%')
      //   .backgroundColor(Color.White)
      //   .fontColor('#323232')
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
        .border({width: {bottom: 1}, color: '#E5E5E5'})
        .width('100%')
        .textAlign(TextAlign.Center)
        .fontColor('#323232')
      Text(this.detail)
        .fontSize(14)
        .padding(20)
        .width('100%')
        .textAlign(TextAlign.Center)
      Row() {
        Button("取消",{ type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            this.controller.close();
            this.cancel();
          })
          .width('50%')
          .backgroundColor(Color.White)
          .fontColor(Color.Red)
          .border({width:{right: 1}, color: '#E5E5E5'})
        Button("确定",{ type: ButtonType.Normal, stateEffect: true })
          .onClick(this.confirm)
          .width('50%')
          .backgroundColor(Color.White)
          .fontColor('#2772F0')
      }.border({width: {top: 1}, color: '#E5E5E5'})
    }
    .width('100%')
  }
}
