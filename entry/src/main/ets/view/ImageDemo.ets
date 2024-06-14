import http from '@ohos.net.http'
import image from '@ohos.multimedia.image';

@Preview
@Component
export struct ImageDemo {
  @State imagePixelMap: PixelMap = undefined

  build() {
    Column() {
      Text('Image加载图片')
      Image($r('app.media.icon')).width(180).height(180)
      Divider().height(20)
      Button('加载 Net Icon').fontSize(20).onClick(()=>{
        this.httpRequest("")
      })
      Image(this.imagePixelMap)
    }.width('100%')
  }

  private httpRequest(url: string) {
    let httpRequest = http.createHttp()
    httpRequest.request(url, (error, data) => {
      if (error) {
        console.error("error Code = " + error.code, " error Msg = " + error.message)
      } else {
        let code = data.result
        if (http.ResponseCode.OK == code) {
          // @ts-ignore
          let imageSrc = image.createImageSource(data.result)
          imageSrc.createPixelMap({ desiredSize: { width: 180, height: 180 } }).then((pixelMap) => {
            this.imagePixelMap = pixelMap
          })
        } else {
          console.log("Response Code = " + code)
        }
      }
    })
  }
}