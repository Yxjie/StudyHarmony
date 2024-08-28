import router from '@ohos.router'
import { ButtonTest } from '../view/ButtonDemo'
import { DatePickerDemo } from '../view/DatePickerDemo'

@Entry
@Component
struct ThirdPage {
  @State message: string = '基础组建使用'

  build() {
    Row() {
      Column() {
        Button('返回').onClick(() => {
          router.back()
        })
        Text(this.message)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Row() {
          Text('Blank 使用')
          Blank().color(Color.Yellow)
          Text('Blank end')
        }.width('100%')

        ButtonTest()
        Divider().color(Color.Orange).strokeWidth(10).lineCap(LineCapStyle.Round).margin({ top: 5, bottom: 5 })
        DatePickerDemo()
        Divider().color(Color.Orange).strokeWidth(10).lineCap(LineCapStyle.Round).margin({ top: 5, bottom: 5 })

      }
      .width('100%')
    }
  }
}