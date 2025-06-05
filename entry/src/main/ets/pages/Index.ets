import { BreakPointConstants } from '../constants'
import { BreakPointType } from '../utils/BreakPointType'
import { screenManager } from '../utils/ScreenManager'
import { display, window } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  @StorageProp(BreakPointConstants.BREAK_POINT_KEY) currentBreakPoint: string = BreakPointConstants.SM

  // async aboutToAppear(): Promise<void> {
  //   screenManager.init()
  //   const obj = await window.getLastWindow(getContext())
  //   obj.on("windowSizeChange", () => {
  //     const res = display.getDefaultDisplaySync()
  //     // console.info("window 方法获取屏幕宽度变化：" + px2vp(res.width))
  //   })
  // }

  build() {
    Scroll() {
      GridRow({ columns: { sm: 2, md: 3, lg: 4 }, gutter: 15 }) {
        ForEach(Array.from({ length: 24 }), (item: string, index: number) => {
          GridCol() {
            Text(`${index + 1}`)
              .fontColor(0xFFFFFF)
              .textAlign(TextAlign.Center)
              .backgroundColor(new BreakPointType({ sm: Color.Red, md: Color.Yellow, lg: Color.Pink }).getValue(this.currentBreakPoint))
              .height(40)
              .width('100%')
          }
          .padding(15)
        })
      }
    }
    .height('100%')
    .width('100%')
    .onAreaChange((oldArea, newArea) => {
      // console.info("onAreaChange 方法获取当前屏幕宽度：" + newArea.width)
    })
  }
}