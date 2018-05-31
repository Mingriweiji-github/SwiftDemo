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

func mutiply(_ op1:Double,_ op2:Double) -> Double {
    return op1 * op2
}
struct CalcluatorBrain {
    //定义私有变量
    private var accumulator: Double?
    //定义Enum枚举类型
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    //定义字典
    private var operations : Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "-" : Operation.unaryOperation(changeSign),
        "×" : Operation.binaryOperation(mutiply),
        "=" : Operation.equals
    ]
    //定义结构体
    private var apo : AppendingBianayOperation?
    struct AppendingBianayOperation {
        let function : (Double,Double) -> Double
        let firstOp : Double
        ///?????
        //定义函数
        func perform(with SecondOp:Double) -> Double {
            return function(firstOp , SecondOp)
        }
    }

    
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation{
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil{
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil{
                    apo = AppendingBianayOperation(function: function, firstOp: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performAppendingBinary()
            break
            }
        }
    }
    
    private mutating func performAppendingBinary(){
        if apo != nil && accumulator != nil{
            accumulator = apo?.perform(with: accumulator!)
            apo = nil
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
