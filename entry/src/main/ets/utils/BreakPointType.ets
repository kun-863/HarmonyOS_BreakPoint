// 断点枚举
export enum BreakPointEnum {
  XS = "xs",
  SM = "sm",
  MD = "md",
  LG = "lg"
}

// 断点类型
export interface BreakPointTypeOption<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
}

// 断点工具类-用于根据断点取值
export class BreakPointType<T> {
  options: BreakPointTypeOption<T>

  constructor(option: BreakPointTypeOption<T>) {
    this.options = option
  }

  // 取值方法
  getValue(currentBreakPoint: string) {
    if (currentBreakPoint === BreakPointEnum.XS) {
      return this.options.xs
    }
    else if (currentBreakPoint === BreakPointEnum.SM) {
      return this.options.sm
    }
    else if (currentBreakPoint === BreakPointEnum.MD) {
      return this.options.md
    }
    else if (currentBreakPoint === BreakPointEnum.LG) {
      return this.options.lg
    }
    else {
      return undefined
    }
  }
}