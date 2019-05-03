// Generated from BasicLearn.g4 by ANTLR 4.7.1

import Antlr4

/**
 * This class provides an empty implementation of {@link BasicLearnListener},
 * which can be extended to create a listener which only needs to handle a subset
 * of the available methods.
 */
open class BasicLearnBaseListener: BasicLearnListener {
    var scope = "ERROR"
    
    // Cubo semántico
    var semanticTypeCheck = semanticCube()
    
    // Directorio de funciones
    var dirFunc = [Function]()
    
    // Tabla de variables constantes
    var constTable = [Variable]()
    
    // Arreglo para verificar que los parámetros cumplan con semántica
    var parameterVerification = [String]()
    
    //Lista para saltos pendientes en los cuadruplos
    var saltos = [Int]()
    
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
    //Contador Repeat Statement por si hay nested repeats
    var repeatStatementCont = 0
    
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
    
    // Función para verificar si una constante ya existe en la tabla de constantes
    // Si la encuentra te regresa la dirección de la variable, si no la encuentra regresa 0
    func constantExists(currentConstant : String) -> Int {
        for constant in constTable {
            if currentConstant == constant.name {
                return constant.address
            }
        }
        return 0
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
        
        for constant in constTable {
            print("NAME: \(constant.name) TYPE: \(constant.type) ADDRESS: \(constant.address)")
        }
        
        
        // Testing vm
        let virtualMachine = VirtualMachine.init(quadruples: qCuad, globalMemory: globalMemory, localMemory: localMemory, constantMemory: constantMemory, temporalMemory: temporalMemory)
        
        virtualMachine.executeProgram()
        
        
        
    }


	open func enterBody(_ ctx: BasicLearnParser.BodyContext) { }

	open func exitBody(_ ctx: BasicLearnParser.BodyContext) { }


	open func enterExpression(_ ctx: BasicLearnParser.ExpressionContext) {

    }

	open func exitExpression(_ ctx: BasicLearnParser.ExpressionContext) {

        //Para checar si viene de un If_Statement
        if ((ctx.parent as? BasicLearnParser.If_statementContext) != nil){
            
//            let exp_type = pTypes.first //Arreglar este chequeo
            let exp_type = Type.bool
            pTypes.removeFirst()
            if exp_type != Type.bool {
                print("Error Type Mismatch en IF")
            } else {
                let result = PilaO.first
                PilaO.removeFirst()
                let quadAux = Quadruple.init(operand: "GOTOF", leftOp: result!, rightOp: "---", result: "PENDING")
                qCuad.append(quadAux)
                saltos.insert(qCuad.count - 1, at: 0)
                
            }
            
        }
        
        //Para checar si viene de un While_Statement
        if((ctx.parent as? BasicLearnParser.While_statementContext) != nil){
//            let exp_type = pTypes.first //Checar Types porfavvaaaarrr
            let exp_type = Type.bool
            pTypes.removeFirst()
            if (exp_type != Type.bool){
                print("ERROR Type Mismatch en While_Statement")
            } else {
                let result = PilaO.first
                let auxQuad = Quadruple.init(operand: "GOTOF", leftOp: result!, rightOp: "---", result: "PENDING")
                qCuad.append(auxQuad)
                saltos.insert(qCuad.count - 1, at: 0)
            }
        }
        
    }


	open func enterExp(_ ctx: BasicLearnParser.ExpContext) {

    }

