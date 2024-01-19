import router from '@ohos.router';

@Entry
@Component
struct AnimationDemo {
  @State widthVal: number = 100
  @State heightVal: number = 40
  @State rotateAngle: number = 0
  @State animateFlag: boolean = false
  @State showImg: boolean = false
  build() {
    Column() {
      Navigation() {
        List() {
          ListItem() {
            Column({ space: 10 }) {
              Text('绑定值改变就会触发组件的动画')
              Button('属性动画')
                .onClick(() => {
                  if (this.animateFlag) {
                    this.widthVal = 150
                    this.heightVal = 60
                    this.rotateAngle = 180
                  } else {
                    this.widthVal = 100
                    this.heightVal = 40
                    this.rotateAngle = 0
                  }
                  this.animateFlag = !this.animateFlag
                })
                .rotate({ angle: this.rotateAngle })
                .width(this.widthVal)
                .height(this.heightVal)
                .animation({
                  duration: 300,
                  curve: Curve.EaseOut,
                  // iterations: 1,
                  playMode: PlayMode.Normal
                })
              Text('在点击事件中设置动画，更改绑定值')
              Button('显式动画')
                .onClick(() => {
                  if (this.animateFlag) {
                    animateTo({
                      duration: 300,
                      curve: Curve.EaseOut,
                      playMode: PlayMode.Normal,
                      onFinish: () => {
                        console.info('play end')
                      }
                    }, () => {
                      this.widthVal = 150
                      this.heightVal = 60
                      this.rotateAngle = 180
                    })
                  } else {
                    animateTo({
                      duration: 300,
                      curve: Curve.EaseOut,
                      playMode: PlayMode.Normal,
                      onFinish: () => {
                        console.info('play end')
                      }
                    }, () => {
                      this.widthVal = 100
                      this.heightVal = 40
                      this.rotateAngle = 0
                    })
                  }
                  this.animateFlag = !this.animateFlag
                })
                .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
                .width(this.widthVal)
                .height(this.heightVal)
              Text('出现/隐藏动画')
              Button(this.showImg ? '隐藏图片' : '显示图片').onClick(() => {
                animateTo({ duration: 300 }, () => {
                  // 动画闭包内控制Image组件的出现和消失
                  this.showImg = !this.showImg
                })
              })
              if (this.showImg) {
                Image($r('app.media.tt')).width(120).height(120)
                  .transition({ type: TransitionType.Insert, translate: { x: -120 } })
                  .transition({ type: TransitionType.Delete, opacity: 0, scale: { x: 0, y: 0 } })
              }
              Button('图片的页面转场').onClick(() => {
                router.pushUrl({ url: 'pages/component/AnimationDemo1' });
              })
              Image($r('app.media.tt')).width(120).height(120)
                .sharedTransition('pushShareImage', { duration: 300, curve: Curve.Linear })
            }.alignItems(HorizontalAlign.Start)
          }
        }
        .height('100%')
        .width('100%')
        .padding(10)
      }
      .title('动画')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}