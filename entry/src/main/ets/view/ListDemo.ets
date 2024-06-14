@Preview
@Component
export struct ListDemo {
  private timetableListItemGroup :any = [
    {title : '电脑系统',items:['MacOS','Window','Linux','Debian']},
    {title : '手机系统',items:['iOS','Android','Harmony']}
  ]
  build(){
    List({space:2}){
      ForEach(this.timetableListItemGroup,(group) => {
        ListItemGroup(){
          ForEach(group.items,(item)=>{
            ListItem(){
              Text(item).width('100%').height(30).fontSize(20).textAlign(TextAlign.Center)
            }
          },item => item)
        }.borderRadius(20).divider({strokeWidth:2,color:0xffff00})
      })
    }
  }
  
}