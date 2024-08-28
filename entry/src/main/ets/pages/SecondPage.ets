import { MainPage } from '@module/common/src/main/ets/components/MainPage'
import router from '@ohos.router'
@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('返回').fontSize(40).onClick(()=>{
          router.back()
        })

        Button('jump ThirdPage').onClick(()=>{
          router.replaceUrl({
            url : 'pages/ThirdPage'
          })
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}