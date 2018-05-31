//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Roc.iMac01 on 2018/5/31.
//  Copyright © 2018年 Roc.iMac01. All rights reserved.
//

import Foundation

func changeSign(_ operend : Double) -> Double{
    return -operend
}
struct CalcluatorBrain {
    //定义私有变量
    private var accumulator: Double?
    //定义Enum枚举类型
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    private var operations : Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "-" : Operation.unaryOperation(changeSign)
    ]
    //定义函数
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation{
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil{
                    accumulator = function(accumulator!)
                }
            }
        }
    }
    mutating func setOperand(_ operand:Double) {
        accumulator = operand
    }
    var result: Double?{
        get{
            return accumulator
        }
    }
}
