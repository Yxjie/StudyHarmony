import router from '@ohos.router'
import CompA from '../view/demo'

@Entry
@Component
struct Index {
  @State message: string = 'Hello world'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold).onClick(() => {
          this.message = 'Hi Harmony'
        })
        Parent()
        Divider()
          .margin({ top: 30 })
          .vertical(true)
          .width(100)
          .height(10)
          .backgroundColor(Color.Red)
        CompA()
        Button('跳转').margin({ top: 30 }).fontSize(40).onClick(() => {
          router.pushUrl({
            url: 'pages/SecondPage',
            params: {
              message: 'Hello Harmony',
            }
          });
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

/**
 * 按值传递
 * @param paramA1
 */
@Builder function overBuilder(paramA1: string) {
  Row() {
    Text(`UseStateVarByValue: ${paramA1} `)
  }
}

/**
 * 按引用传递
 * @param $$
 */
@Builder function overBuilder2($$: { paramA1: string }) {
  Row() {
    Text(`UseStateVarByReference: ${$$.paramA1} `)
  }
}

@Component
struct Parent {
  @State label: string = 'Hello';

  build() {
    Column() {
      overBuilder(this.label)
      overBuilder2({ paramA1: this.label })
    }.onClick(() => {
      console.log("U Click")
      this.label = "ArkTS"
    })
  }
}
