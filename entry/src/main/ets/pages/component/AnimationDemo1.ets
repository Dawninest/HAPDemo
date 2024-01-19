@Entry
@Component
struct AnimationDemo1 {
  build() {
    Column() {
      Navigation() {
        Image($r('app.media.tt')).width('100%')
          .sharedTransition('pushShareImage', { duration: 300, curve: Curve.Linear })
      }
      .title('动画转场')
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}