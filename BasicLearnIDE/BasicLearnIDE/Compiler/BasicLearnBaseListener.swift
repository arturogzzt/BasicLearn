// Generated from BasicLearn.g4 by ANTLR 4.7.1

import Antlr4

/**
 * This class provides an empty implementation of {@link BasicLearnListener},
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
open class BasicLearnBaseListener: BasicLearnListener {
    var scope = "ERROR"
    
    var semanticTypeCheck = semanticCube()
    
    var dirFunc = [Function]()
    
    var parameterVerification = [String]()
    
    //Lista para saltos pendientes en los cuadruplos
    var saltos = [String]()
    
    //Pila de operadores pendientes
    var POper = [String]()
    //Pila de operadondos
    var PilaO = [String]()
    //Pila de Tipos
    var pTypes = [Type]()
    //Fila para output de cuadruplos
    var qCuad = [Quadruple]()
    //Diccionario para guardar donde se encuentran las expresiones y sus resultados
    var dicTemp : [String:Int] = [:]
    //Contador para saber en que temporal se encuentra (por mientras)
    var contTemp = 0
    
    // Memory
    var globalMemory = Memory.init(baseAddress: 0)
    var localMemory = Memory.init(baseAddress: 6000)
    var constantMemory = Memory.init(baseAddress: 12000)
    var temporalMemory = Memory.init(baseAddress: 18000)
    
     public init() {
        
    }
    
    func getVariable(id : String) -> Variable? {
        for variable in dirFunc.last!.variables {
            if variable.name == id {
                return variable
            }
        }
        
        for variable in dirFunc.first!.variables {
            if variable.name == id {
                return variable
            }
        }
        return nil
        // RETURN ERROR
    }
    
    
	open func enterProgram(_ ctx: BasicLearnParser.ProgramContext) {
        scope = "GLOBAL"
        let programName = ctx.ID()?.getText() ?? "Error"
        let programFunction = Function.init(name: programName, type: Type.program, address: 0, quadrupleNumber: 0)
        
        dirFunc.append(programFunction)
    }

	open func exitProgram(_ ctx: BasicLearnParser.ProgramContext) {
        dirFunc.removeAll()
        
        var i = 0;
        for quad in qCuad {
            print("\(i):\t\t \(quad.operand) \t\t \(quad.leftOp) \t\t \(quad.rightOp) \t\t \(quad.result)")
            i += 1
        }

    }


	open func enterBody(_ ctx: BasicLearnParser.BodyContext) { }

	open func exitBody(_ ctx: BasicLearnParser.BodyContext) { }


	open func enterExpression(_ ctx: BasicLearnParser.ExpressionContext) {

    }

	open func exitExpression(_ ctx: BasicLearnParser.ExpressionContext) {
        if let lessThan = ctx.LESSTHAN()?.getText(){
            POper.insert(lessThan, at: 0)
        }
        if let greaterThan = ctx.MORETHAN()?.getText(){
            POper.insert(greaterThan, at: 0)
        }
        if let lessThanOrEqual = ctx.LESSOREQUAL()?.getText(){
            POper.insert(lessThanOrEqual, at: 0)
        }
        if let greaterThanOrEqual = ctx.MOREOREQUAL()?.getText(){
            POper.insert(greaterThanOrEqual, at: 0)
        }
        if let equal = ctx.EQUALS()?.getText(){
            POper.insert(equal, at: 0)
        }
        if let notEqual = ctx.NOTEQUALS()?.getText(){
            POper.insert(notEqual, at: 0)
        }

        if (POper.first == "<" || POper.first == ">" || POper.first == "<=" || POper.first == ">=" || POper.first == "equal" || POper.first == "notEqual") {
            let rightOperand = PilaO.first
            let rightOperandType = pTypes.first
            pTypes.removeFirst()
            PilaO.removeFirst()
            let leftOperand = PilaO.first
            let leftOperandType = pTypes.first
            pTypes.removeFirst()
            PilaO.removeFirst()
            let op = POper.first
            POper.removeFirst()
            
            let resultType = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType!, operand2: rightOperandType!)
            
            if resultType != Type.error {
                
                var result: Int!
                
                switch resultType {
                case Type.number:
                    result = temporalMemory.getNumberAddress(spaces: 1)
                    
                case Type.sentence:
                    result = temporalMemory.getSentenceAddress(spaces: 1)
                    
                case Type.bool:
                    result = temporalMemory.getBoolAddress(spaces: 1)
                    
                case Type.decimal:
                    result = temporalMemory.getDecimalAddress(spaces: 1)
                    
                default:
                    break
                }
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(contTemp)))
                
                PilaO.insert(String(contTemp), at: 0) //Por mientras
                pTypes.insert(resultType, at: 0)
                contTemp = contTemp + 1
                
            } else {
                print("ERROR TYPE MISMATCH")
                // HANDLE ERROR CORRECTLY
            }
        }
    }


	open func enterExp(_ ctx: BasicLearnParser.ExpContext) {

    }

	open func exitExp(_ ctx: BasicLearnParser.ExpContext) {
        
        if let add = ctx.ADD()?.getText() {
            POper.insert(add, at: 0)
        }
        
        if let sub = ctx.SUBS()?.getText() {
            POper.insert(sub, at: 0)
        }
        if POper.first == "+" || POper.first == "-" {
            let rightOperand = PilaO.first
            let rightOperandType = pTypes.first
            pTypes.removeFirst()
            PilaO.removeFirst()
            let leftOperand = PilaO.first
            let leftOperandType = pTypes.first
            pTypes.removeFirst()
            PilaO.removeFirst()
            let op = POper.first
            POper.removeFirst()
            
            let resultType = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType!, operand2: rightOperandType!)
            
            if resultType != Type.error {
                
                var result: Int!
                
                switch resultType {
                case Type.number:
                    result = temporalMemory.getNumberAddress(spaces: 1)
                    
                case Type.sentence:
                    result = temporalMemory.getSentenceAddress(spaces: 1)
                    
                case Type.bool:
                    result = temporalMemory.getBoolAddress(spaces: 1)
                    
                case Type.decimal:
                    result = temporalMemory.getDecimalAddress(spaces: 1)
                    
                default:
                    break
                }
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(contTemp)))
                
                PilaO.insert(String(contTemp), at: 0) //Por mientras
                pTypes.insert(resultType, at: 0)
                contTemp = contTemp + 1
                
                
            } else {
                print("ERROR TYPE MISMATCH")
                // HANDLE ERROR CORRECTLY
            }
        }
        
    }


	open func enterTerm(_ ctx: BasicLearnParser.TermContext) {

    }

	open func exitTerm(_ ctx: BasicLearnParser.TermContext) {
        if let mult = ctx.MULT()?.getText() {
            POper.insert(mult, at: 0)
        }
        
        if let div = ctx.DIV()?.getText() {
            POper.insert(div, at: 0)
        }

        if POper.first == "*" || POper.first == "/" {
            
            let rightOperand = PilaO.first
            let rightOperandType = pTypes.first
            pTypes.removeFirst()
            PilaO.removeFirst()
            let leftOperand = PilaO.first
            let leftOperandType = pTypes.first
            pTypes.removeFirst()
            PilaO.removeFirst()
            let op = POper.first
            POper.removeFirst()
            
            let resultType = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType!, operand2: rightOperandType!)
            
            if resultType != Type.error {
                
                var result: Int!
                
                switch resultType {
                case Type.number:
                    result = temporalMemory.getNumberAddress(spaces: 1)
                    
                case Type.sentence:
                    result = temporalMemory.getSentenceAddress(spaces: 1)
                    
                case Type.bool:
                    result = temporalMemory.getBoolAddress(spaces: 1)
                    
                case Type.decimal:
                    result = temporalMemory.getDecimalAddress(spaces: 1)
                    
                default:
                    break
                }
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(contTemp)))
                
                //Por mientras se utiliza el contTemp en vez de la address del resultado
                PilaO.insert(String(contTemp), at: 0)
                pTypes.insert(resultType, at: 0)
                contTemp = contTemp + 1
                
            } else {
                print("ERROR TYPE MISMATCH")
                // HANDLE ERROR CORRECTLY
            }
        }

    }


	open func enterFactor(_ ctx: BasicLearnParser.FactorContext) {
        if let currentId = ctx.ID()?.getText() {

            //Checa que la variable si exista
            guard let operand = getVariable(id: currentId) else {
                print("Error: Esta variable no se encontro \(currentId)")
                return }
            
            PilaO.insert((operand.name), at: 0)
            pTypes.insert(operand.type, at: 0)
            
        }
        
        //Bloque donde se guardan las constanstes en memoria
        var constantMemAddress = 0
        if let currConstant = ctx.CTE_F(){
            constantMemAddress = constantMemory.saveDecimalConstant(value: Float(currConstant.getText())!)
            
            //Se meten las constantes a la pila de operandos
            //            PilaO.insert(Int(constantMemAddress), at: 0)
            PilaO.insert(currConstant.getText(), at: 0)
            pTypes.insert(Type.decimal, at: 0)
            
            //            print("Constant: \(ctx.CTE_F()?.getText()) \(constantMemAddress)")
        }
        if let currConstant = ctx.CTE_I(){
            constantMemAddress = constantMemory.saveNumberConstant(value: Int(currConstant.getText())!)
            
            //Se meten las constantes a la pila de operandos
            //            PilaO.insert(Int(constantMemAddress), at: 0)
            PilaO.insert(currConstant.getText(), at: 0)
            pTypes.insert(Type.number, at: 0)
            
            //            print("Constant: \(ctx.CTE_I()?.getText()) \(constantMemAddress)")
        }
        if ctx.getText() == "true" || ctx.getText() == "false" {
            constantMemAddress = constantMemory.saveBoolConstant(value: Bool(ctx.getText())!)
            PilaO.insert(ctx.getText(), at: 0)
            pTypes.insert(Type.bool, at: 0)
        }
    }

	open func exitFactor(_ ctx: BasicLearnParser.FactorContext) {
        

        
    }


	open func enterAssignment(_ ctx: BasicLearnParser.AssignmentContext) {
        if let assign = ctx.ASSIGN()?.getText(){
            POper.insert(assign, at: 0)
        }
        if let currentId = ctx.ID(0)?.getText(){
            if let assignment = getVariable(id: currentId){
                PilaO.insert(assignment.name, at: 0)
                pTypes.insert(assignment.type, at: 0)
            } else {
                print("Error: Esta variable no se encontro \(currentId)")
                return }
        }
    }

	open func exitAssignment(_ ctx: BasicLearnParser.AssignmentContext) {
        
        if let result = ctx.ID(0)?.getText(){
            if POper.first == "=" {
                let leftOperand = PilaO.first
                let leftOperandType = pTypes.first
                pTypes.removeFirst()
                PilaO.removeFirst()
                let op = POper.first
                POper.removeFirst()
                
                let resultVariableType = getVariable(id: result)?.type
                
                let resultType = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType!, operand2: resultVariableType!)
                
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: "---", result: result))
//                PilaO.insert(String(contTemp), at: 0)
            }
        }


    }


	open func enterBlock(_ ctx: BasicLearnParser.BlockContext) { }

	open func exitBlock(_ ctx: BasicLearnParser.BlockContext) { }


	open func enterType(_ ctx: BasicLearnParser.TypeContext) { }

	open func exitType(_ ctx: BasicLearnParser.TypeContext) { }


	open func enterStatement(_ ctx: BasicLearnParser.StatementContext) { }

	open func exitStatement(_ ctx: BasicLearnParser.StatementContext) { }


	open func enterFunction(_ ctx: BasicLearnParser.FunctionContext) {
        scope = "LOCAL"
        
        let functionType = ctx.type()?.getText() ?? "Error"
        let functionName = ctx.ID()?.getText() ?? "Error"
        
        for function in dirFunc {
            if functionName == function.name {
                // TODO: handle error appropriately STOP COMPILATION && POP UP notif
                print("Error, multiple declaration")
                return
            }
        }

        let function = Function.init(name: functionName, type: Type(type: functionType), address: 0, quadrupleNumber: 0)
        dirFunc.append(function)

	}

	open func exitFunction(_ ctx: BasicLearnParser.FunctionContext) {
//        for function in dirFunc {
//            print("FUNCTION \(function.name)")
//            for variables in function.variables {
//                print("TYPE: \(variables.type) NAME: \(variables.name) ADDRESS: \(variables.address)")
//            }
//        }

        dirFunc.removeLast()
        parameterVerification.removeAll()
    }


	open func enterDeclaration(_ ctx: BasicLearnParser.DeclarationContext) {
        
        for newVariable in ctx.ID() {
            let newVariableType = ctx.type()?.getText()
            
            for param in parameterVerification {
                if newVariable.description == param {
                    print("Error, multiple declaration")
                    return
                    // Handle error appropriately STOP COMPILATION && POP UP notif
                }
            }
            
            for variable in dirFunc.last!.variables {
                if variable.name == newVariable.description {
                    print("Error, multiple declaration")
                    return
                    // Handle error appropriately STOP COMPILATION && POP UP notif
                }
            }
            
            var memoryAddressVariable: Int! //Aqui se graba donde quedara el valor de dicha variable
            
            switch newVariableType {
            case "number":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getNumberAddress(spaces: 1)
                }else{
                    memoryAddressVariable = localMemory.getNumberAddress(spaces: 1)
                }
            case "sentence":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getSentenceAddress(spaces: 1)
                }else{
                    memoryAddressVariable = localMemory.getSentenceAddress(spaces: 1)
                }
            case "bool":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getBoolAddress(spaces: 1)
                }else{
                    memoryAddressVariable = localMemory.getBoolAddress(spaces: 1)
                }
            case "decimal":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getDecimalAddress(spaces: 1)
                }else{
                    memoryAddressVariable = localMemory.getDecimalAddress(spaces: 1)
                }
             default:
                break
                
            }
            let auxVariable = Variable.init(name: newVariable.description, type: Type(type: newVariableType!), address: memoryAddressVariable)
            
            dirFunc.last?.variables.append(auxVariable)
        }
    }

    open func exitDeclaration(_ ctx: BasicLearnParser.DeclarationContext) { }


	open func enterFunction_call(_ ctx: BasicLearnParser.Function_callContext) { }

	open func exitFunction_call(_ ctx: BasicLearnParser.Function_callContext) { }


	open func enterParameters(_ ctx: BasicLearnParser.ParametersContext) {
//        var paramAddress : Int!
        var parameterNames = [String]() // Arreglo auxiliar para guardar los nombres de los parametros
        
        for (parameter) in ctx.ID() {
            for param in parameterVerification {
                if parameter.getText() == param {
                    print("Error, multiple declaration")
                    return
                }
            }
            parameterVerification.append(parameter.getText())
            parameterNames.append(parameter.getText())
        }
        
        var memoryAddressVariable: Int! //Variable que se utilizara para poner donde se guarda la variable
        var parameterCounter = 0
        
        for type in ctx.type() {
            switch type.getText() {
            case "number":
                    memoryAddressVariable = localMemory.getNumberAddress(spaces: 1)
            case "sentence":
                    memoryAddressVariable = localMemory.getSentenceAddress(spaces: 1)
            case "bool":
                    memoryAddressVariable = localMemory.getBoolAddress(spaces: 1)
            case "decimal":
                    memoryAddressVariable = localMemory.getDecimalAddress(spaces: 1)
            default:
                break
            }
//            print(parameterNames)
//            print(parameterCounter)
            let auxVariable = Variable.init(name: parameterNames[parameterCounter], type: Type(type: type.getText()), address: memoryAddressVariable)
            
            dirFunc.last?.variables.append(auxVariable) // Checar si es en dirFunc Last
            
            parameterCounter = parameterCounter + 1
        }
        
        
        
    }

	open func exitParameters(_ ctx: BasicLearnParser.ParametersContext) {
//        print(parameterVerification)
    }


	open func enterIf_statement(_ ctx: BasicLearnParser.If_statementContext) { }

	open func exitIf_statement(_ ctx: BasicLearnParser.If_statementContext) { }


	open func enterRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) { }

	open func exitRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) { }


	open func enterWhile_statement(_ ctx: BasicLearnParser.While_statementContext) { }

	open func exitWhile_statement(_ ctx: BasicLearnParser.While_statementContext) { }


	open func enterSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }

	open func exitSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }


	open func enterShow(_ ctx: BasicLearnParser.ShowContext) { }

	open func exitShow(_ ctx: BasicLearnParser.ShowContext) { }


	open func enterPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }

	open func exitPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }


	open func enterList_select(_ ctx: BasicLearnParser.List_selectContext) { }

	open func exitList_select(_ ctx: BasicLearnParser.List_selectContext) { }


	open func enterList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }

	open func exitList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }


	open func enterPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }

	open func exitPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }


	open func enterSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }

	open func exitSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }


	open func enterArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }

	open func exitArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }


	open func enterSquare(_ ctx: BasicLearnParser.SquareContext) { }

	open func exitSquare(_ ctx: BasicLearnParser.SquareContext) { }


	open func enterEveryRule(_ ctx: ParserRuleContext) { }

	open func exitEveryRule(_ ctx: ParserRuleContext) { }

	open func visitTerminal(_ node: TerminalNode) { }

	open func visitErrorNode(_ node: ErrorNode) { }
}
