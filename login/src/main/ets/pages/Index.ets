import { ConstantRouter } from '@module/common/src/main/ets/constant/ConstantRouter';

@Entry({routeName:ConstantRouter.LOGIN_PAGE})
@Component
export struct Index {

  @State message: string = 'login module';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}