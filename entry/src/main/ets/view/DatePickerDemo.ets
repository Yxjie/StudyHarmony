@Preview
@Component
export struct DatePickerDemo {
  build(){
    DatePicker({
      start : new Date('1970-1-1'),
      end:new Date('2100-12-31'),
      selected:new Date('2024-6-13')
    }).lunar(true).onChange((value: DatePickerResult) => {
      console.log("selected date is "+ JSON.stringify(value))
    })
  }
}