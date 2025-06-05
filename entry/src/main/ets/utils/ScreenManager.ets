import { media } from "@kit.MediaKit";
import { mediaquery } from "@kit.ArkUI";
import { BreakPointConstants } from "../constants";
import { BreakPointEnum } from "./BreakPointType";

export class ScreenManager {
  xsListener: mediaquery.MediaQueryListener | null = null
  smListener: mediaquery.MediaQueryListener | null = null
  mdListener: mediaquery.MediaQueryListener | null = null
  lgListener: mediaquery.MediaQueryListener | null = null

  init() {
    this.xsListener = mediaquery.matchMediaSync("(0vp<width<320vp)")
    this.smListener = mediaquery.matchMediaSync("(320vp<=width<520vp)")
    this.mdListener = mediaquery.matchMediaSync("(520vp<=width<840vp)")
    this.lgListener = mediaquery.matchMediaSync("(840vp<=width)")

    this.xsListener.on("change", (res) => {
      if (res) {
        this.setBreakPoint(BreakPointEnum.XS)
      }
    })

    this.smListener.on("change", (res) => {
      if (res) {
        this.setBreakPoint(BreakPointEnum.SM)
      }
    })

    this.mdListener.on("change", (res) => {
      if (res) {
        this.setBreakPoint(BreakPointEnum.MD)
      }
    })

    this.lgListener.on("change", (res) => {
      if (res) {
        this.setBreakPoint(BreakPointEnum.LG)
      }
    })
  }

  setBreakPoint(breakPoint: BreakPointEnum) {
    AppStorage.setOrCreate(BreakPointConstants.BREAK_POINT_KEY, breakPoint)
  }

  off() {
    this.xsListener?.off("change")
    this.smListener?.off("change")
    this.mdListener?.off("change")
    this.lgListener?.off("change")
    // 内存释放
    this.xsListener = null
    this.smListener = null
    this.mdListener = null
    this.lgListener = null
  }
}

export const screenManager = new ScreenManager()