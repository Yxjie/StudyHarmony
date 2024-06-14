@Preview
@Component
export struct GaugeDemo{

  build(){
    Column(){
      Gauge({value:50}).width(200).height(200)
        .colors([[0xff0000,1],[0x00ff00,1],[0x0000ff,1]])
      Divider().height(10)
      Gauge({value:60}).width(200).height(200)
        .colors([[0xff0000,1],[0x00ff00,1],[0x0000ff,1]]).strokeWidth(20).startAngle(210).endAngle(150)
    }.width('100%')
  }

}