	open func exitExp(_ ctx: BasicLearnParser.ExpContext) {
        
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
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(result)))
                
                PilaO.insert(String(result), at: 0) //Por mientras
                pTypes.insert(resultType, at: 0)
                
            } else {
                print("ERROR TYPE MISMATCH")
                // HANDLE ERROR CORRECTLY
            }
        }

        
        if let parent = ctx.parent as? BasicLearnParser.ExpressionContext{
            if let lessThan = parent.LESSTHAN()?.getText(){
                POper.insert(lessThan, at: 0)
            }
            if let greaterThan = parent.MORETHAN()?.getText(){
                POper.insert(greaterThan, at: 0)
            }
            if let lessThanOrEqual = parent.LESSOREQUAL()?.getText(){
                POper.insert(lessThanOrEqual, at: 0)
            }
            if let greaterThanOrEqual = parent.MOREOREQUAL()?.getText(){
                POper.insert(greaterThanOrEqual, at: 0)
            }
            if let equal = parent.EQUALS()?.getText(){
                POper.insert(equal, at: 0)
            }
            if let notEqual = parent.NOTEQUALS()?.getText(){
                POper.insert(notEqual, at: 0)
            }
        }
        
        //Para checar si viene de un repeat statement
        //REPEAT STATEMENT AQUI, NO EN EXPRESSION
        if ((ctx.parent as? BasicLearnParser.Repeat_statementContext) != nil) {
//            let exp_type = pTypes.first //Corregir estos pTipos
            let exp_type = Type.number
            pTypes.removeFirst()
            
            //Repeat necesita un number (INT) no un bool como los otros
            if(exp_type != Type.number){
                print("Error Type Mismatch en Repeat Statement")
            }else{
                let result = PilaO.first
                let memComparison = Quadruple.init(operand: "=", leftOp: "0", rightOp: "---", result: "REP"+String(repeatStatementCont)) //Se guarda la variable de contador para repeat aquí
                qCuad.append(memComparison)
                
                let auxComparison = Quadruple.init(operand: "<", leftOp: "REP"+String(repeatStatementCont), rightOp: result!, result: String(contTemp))//Crea un cuadruplo para hacer la comparación del GOTOF con un contador desde zero
                
                qCuad.append(auxComparison)
                let auxQuad = Quadruple.init(operand: "GOTOF", leftOp: String(contTemp), rightOp: "---", result: "PENDING")
                qCuad.append(auxQuad)
                saltos.insert(qCuad.count - 1, at: 0)
                
                contTemp = contTemp + 1
                repeatStatementCont+=1
            }
        }
    }


	open func enterTerm(_ ctx: BasicLearnParser.TermContext) {


    }

	open func exitTerm(_ ctx: BasicLearnParser.TermContext) {
        
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
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(result)))
                
                PilaO.insert(String(result), at: 0) //Por mientras
                pTypes.insert(resultType, at: 0)
                
            } else {
                print("ERROR TYPE MISMATCH")
                // HANDLE ERROR CORRECTLY
            }
        }

        if let parent = ctx.parent as? BasicLearnParser.ExpContext {
            if let add = parent.ADD()?.getText() {
                POper.insert(add, at: 0)
            }
            
            if let sub = parent.SUBS()?.getText() {
                POper.insert(sub, at: 0)
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
        if ctx.getText() == "true"{
            print ("true")
        }
    }

	open func exitFactor(_ ctx: BasicLearnParser.FactorContext) {
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
                
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(result)))
                
                PilaO.insert(String(result), at: 0)
                pTypes.insert(resultType, at: 0)
                
                
            } else {
                print("ERROR TYPE MISMATCH")
                // HANDLE ERROR CORRECTLY
            }
        }
        
        if let parent = ctx.parent as? BasicLearnParser.TermContext{
            
            if let mult = parent.MULT()?.getText() {
                POper.insert(mult, at: 0)
            }

            if let div = parent.DIV()?.getText() {
                POper.insert(div, at: 0)
            }
        }
    }


	open func enterAssignment(_ ctx: BasicLearnParser.AssignmentContext) {
        if let assign = ctx.ASSIGN()?.getText(){
            POper.insert(assign, at: 0)
        }
        if let currentId = ctx.ID(0)?.getText(){
            if let assignment = getVariable(id: currentId){
                PilaO.insert(String(assignment.address), at: 0)
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
                
                let resultVariableType = getVariable(id: result)!.type
                let resultVariableAddress = getVariable(id: result)!.address
                
                _ = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType!, operand2: resultVariableType)
                
//                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: "---", result: result))
                qCuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: "---", result: String(resultVariableAddress)))
            }
        }


    }


	open func enterBlock(_ ctx: BasicLearnParser.BlockContext) {
        if let parent = ctx.parent as? BasicLearnParser.If_statementContext{
            if parent.getText().contains("else") && parent.block(1)! == ctx.self{ //Else que se asegura que entre al segundo bloque del else
                let AuxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: "PENDING")
                qCuad.append(AuxQuad)
                let ifFalse = saltos.first
                saltos.removeFirst()
                saltos.insert(qCuad.count - 1, at: 0)
                qCuad[ifFalse!].fillJump(jump: String(qCuad.count))
            }
        }
    }

	open func exitBlock(_ ctx: BasicLearnParser.BlockContext) { }


	open func enterType(_ ctx: BasicLearnParser.TypeContext) { }

	open func exitType(_ ctx: BasicLearnParser.TypeContext) { }


	open func enterStatement(_ ctx: BasicLearnParser.StatementContext) {}

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
        for function in dirFunc {
            print("FUNCTION \(function.name)")
            for variables in function.variables {
                print("TYPE: \(variables.type) NAME: \(variables.name) ADDRESS: \(variables.address)")
            }
        }

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


	open func enterIf_statement(_ ctx: BasicLearnParser.If_statementContext) {

    }

	open func exitIf_statement(_ ctx: BasicLearnParser.If_statementContext) {

        let end = saltos.first
        saltos.removeFirst()
        qCuad[end!].fillJump(jump: String(qCuad.count))
    }


	open func enterRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) {
        //Se le pone el + 1 debido al cuadruplo de asignación de contador que se crea en exitExp
        saltos.insert(qCuad.count + 1, at: 0)
    }

	open func exitRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) {
        let end = saltos.first
        saltos.removeFirst()
        let falseJump = saltos.first
        saltos.removeFirst()
        let auxCounterQuad = Quadruple.init(operand: "+", leftOp: "REP"+String(repeatStatementCont - 1), rightOp: "1", result: "REP"+String(repeatStatementCont - 1)) //Cuadruplo para sumar uno al final del repeat statement
        qCuad.append(auxCounterQuad)
        repeatStatementCont -= 1
        
        let auxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: String(falseJump!))
        qCuad.append(auxQuad)
        qCuad[end!].fillJump(jump: String(qCuad.count))
    }


	open func enterWhile_statement(_ ctx: BasicLearnParser.While_statementContext) {
        saltos.insert(qCuad.count, at: 0)
    }

	open func exitWhile_statement(_ ctx: BasicLearnParser.While_statementContext) {
        let end = saltos.first
        saltos.removeFirst()
        let returnJump = saltos.first
        saltos.removeFirst()
        
        let auxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: String(returnJump!))
        qCuad.append(auxQuad)
        qCuad[end!].fillJump(jump: String(qCuad.count))
    }


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
