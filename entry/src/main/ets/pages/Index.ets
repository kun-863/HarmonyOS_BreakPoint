import { BreakPointConstants } from '../constants'
import { BreakPointType } from '../utils/BreakPointType'

@Entry
@Component
struct Index {
  @StorageProp(BreakPointConstants.BREAK_POINT_KEY) currentBreakPoint: string = BreakPointConstants.MD

  build() {
    Scroll() {
      GridRow({ columns: { sm: 2, md: 3, lg: 4 }, gutter: 15 }) {
        ForEach(Array.from({ length: 24 }), (item: string, index: number) => {
          GridCol() {
            Text(`${index + 1}`)
              .fontColor(0xFFFFFF)
              .textAlign(TextAlign.Center)
              .backgroundColor(new BreakPointType({ sm: 0x00FF00, md: 0xFF00FF, lg: 0xFF0000 }).getValue(this.currentBreakPoint))
              .height(40)
              .width('100%')
          }
          .padding(15)
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}