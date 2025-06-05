import { display, window } from '@kit.ArkUI';
import { BreakPointConstants } from '../constants';
import { BreakPointEnum } from './BreakPointType';

export class ScreenManager {
  ctx?: Context

  async init() {
    this.judgeScreen(px2vp(display.getDefaultDisplaySync().width))
    const win = await window.getLastWindow(this.ctx || getContext())
    win.on("windowSizeChange", (size) => {
      this.judgeScreen(px2vp(size.width))
    })

  }

  // 判断屏幕宽度
  judgeScreen(val: number) {
    if (val < 320) {
      this.setBreakPoint(BreakPointEnum.XS)
    }
    else if (val < 600) {
      this.setBreakPoint(BreakPointEnum.SM)
    }
    else if (val < 840) {
      this.setBreakPoint(BreakPointEnum.MD)
    }
    else {
      this.setBreakPoint(BreakPointEnum.LG)
    }
  }

  setBreakPoint(breakPoint: BreakPointEnum) {
    AppStorage.setOrCreate(BreakPointConstants.BREAK_POINT_KEY, breakPoint)
  }

  off() {

  }
}

export const screenManager = new ScreenManager()