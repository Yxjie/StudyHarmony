import commonEvent from '@ohos.commonEvent'
import commonEventManager from '@ohos.commonEventManager'
@Preview
@Component
export struct CommonEventDemo {

  @State eventData : string = ''
  @State msg : string = ''

  private subscriber = null

  build() {
    Column(){
      Text(this.eventData).fontSize(20).fontWeight(FontWeight.Bold)

      Button('创建订阅者', { type: ButtonType.Capsule }).fontSize(40)
        .fontWeight(FontWeight.Medium).margin({ top: 10, bottom: 10 })
        .onClick(() => {
          this.createSubscriber()
        })

      Button('订阅事件', { type: ButtonType.Capsule }).fontSize(40)
        .fontWeight(FontWeight.Medium).margin({ top: 10, bottom: 10 })
        .onClick(() => {
          this.subscriberCommonEvent()
        })

      Button('发送事件', { type: ButtonType.Capsule }).fontSize(40)
        .fontWeight(FontWeight.Medium).margin({ top: 10, bottom: 10 })
        .onClick(() => {
          this.publishCommonEvent()
        })

      Button('取消订阅', { type: ButtonType.Capsule }).fontSize(40)
        .fontWeight(FontWeight.Medium).margin({ top: 10, bottom: 10 })
        .onClick(() => {
          this.unSubscriberCommonEvent()
        })

      Text(this.msg).fontSize(20).fontColor(Color.Red).fontWeight(FontWeight.Bold)
    }
  }

  /**
   * 创建订阅者
   */
  private createSubscriber(){
    if (this.subscriber) {
      this.msg = 'subscriber already created'
    }else {
      commonEventManager.createSubscriber({events:['testEvent']},(error,subscriber) => {
        if (error) {
          this.msg = 'create subscriber failure'
        }else {
          this.subscriber = subscriber
          this.msg = 'create subscriber success'
        }
      })
    }
  }

 /**
  * 订阅事件
  */
  private subscriberCommonEvent(){
    if (this.subscriber) {
      //开始订阅事件
      commonEventManager.subscribe(this.subscriber,(error,data) => {
        if (error) {
          //异常
          this.eventData = 'subscriber event failure: '+error
        }else {
          //接收事件
          this.eventData = 'subscriber event success: '+ JSON.stringify(data)
        }
      })
    }else {
      this.msg = 'please create subscriber'
    }
  }

  /**
   * 发送事件
   */
  private publishCommonEvent(){
    commonEventManager.publish('testEvent',{data:'hello harmony'},(error) => {
      if (error) {
        this.msg = 'publish event failure :' + error
      }else {
        this.msg = 'publish event data success '
      }
    })
  }

  /**
   * 取消订阅
   */
  private unSubscriberCommonEvent(){
    if (this.subscriber) {
      commonEventManager.unsubscribe(this.subscriber,(error) => {
        if (error) {
          this.msg = 'unSubscriber event failure: ' + error
        }else {
          this.subscriber = null
          this.msg = 'unSubscriber success'
        }
      })
    }else {
      this.msg = 'already unSubscriber'
    }
  }
}