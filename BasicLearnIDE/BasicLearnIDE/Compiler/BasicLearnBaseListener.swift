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
    // repeatStatementAddrs
    var repeatStatementAddresses = [Int]()
    //Parameter Counter
    var paramCounter = 0
    //Parameter Total
    var paramTotal = 0
    //Variable para saber que memoria temporal utilizar
    var currentMemory : Memory = Memory.init(baseAddress: 0)
    
    var outputs = [String]()

    
    // Memory
    var globalMemory = Memory.init(baseAddress: 0)
    var localMemory = Memory.init(baseAddress: 6000)
    var constantMemory = Memory.init(baseAddress: 12000)
    var temporalMemory = Memory.init(baseAddress: 18000)
    var localTemporalMemory = Memory.init(baseAddress: 24000)
    
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
    
    func getFunction(id: String) -> Function?{
        for function in dirFunc{
            if function.name == id {
                return function
            }
        }
        return nil
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
        currentMemory = temporalMemory
        let programName = ctx.ID()?.getText() ?? "Error"
        let programFunction = Function.init(name: programName, type: Type.program, address: 0, quadrupleNumber: 0)
        
        dirFunc.append(programFunction)
        qCuad.append(Quadruple.init(operand: "GOTO", leftOp: "___", rightOp: "___", result: "PENDING"))
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
        let virtualMachine = VirtualMachine.init(quadruples: qCuad, globalMemory: globalMemory, localMemory: localMemory, constantMemory: constantMemory, temporalMemory: temporalMemory, localTemporalMemory : localTemporalMemory, dirFunc: dirFunc)
        
        virtualMachine.executeProgram()

        outputs = virtualMachine.outputs
       
    }


	open func enterBody(_ ctx: BasicLearnParser.BodyContext) {
        qCuad[0].fillJump(jump: String(qCuad.count))
    }

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
                PilaO.removeFirst()
                let auxQuad = Quadruple.init(operand: "GOTOF", leftOp: result!, rightOp: "---", result: "PENDING")
                qCuad.append(auxQuad)
                saltos.insert(qCuad.count - 1, at: 0)
            }
        }
        
        //Para checar si viene de un function call
        if let parent = ctx.parent as? BasicLearnParser.Function_callContext {
            let argument = PilaO.first
            PilaO.removeFirst()
            let argumentType = pTypes.first
            pTypes.removeFirst()
            let auxFunction = getFunction(id: (parent.ID()?.getText())!)
            
            //Checar que se esten enviando los parametros correctos
//            print("Function verification \(argumentType)  \(auxFunction?.ParamTable[paramCounter].type)")
            if argumentType == auxFunction?.ParamTable[paramCounter].type{
                let auxQuad = Quadruple.init(operand: "PARAM", leftOp: String(argument!), rightOp: "---", result: "Param"+String(paramCounter))
                qCuad.append(auxQuad)
                
                paramCounter += 1
                if paramCounter > paramTotal{
                    print("ERROR: Hay mas parametros que los declarados en funcion")
                }
            } else {
                print("TYPE MISMATCH IN FUNCTION CALL")
            }
        }
        
        // Para revisar si viene de un show
        if let parent = ctx.parent as? BasicLearnParser.ShowContext {
            if let show = getVariable(id: parent.expression()!.getText())?.address {
                let auxQuad = Quadruple.init(operand: "SHOW", leftOp: "___", rightOp: "___", result: String(show))
                qCuad.append(auxQuad)
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
                
//                if scope == "LOCAL" {
//                    currentMemory = localTemporalMemory
//                }
                
                switch resultType {
                case Type.number:
                    result = currentMemory.getNumberAddress(spaces: 1)
                    
                case Type.sentence:
                    result = currentMemory.getSentenceAddress(spaces: 1)
                    
                case Type.bool:
                    result = currentMemory.getBoolAddress(spaces: 1)
                    
                case Type.decimal:
                    result = currentMemory.getDecimalAddress(spaces: 1)
                    
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
            if parent.exp(0)! == ctx.self{
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
                PilaO.removeFirst()
                
//                var tempMem = temporalMemory
                
//                if scope == "LOCAL" {
//                    tempMem = localTemporalMemory
//                }
                
                let tempAddressRepeat = currentMemory.getNumberAddress(spaces: 1)
                repeatStatementAddresses.insert(tempAddressRepeat, at: 0)
                
                let resultAddress = String(currentMemory.getBoolAddress(spaces: 1))
                
                var zeroAddress : Int
                
                if constantExists(currentConstant: "0") == 0 {
                    zeroAddress = constantMemory.getNumberAddress(spaces: 1)
                    constTable.append(Variable.init(name: "0", type: Type.number, address: zeroAddress))
//                    PilaO.insert(String(constantAddress), at: 0)
                    constantMemory.saveNumberConstant(value: 0, address: zeroAddress)
                } else {
//                    PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
                    zeroAddress = constantExists(currentConstant: "0")
                }

                
                let memComparison = Quadruple.init(operand: "=", leftOp: String(zeroAddress), rightOp: "---", result: String(tempAddressRepeat)) //Se guarda la dirección del contador para repeat aquí
                qCuad.append(memComparison)
                
                let auxComparison = Quadruple.init(operand: "<", leftOp: String(tempAddressRepeat), rightOp: result!, result: resultAddress)//Crea un cuadruplo para hacer la comparación del GOTOF con un contador desde zero
                
                qCuad.append(auxComparison)
                let auxQuad = Quadruple.init(operand: "GOTOF", leftOp: resultAddress, rightOp: "---", result: "PENDING")
                qCuad.append(auxQuad)
                saltos.insert(qCuad.count - 1, at: 0)
    
            }
        }
        
        if let parent = ctx.parent as? BasicLearnParser.StatementContext {
            if (parent.getText().contains("return")) {
                let result = PilaO.first
                PilaO.removeFirst()
                let type = pTypes.first
                pTypes.removeFirst()
                //TYPE CHECK ON RETURN FALTA
                
                let auxQuad = Quadruple.init(operand: "RET", leftOp: "---", rightOp: "---", result: String(result!))
                qCuad.append(auxQuad)
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
                
//                if scope == "LOCAL" {
//                    currentMemory = localTemporalMemory
//                }
                switch resultType {
                case Type.number:
                    result = currentMemory.getNumberAddress(spaces: 1)
                    
                case Type.sentence:
                    result = currentMemory.getSentenceAddress(spaces: 1)
                    
                case Type.bool:
                    result = currentMemory.getBoolAddress(spaces: 1)
                    
                case Type.decimal:
                    result = currentMemory.getDecimalAddress(spaces: 1)
                    
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
            
            PilaO.insert((String(operand.address)), at: 0)
            pTypes.insert(operand.type, at: 0)
            
        }
        
        // Guardar las constantes en la tabla de constantes
        if let currConstant = ctx.CTE_I()?.getText() {
            if constantExists(currentConstant: currConstant) == 0 {
                let constantAddress = constantMemory.getNumberAddress(spaces: 1)
                constTable.append(Variable.init(name: currConstant, type: Type.number, address: constantAddress))
                PilaO.insert(String(constantAddress), at: 0)
                constantMemory.saveNumberConstant(value: Int(currConstant)!, address: constantAddress)
            } else {
                PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
            }
            pTypes.insert(Type.number, at: 0)
        }
        
        if let currConstant = ctx.CTE_F()?.getText() {
            if constantExists(currentConstant: currConstant) == 0 {
                let constantAddress = constantMemory.getDecimalAddress(spaces: 1)
                constTable.append(Variable.init(name: currConstant, type: Type.decimal, address: constantAddress))
                PilaO.insert(String(constantAddress), at: 0)
                constantMemory.saveDecimalConstant(value: Float(currConstant)!, address: constantAddress)
            } else {
                PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
            }
            pTypes.insert(Type.decimal, at: 0)
        }
        
        if ctx.getText() == "true" || ctx.getText() == "false" {
            let currConstant = ctx.getText()
            
            if constantExists(currentConstant: currConstant) == 0 {
                let constantAddress = constantMemory.getBoolAddress(spaces: 1)
                constTable.append(Variable.init(name: currConstant, type: Type.bool, address: constantAddress))
                PilaO.insert(String(constantAddress), at: 0)
                constantMemory.saveBoolConstant(value: Bool(currConstant)!, address: constantAddress)
            } else {
                PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
            }
            pTypes.insert(Type.bool, at: 0)
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
                
//                if scope == "LOCAL" {
//                    currentMemory = localTemporalMemory
//                }
                
                switch resultType {
                case Type.number:
                    result = currentMemory.getNumberAddress(spaces: 1)
                    
                case Type.sentence:
                    result = currentMemory.getSentenceAddress(spaces: 1)
                    
                case Type.bool:
                    result = currentMemory.getBoolAddress(spaces: 1)
                    
                case Type.decimal:
                    result = currentMemory.getDecimalAddress(spaces: 1)
                    
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
        currentMemory = localTemporalMemory
        
        let functionType = ctx.type()?.getText() ?? "Error"
        let functionName = ctx.ID()?.getText() ?? "Error"
        
        for function in dirFunc {
            if functionName == function.name {
                // TODO: handle error appropriately STOP COMPILATION && POP UP notif
                print("Error, multiple declaration")
                return
            }
        }

        let function = Function.init(name: functionName, type: Type(type: functionType), address: 0, quadrupleNumber: qCuad.count)
        dirFunc.append(function)

	}

	open func exitFunction(_ ctx: BasicLearnParser.FunctionContext) {
        for function in dirFunc {
            print("FUNCTION \(function.name) SCOPE: \(scope)")
            for variables in function.variables {
                print("TYPE: \(variables.type) NAME: \(variables.name) ADDRESS: \(variables.address) PARAM:\(function.numParam) VARIABLES: \(function.numVariable)" )
            }
        }

        dirFunc.last?.variables.removeAll()
        parameterVerification.removeAll()
        let auxQuad = Quadruple.init(operand: "ENDPROC", leftOp: "---", rightOp: "---", result: "---")
        qCuad.append(auxQuad)
        localTemporalMemory.cleanMemory()
        localMemory.cleanMemory()
        currentMemory = temporalMemory
        scope = "GLOBAL"
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
        let auxCountVariables = dirFunc.last?.variables.count
        let auxNumParam = dirFunc.last?.numParam
        dirFunc.last?.inserNumVariable(num: auxCountVariables! - auxNumParam!)
    }

    open func exitDeclaration(_ ctx: BasicLearnParser.DeclarationContext) { }


	open func enterFunction_call(_ ctx: BasicLearnParser.Function_callContext) {
        var bFunctionFound = false
        for function in dirFunc {
            if function.name == ctx.ID()!.getText(){
                paramTotal = function.numParam
                bFunctionFound = true
            }
        }
        
        if bFunctionFound{
            let auxQuad = Quadruple.init(operand: "ERA", leftOp: "---", rightOp: "---", result: ctx.ID()!.getText())
            qCuad.append(auxQuad)
            
        }else{
             print("No se encontro la función \(ctx.ID()!.getText())")
        }
    }

	open func exitFunction_call(_ ctx: BasicLearnParser.Function_callContext) {
        var auxFunc : Function
        
        for function in dirFunc {
            if function.name == ctx.ID()!.getText(){
                auxFunc = function
                
                let auxQuad = Quadruple.init(operand: "GOSUB", leftOp: ctx.ID()!.getText(), rightOp: "---", result: String(auxFunc.quadrupleNumber))
                
                qCuad.append(auxQuad)
            }
        }

        
        paramCounter = 0
        paramTotal = 0
    }


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
            dirFunc.last?.ParamTable.append(auxVariable)
            
            parameterCounter = parameterCounter + 1
        }
        
        dirFunc.last?.insertNumParam(num: parameterCounter)
        
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
        print(repeatStatementAddresses)
        let end = saltos.first
        saltos.removeFirst()
        let falseJump = saltos.first
        saltos.removeFirst()
        var zeroAddress : Int
        
        if constantExists(currentConstant: "1") == 0 {
            zeroAddress = constantMemory.getNumberAddress(spaces: 1)
            constTable.append(Variable.init(name: "1", type: Type.number, address: zeroAddress))
            //                    PilaO.insert(String(constantAddress), at: 0)
            constantMemory.saveNumberConstant(value: 0, address: zeroAddress)
        } else {
            //                    PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
            zeroAddress = constantExists(currentConstant: "1")
        }
        
        let auxCounterQuad = Quadruple.init(operand: "+", leftOp: String(repeatStatementAddresses.first!), rightOp: String(zeroAddress), result: String(repeatStatementAddresses.first!)) //Cuadruplo para sumar uno al final del repeat statement
        qCuad.append(auxCounterQuad)
        
        let auxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: String(falseJump!))
        repeatStatementAddresses.removeFirst()

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
