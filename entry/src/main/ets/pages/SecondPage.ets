import router from '@ohos.router'
@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page'
  @State paramA1: string = router.getParams()?.['message']

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Text(this.paramA1)
          .fontSize(30)

        Button('返回').fontSize(40).onClick(()=>{
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}