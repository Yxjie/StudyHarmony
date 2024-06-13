@Preview
@Component
export struct ButtonTest {
  build() {
    Column() {
      Text('Button使用')
      Row() {
        Button('01 01')
        Button('02').borderRadius(8).backgroundColor(0x317aff).width(80)
        // type :ButtonType圆形/胶囊/常规
        Button('type使用', { type: ButtonType.Capsule })
      }
      Text("Button 包含子组建")
      Button({ type: ButtonType.Normal }) {
        Row() {
          LoadingProgress().width(20).height(20).color(Color.Red)
          Text("06").fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
        }
      }.width(90).borderRadius(20).backgroundColor(Color.Green)
    }
  }
}