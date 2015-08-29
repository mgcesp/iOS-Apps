//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Manuel Cespedes on 4/18/15.
//  Copyright (c) 2015 mcfresh. All rights reserved.
//

import Foundation

class CalculatorBrain {
    // Printable is a protocol not inheritance
    private enum Op: Printable {
        
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOpertion(String, (Double, Double) -> Double)
        
        var description: String {
            get {
                switch self {
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOpertion(let symbol, _):
                    return symbol
                }
            }
        }
    }
    
    // better way to declare an array
    private var opStack = [Op]()
    // dictionary
    // var knownOps = Dictionary<String, Op>()
    // better dictionary declaration
    private var knownOps = [String:Op]()
    
    // initializer
    init() {
//        knownOps["×"] = Op.BinaryOpertion("×") {$0 * $1}
//        knownOps["÷"] = Op.BinaryOpertion("÷") {$1 / $0}
//        knownOps["√"] = Op.UnaryOperation("√") {sqrt($0)}

//        better way
        
        func learnOp(op: Op){
            knownOps[op.description] = op
        }
        
        learnOp(Op.BinaryOpertion("×", *))
        knownOps["÷"] = Op.BinaryOpertion("÷") {$1 / $0}
        knownOps["+"] = Op.BinaryOpertion("+", +)
        knownOps["−"] = Op.BinaryOpertion("−") {$1 - $0}
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops:[Op]) -> (result: Double?, remainingOps: [Op]) {
        
        // op is read only
        if !ops.isEmpty {
            // this copies ops; since its a var its also mutable
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op {
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                
                let operandEvaluation = evaluate(remainingOps)
                
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
                
            case .BinaryOpertion(_, let operation):
                
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result {
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
        }
        return(nil, ops)
    }
    
    // evaluate returns an optional because someone may only pass an operand which results in nil
    func evaluate() -> Double? {
        let (result, remainder) = evaluate(opStack)
        // print out 
        println("\(opStack) : \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand: Double) -> Double? {
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double? {
        //let operation = knownOps[symbol] // operation will actually be an optional Op
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
    }
    
}