@Preview
@Component
export struct DataPanelDemo {
  private dataValues: number[] = [11, 3, 10, 2, 36, 4, 7, 22, 5]

  build() {
    Column() {
      DataPanel({ values: this.dataValues, max: 100, type: DataPanelType.Circle }).width(350).height(350)
      DataPanel({ values: this.dataValues, max: 100, type: DataPanelType.Line }).width(350).height(50)
    }.width('100%')
  }
}