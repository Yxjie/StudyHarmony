import { ButtonTest } from '../view/ButtonDemo'
@Entry
@Component
struct ThirdPage {
  @State message: string = '基础组建使用'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text('Blank 使用')
          Blank().color(Color.Yellow)
          Text('Blank end')
        }.width('100%')

        ButtonTest()
      }
      .width('100%')
    }
  }
}