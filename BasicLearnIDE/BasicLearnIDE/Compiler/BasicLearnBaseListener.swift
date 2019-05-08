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
    var qQuad = [Quadruple]()
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
    
    var functions = [Function]()

    
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
        qQuad.append(Quadruple.init(operand: "GOTO", leftOp: "___", rightOp: "___", result: "PENDING"))
    }

	open func exitProgram(_ ctx: BasicLearnParser.ProgramContext) {
        dirFunc.removeAll()
        
        var i = 0;
        for quad in qQuad {
            print("\(i):\t\t \(quad.operand) \t\t \(quad.leftOp) \t\t \(quad.rightOp) \t\t \(quad.result)")
            i += 1
        }
        
        for constant in constTable {
            print("NAME: \(constant.name) TYPE: \(constant.type) ADDRESS: \(constant.address)")
        }
        
        
        // Testing vm
        let virtualMachine = VirtualMachine.init(quadruples: qQuad, globalMemory: globalMemory, localMemory: localMemory, constantMemory: constantMemory, temporalMemory: temporalMemory, localTemporalMemory : localTemporalMemory, functions: functions)

        virtualMachine.executeProgram()

        outputs = virtualMachine.outputs
       
    }


	open func enterBody(_ ctx: BasicLearnParser.BodyContext) {
        qQuad[0].fillJump(jump: String(qQuad.count))
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
                qQuad.append(quadAux)
                saltos.insert(qQuad.count - 1, at: 0)
                
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
                qQuad.append(auxQuad)
                saltos.insert(qQuad.count - 1, at: 0)
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
                qQuad.append(auxQuad)
                
                paramCounter += 1
                if paramCounter > paramTotal{
                    print("ERROR: Hay mas parametros que los declarados en funcion")
                }
            } else {
                print("TYPE MISMATCH IN FUNCTION CALL")
            }
        }
        
        // Para revisar si viene de un show
        if (ctx.parent as? BasicLearnParser.ShowContext) != nil {
            let result = PilaO.first
            PilaO.removeFirst()
            pTypes.removeFirst()
            let auxQuad = Quadruple.init(operand: "SHOW", leftOp: "---", rightOp: "---", result: result!)
            qQuad.append(auxQuad)
        }
    }


	open func enterExp(_ ctx: BasicLearnParser.ExpContext) { }

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
                
                qQuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(result)))
                
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
        
        if let parent = ctx.parent as? BasicLearnParser.FactorContext{
            if let currentId = parent.ID()?.getText(){
                if let assignment = getVariable(id: currentId){
                    if(assignment.dimensionated && parent.LEFTBRACKET() != nil){
                        let result = temporalMemory.getNumberAddress(spaces: 1)
                        var auxQuad = Quadruple.init(operand: "VER", leftOp: PilaO.first!, rightOp: "1", result: String(assignment.descriptionDim[0].limSup))
                        qQuad.append(auxQuad)
                        
                        let constantAddress = constantMemory.getNumberAddress(spaces: 1)
                        constTable.append(Variable.init(name: "-1", type: Type.number, address: constantAddress))
                        constantMemory.saveNumberConstant(value: -1, address: constantAddress)
                        
                        auxQuad = Quadruple.init(operand: "+", leftOp: PilaO.first!, rightOp: String(constantAddress), result: String(result))
                        qQuad.append(auxQuad)
                        PilaO.removeFirst()
                        
                        let dirBase = constantMemory.getNumberAddress(spaces: 1)
                        constTable.append(Variable.init(name: String(assignment.address), type: Type.number, address: dirBase))
                        constantMemory.saveNumberConstant(value: Int(assignment.address), address: dirBase)
                        
                        let result1 = String(temporalMemory.getNumberAddress(spaces: 1))
                        auxQuad = Quadruple.init(operand: "+", leftOp: String(result), rightOp: String(dirBase), result: "("+result1+")")
                        
                        qQuad.append(auxQuad)
                        PilaO.insert("("+result1+")", at: 0)
                        
                        if POper.first == "["{
                            POper.removeFirst()
                        }
                    }
                } else {
                    print("Error: Esta variable no se encontro \(currentId)")
                    return }
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
                qQuad.append(memComparison)
                
                let auxComparison = Quadruple.init(operand: "<", leftOp: String(tempAddressRepeat), rightOp: result!, result: resultAddress)//Crea un cuadruplo para hacer la comparación del GOTOF con un contador desde zero
                
                qQuad.append(auxComparison)
                let auxQuad = Quadruple.init(operand: "GOTOF", leftOp: resultAddress, rightOp: "---", result: "PENDING")
                qQuad.append(auxQuad)
                saltos.insert(qQuad.count - 1, at: 0)
    
            }
        }
        
        if let parent = ctx.parent as? BasicLearnParser.StatementContext {
            if parent.RETURN() != nil {
                print(parent.getText())
                let result = PilaO.first
                PilaO.removeFirst()
                let type = pTypes.first
                pTypes.removeFirst()
                //TYPE CHECK ON RETURN FALTA

                let auxQuad = Quadruple.init(operand: "RET", leftOp: "---", rightOp: "---", result: String(result!))
                qQuad.append(auxQuad)
            }
        }
        
        if let parent = ctx.parent as? BasicLearnParser.AssignmentContext{
            if let currentId = parent.ID()?.getText(){
                if let assignment = getVariable(id: currentId){
                    if(assignment.dimensionated && parent.LEFTBRACKET() != nil){
                        let result = temporalMemory.getNumberAddress(spaces: 1)
                        var auxQuad = Quadruple.init(operand: "VER", leftOp: PilaO.first!, rightOp: "1", result: String(assignment.descriptionDim[0].limSup))
                        qQuad.append(auxQuad)
                        
                        let constantAddress = constantMemory.getNumberAddress(spaces: 1)
                        constTable.append(Variable.init(name: "-1", type: Type.number, address: constantAddress))
                        constantMemory.saveNumberConstant(value: -1, address: constantAddress)
                        auxQuad = Quadruple.init(operand: "+", leftOp: PilaO.first!, rightOp: String(constantAddress), result: String(result))
                        qQuad.append(auxQuad)
                        PilaO.removeFirst()
                        
                        let dirBase = constantMemory.getNumberAddress(spaces: 1)
                        constTable.append(Variable.init(name: String(assignment.address), type: Type.number, address: dirBase))
                        constantMemory.saveNumberConstant(value: Int(assignment.address), address: dirBase)
                        
                        let result1 = String(temporalMemory.getNumberAddress(spaces: 1))
                        auxQuad = Quadruple.init(operand: "+", leftOp: String(result), rightOp: String(dirBase), result: "("+result1+")")
                        qQuad.append(auxQuad)
                        PilaO.insert("("+result1+")", at: 0)
                    }
                } else {
                    print("Error: Esta variable no se encontro \(currentId)")
                    return }
            }
        }
        
        if let parent = ctx.parent as? BasicLearnParser.FactorContext{
            if let currentId = parent.ID()?.getText(){
                if let assignment = getVariable(id: currentId){
                    if(assignment.dimensionated && parent.LEFTBRACKET() != nil){
                        let result = temporalMemory.getNumberAddress(spaces: 1)
                        var auxQuad = Quadruple.init(operand: "VER", leftOp: PilaO.first!, rightOp: "1", result: String(assignment.descriptionDim[0].limSup))
                        qQuad.append(auxQuad)
                        auxQuad = Quadruple.init(operand: "+", leftOp: PilaO.first!, rightOp: "-1", result: String(result))
                        qQuad.append(auxQuad)
                        PilaO.removeFirst()
                        let result1 = String(temporalMemory.getNumberAddress(spaces: 1))
                        auxQuad = Quadruple.init(operand: "+", leftOp: String(result), rightOp: String(assignment.address), result: "("+result1+")")
                        qQuad.append(auxQuad)
                        PilaO.insert("("+result1+")", at: 0)
                    }
                } else {
                    print("Error: Esta variable no se encontro \(currentId)")
                    return }
            }
        }
    }


	open func enterTerm(_ ctx: BasicLearnParser.TermContext) { }

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
                
                qQuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(result)))
                
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
        
        if ctx.exp() == nil {
            if let currentId = ctx.ID()?.getText(){
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
                    if ctx.getText().contains("-"){
                        constantMemory.saveNumberConstant(value: -Int(currConstant)!, address: constantAddress)
                    }else{
                        constantMemory.saveNumberConstant(value: Int(currConstant)!, address: constantAddress)
                    }
                    
                } else {
                    PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
                }
                pTypes.insert(Type.number, at: 0)
            }
            
            if let currConstant = ctx.CTE_F()?.getText(){
                if constantExists(currentConstant: currConstant) == 0 {
                    let constantAddress = constantMemory.getDecimalAddress(spaces: 1)
                    constTable.append(Variable.init(name: currConstant, type: Type.decimal, address: constantAddress))
                    PilaO.insert(String(constantAddress), at: 0)
                    if ctx.getText().contains("-"){
                        constantMemory.saveDecimalConstant(value: -Float(currConstant)!, address: constantAddress)
                    }else{
                        constantMemory.saveDecimalConstant(value: Float(currConstant)!, address: constantAddress)
                    }
                    
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
            
            if let currConstant = ctx.SENTENCE_CONST()?.getText() {
                if constantExists(currentConstant: currConstant) == 0 {
                    let constantAddress = constantMemory.getSentenceAddress(spaces: 1)
                    constTable.append(Variable.init(name: currConstant, type: Type.sentence, address: constantAddress))
                    PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
                    constantMemory.saveSentenceConstant(value: currConstant, address: constantAddress)
                } else {
                    PilaO.insert(String(constantExists(currentConstant: currConstant)), at: 0)
                }
                pTypes.insert(Type.sentence, at: 0)
            }
        } else {
            POper.insert("[", at: 0)
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
                
                qQuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: rightOperand!, result: String(result)))
                
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
        if let currentId = ctx.ID()?.getText(){
            if let assignment = getVariable(id: currentId){
                if !assignment.dimensionated && ctx.LEFTBRACKET() != nil{
                    print("Error, se intenta asignar dimension a variable que no es dimensionada")
                }else if assignment.dimensionated && ctx.LEFTBRACKET() == nil{
                    print("Error, no se especifica que casilla")
                    
                }else if (!assignment.dimensionated){
                    PilaO.insert(String(assignment.address), at: 0)
                    pTypes.insert(assignment.type, at: 0)
                    print("Current ID: \(currentId) Address:\(assignment.address)" )
                }

            } else {
                print("Error: Esta variable no se encontro \(currentId)")
                return
                
            }
        }
    }

	open func exitAssignment(_ ctx: BasicLearnParser.AssignmentContext) {
        if ctx.LEFTBRACKET() != nil {
            if let result = ctx.ID()?.getText(){
                if POper.first == "=" {
                    let leftOperand = PilaO.first
                    let leftOperandType = pTypes.first
                    pTypes.removeFirst()
                    PilaO.removeFirst()
                    let op = POper.first
                    POper.removeFirst()
                    let resultVariableAddress = PilaO.first
                    PilaO.removeFirst()
                    
                    let resultVariableType = getVariable(id: result)!.type
//                    let resultVariableAddress = getVariable(id: result)!.address
                    
                    let check = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType!, operand2: resultVariableType)
                    
                    qQuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: "---", result: String(resultVariableAddress!)))
                }
            }
        }else {
            if let result = ctx.ID()?.getText(){
                if POper.first == "=" {
                var leftOperand : String
                var leftOperandType : Type

                let op = POper.first
                POper.removeFirst()
                
                if let functionCall = ctx.function_call()?.ID()?.getText() {
                    leftOperandType = getFunction(id: functionCall)!.type
                    leftOperand = String(getFunction(id: functionCall)!.address)
                } else {
                    leftOperand = PilaO.first!
                    leftOperandType = pTypes.first!
                    pTypes.removeFirst()
                    PilaO.removeFirst()
                 
                }
                
                let resultVariableType = getVariable(id: result)!.type
                let resultVariableAddress = getVariable(id: result)!.address
                
              
                _ = semanticTypeCheck.checkOperation(op: op!, operand1: leftOperandType, operand2: resultVariableType)
                
//                qQuad.append(Quadruple.init(operand: op!, leftOp: leftOperand!, rightOp: "---", result: result))
                qQuad.append(Quadruple.init(operand: op!, leftOp: leftOperand, rightOp: "---", result: String(resultVariableAddress)))
                }
            }
        }

    }


	open func enterBlock(_ ctx: BasicLearnParser.BlockContext) {
        if let parent = ctx.parent as? BasicLearnParser.If_statementContext{
            if parent.getText().contains("else") && parent.block(1)! == ctx.self{ //Else que se asegura que entre al segundo bloque del else
                let AuxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: "PENDING")
                qQuad.append(AuxQuad)
                let ifFalse = saltos.first
                saltos.removeFirst()
                saltos.insert(qQuad.count - 1, at: 0)
                qQuad[ifFalse!].fillJump(jump: String(qQuad.count))
            }
        }
    }

	open func exitBlock(_ ctx: BasicLearnParser.BlockContext) { }


	open func enterType(_ ctx: BasicLearnParser.TypeContext) { }

	open func exitType(_ ctx: BasicLearnParser.TypeContext) { }


	open func enterStatement(_ ctx: BasicLearnParser.StatementContext) { }

	open func exitStatement(_ ctx: BasicLearnParser.StatementContext) {

    }


	open func enterFunction(_ ctx: BasicLearnParser.FunctionContext) {
        scope = "LOCAL"
        currentMemory = localTemporalMemory
        
        let functionType = ctx.type()?.getText() ?? "Error"
        let functionName = ctx.ID()?.getText() ?? "Error"
        var functionAddress = -1
        
        switch functionType {
        case "number":
            functionAddress = globalMemory.getNumberAddress(spaces: 1)
        case "decimal":
            functionAddress = globalMemory.getDecimalAddress(spaces: 1)
        case "bool":
            functionAddress = globalMemory.getBoolAddress(spaces: 1)
        case "sentence" :
            functionAddress = globalMemory.getSentenceAddress(spaces: 1)
        default:
            break
        }
        
        for function in dirFunc {
            if functionName == function.name {
                // TODO: handle error appropriately STOP COMPILATION && POP UP notif
                print("Error, multiple declaration")
                return
            }
        }

        let function = Function.init(name: functionName, type: Type(type: functionType), address: functionAddress, quadrupleNumber: qQuad.count)
        dirFunc.append(function)

	}

	open func exitFunction(_ ctx: BasicLearnParser.FunctionContext) {
        for function in dirFunc {
            print("FUNCTION \(function.name) SCOPE: \(scope) ADDRESS: \(function.address)")
            for variables in function.variables {
                print("TYPE: \(variables.type) NAME: \(variables.name) ADDRESS: \(variables.address) PARAM:\(function.numParam) VARIABLES: \(function.numVariable)" )
            }
        }

        dirFunc.last?.variables.removeAll()
        parameterVerification.removeAll()
        let auxQuad = Quadruple.init(operand: "ENDPROC", leftOp: "---", rightOp: "---", result: "---")
        qQuad.append(auxQuad)
        localTemporalMemory.cleanMemory()
        localMemory.cleanMemory()
        currentMemory = temporalMemory
        scope = "GLOBAL"
    }


	open func enterDeclaration(_ ctx: BasicLearnParser.DeclarationContext) {
        var iCounter = 0
        
        for newVariable in ctx.ID() {
            
            var dimensioned = false
            var spacesNeeded = 1
            var dimension : dimensionDescription!
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
            for leftBracket in ctx.LEFTBRACKET(){
                if((newVariable.getSymbol()?.getTokenIndex())!+1 == leftBracket.getSymbol()?.getTokenIndex()){
                    let limSup = Int((ctx.CTE_I(iCounter)?.getText())!)!
                    dimension = dimensionDescription.init(superior: limSup)
                    iCounter += 1
                    dimensioned = true
                }
            }
            
            if(dimensioned){
                spacesNeeded = dimension.R
            }
            
            var memoryAddressVariable: Int! //Aqui se graba donde quedara el valor de dicha variable
            
            switch newVariableType {
            case "number":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getNumberAddress(spaces: spacesNeeded)
                }else{
                    memoryAddressVariable = localMemory.getNumberAddress(spaces: spacesNeeded)
                }
            case "sentence":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getSentenceAddress(spaces: spacesNeeded)
                }else{
                    memoryAddressVariable = localMemory.getSentenceAddress(spaces: spacesNeeded)
                }
            case "bool":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getBoolAddress(spaces: spacesNeeded)
                }else{
                    memoryAddressVariable = localMemory.getBoolAddress(spaces: spacesNeeded)
                }
            case "decimal":
                if(scope == "GLOBAL"){
                    memoryAddressVariable = globalMemory.getDecimalAddress(spaces: spacesNeeded)
                }else{
                    memoryAddressVariable = localMemory.getDecimalAddress(spaces: spacesNeeded)
                }
             default:
                break
                
            }
            let auxVariable = Variable.init(name: newVariable.description, type: Type(type: newVariableType!), address: memoryAddressVariable)
            
            if dimensioned {
                auxVariable.isDimentioned()
                auxVariable.descriptionDim.append(dimension)
                dirFunc.last?.variables.append(auxVariable)
            }else{
                dirFunc.last?.variables.append(auxVariable)
            }
            
            
        }
        let auxCountVariables = dirFunc.last?.variables.count
        let auxNumParam = dirFunc.last?.numParam
        dirFunc.last?.inserNumVariable(num: auxCountVariables! - auxNumParam!)
    }

    open func exitDeclaration(_ ctx: BasicLearnParser.DeclarationContext) {
        
    }


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
            functions.append(getFunction(id: ctx.ID()!.getText())!)
            qQuad.append(auxQuad)
            
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
                
                qQuad.append(auxQuad)
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
        qQuad[end!].fillJump(jump: String(qQuad.count))
    }


	open func enterRepeat_statement(_ ctx: BasicLearnParser.Repeat_statementContext) {
        //Se le pone el + 1 debido al cuadruplo de asignación de contador que se crea en exitExp
        saltos.insert(qQuad.count + 1, at: 0)
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
        qQuad.append(auxCounterQuad)
        
        let auxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: String(falseJump!))
        repeatStatementAddresses.removeFirst()

        qQuad.append(auxQuad)
        qQuad[end!].fillJump(jump: String(qQuad.count))
    }


	open func enterWhile_statement(_ ctx: BasicLearnParser.While_statementContext) {
        saltos.insert(qQuad.count, at: 0)
    }

	open func exitWhile_statement(_ ctx: BasicLearnParser.While_statementContext) {
        let end = saltos.first
        saltos.removeFirst()
        let returnJump = saltos.first
        saltos.removeFirst()
        
        let auxQuad = Quadruple.init(operand: "GOTO", leftOp: "---", rightOp: "---", result: String(returnJump!))
        qQuad.append(auxQuad)
        qQuad[end!].fillJump(jump: String(qQuad.count))
    }


	open func enterSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) { }

	open func exitSpecial_function(_ ctx: BasicLearnParser.Special_functionContext) {
        if (ctx.parent as? BasicLearnParser.ShowContext) != nil {
            let result = PilaO.first
            PilaO.removeFirst()
            pTypes.removeFirst()
            let auxQuad = Quadruple.init(operand: "SHOW", leftOp: "---", rightOp: "---", result: result!)
            qQuad.append(auxQuad)
        }
    }


	open func enterShow(_ ctx: BasicLearnParser.ShowContext) { }

	open func exitShow(_ ctx: BasicLearnParser.ShowContext) { }


	open func enterPythagoras(_ ctx: BasicLearnParser.PythagorasContext) { }

	open func exitPythagoras(_ ctx: BasicLearnParser.PythagorasContext) {
        let operation = ctx.getChild(0)?.toStringTree()
        let operatorVm = operation!.uppercased()
        
        let rightOperand = PilaO.first!
        pTypes.removeFirst()
        PilaO.removeFirst()
        let leftOperand = PilaO.first!
        pTypes.removeFirst()
        PilaO.removeFirst()
        
        let resultType = Type.decimal
        
        
        if resultType != Type.error {
            
            var result : Int!
            
            result = currentMemory.getDecimalAddress(spaces: 1)
            
            let auxQuad = Quadruple.init(operand: operatorVm, leftOp: leftOperand, rightOp: rightOperand, result: String(result))
            
            qQuad.append(auxQuad)
            
            
            PilaO.insert(String(result), at: 0)
            pTypes.insert(resultType, at: 0)
            
        } else {
            print("ERROR TYPE MISMATCH")
            // HANDLE ERROR CORRECTLY
        }
    }


	open func enterList_select(_ ctx: BasicLearnParser.List_selectContext) { }

	open func exitList_select(_ ctx: BasicLearnParser.List_selectContext) {
        if let currentId = ctx.ID()?.getText(){
            if let assignment = getVariable(id: currentId){
                if(assignment.dimensionated && ctx.LEFTPAREN() != nil){
                    let result = temporalMemory.getNumberAddress(spaces: 1)
                    var auxQuad = Quadruple.init(operand: "VER", leftOp: PilaO.first!, rightOp: "1", result: String(assignment.descriptionDim[0].limSup))
                    qQuad.append(auxQuad)
                    
                    let constantAddress = constantMemory.getNumberAddress(spaces: 1)
                    constTable.append(Variable.init(name: "-1", type: Type.number, address: constantAddress))
                    constantMemory.saveNumberConstant(value: -1, address: constantAddress)
                    
                    auxQuad = Quadruple.init(operand: "+", leftOp: PilaO.first!, rightOp: String(constantAddress), result: String(result))
                    qQuad.append(auxQuad)
                    PilaO.removeFirst()
                    let dirBase = constantMemory.getNumberAddress(spaces: 1)
                    constTable.append(Variable.init(name: String(assignment.address), type: Type.number, address: dirBase))
                    constantMemory.saveNumberConstant(value: Int(assignment.address), address: dirBase)
                    
                    let result1 = String(temporalMemory.getNumberAddress(spaces: 1))
                    auxQuad = Quadruple.init(operand: "+", leftOp: String(result), rightOp: String(dirBase), result: "("+result1+")")
                    qQuad.append(auxQuad)
                    PilaO.insert("("+result1+")", at: 0)
                }
            } else {
                print("Error: Esta variable no se encontro \(currentId)")
                return }
        }
    }


	open func enterList_functions(_ ctx: BasicLearnParser.List_functionsContext) { }

	open func exitList_functions(_ ctx: BasicLearnParser.List_functionsContext) {
        var result : Int!
        if let array = getVariable(id: (ctx.ID()?.getText())!){
            switch array.type {
            case Type.number:
                result = currentMemory.getNumberAddress(spaces: 1)
                pTypes.insert(Type.number, at: 0)
            case Type.decimal:
                result = currentMemory.getDecimalAddress(spaces: 1)
                pTypes.insert(Type.decimal, at: 0)
            case Type.bool:
                result = currentMemory.getBoolAddress(spaces: 1)
                pTypes.insert(Type.bool, at: 0)
            case Type.sentence:
                result = currentMemory.getSentenceAddress(spaces: 1)
                pTypes.insert(Type.sentence, at: 0)
            default:
                print("ERROR: No tiene type en List Functions")
                break
            }
            if array.dimensionated{
                switch ctx.getChild(0)!.toStringTree() {
                case "first_l":
                    let auxQuad = Quadruple.init(operand: "FIRST_L", leftOp: String(array.address), rightOp: "---", result: String(result))
                    qQuad.append(auxQuad)
                    PilaO.insert(String(result), at: 0)
                case "last_l":
                    let auxQuad = Quadruple.init(operand: "LAST_L", leftOp: String(array.address), rightOp: "---", result: String(result))
                    qQuad.append(auxQuad)
                case "order_l":
                    let auxQuad = Quadruple.init(operand: "ORDER_L", leftOp: String(array.address), rightOp: "---", result: String(result))
                    qQuad.append(auxQuad)
                case "orderDesc_l":
                    let auxQuad = Quadruple.init(operand: "ORDERDESC_L", leftOp: String(array.address), rightOp: "---", result: String(result))
                    qQuad.append(auxQuad)
                case "size_l":
                    let auxQuad = Quadruple.init(operand: "SIZE_L", leftOp: String(array.address), rightOp: "---", result: String(result))
                    qQuad.append(auxQuad)
                default:
                    print("Error, no se encontro ninguna función de lista")
                }
            }else{
                print("ERROR: Esta variable no es un arreglo")
            }
        }

    }


	open func enterPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) { }

	open func exitPerimeter_tri(_ ctx: BasicLearnParser.Perimeter_triContext) {
        let rightOperand = PilaO.first!
        let rightOperandType = pTypes.first!
        pTypes.removeFirst()
        PilaO.removeFirst()
        let leftOperand = PilaO.first!
        let leftOperandType = pTypes.first!
        PilaO.removeFirst()
        pTypes.removeFirst()
        
        let resultType = semanticTypeCheck.checkOperation(op: "+", operand1: leftOperandType, operand2: rightOperandType)
        
        if resultType != Type.error {
            
            var result : Int!
            
            switch resultType {
            case Type.number:
                result = currentMemory.getNumberAddress(spaces: 1)
                
            case Type.decimal:
                result = currentMemory.getDecimalAddress(spaces: 1)
                
            default:
                break
            }
            
            let auxQuad = Quadruple.init(operand: "+", leftOp: leftOperand, rightOp: rightOperand, result: String(result))
            
            qQuad.append(auxQuad)
            
            
            PilaO.insert(String(result), at: 0)
            pTypes.insert(resultType, at: 0)
            
        } else {
            print("ERROR TYPE MISMATCH")
            // HANDLE ERROR CORRECTLY
        }
        
        
        let newRightOperand = PilaO.first!
        let newRightOperandType = pTypes.first!
        pTypes.removeFirst()
        PilaO.removeFirst()
        let newLeftOperand = PilaO.first!
        let newLeftOperandType = pTypes.first!
        pTypes.removeFirst()
        PilaO.removeFirst()
        
        let newResultType = semanticTypeCheck.checkOperation(op: "+", operand1: newLeftOperandType, operand2: newRightOperandType)
        
        
        if newResultType != Type.error {
            
            var result : Int!
            
            switch newResultType {
            case Type.number:
                result = currentMemory.getNumberAddress(spaces: 1)
                
            case Type.decimal:
                result = currentMemory.getDecimalAddress(spaces: 1)
                
            default:
                break
            }
            
            let auxQuad = Quadruple.init(operand: "PERIMETERTRI", leftOp: newLeftOperand, rightOp: newRightOperand, result: String(result))
            
            qQuad.append(auxQuad)
            
            
            PilaO.insert(String(result), at: 0)
            pTypes.insert(newResultType, at: 0)
            
        } else {
            print("ERROR TYPE MISMATCH")
            // HANDLE ERROR CORRECTLY
        }
    }


	open func enterSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) { }

	open func exitSquare_root_absolute(_ ctx: BasicLearnParser.Square_root_absoluteContext) {
        let operation = ctx.getChild(0)?.toStringTree()
        
        let operatorVm = operation!.uppercased()
        
        let operand = PilaO.first!
        PilaO.removeFirst()
        
        let resultType = Type.decimal
        pTypes.removeFirst()
        
        if resultType != Type.error {
            var result : Int!
            
       
//            if resultType == Type.number {
//                result = currentMemory.getNumberAddress(spaces: 1)
//            } else {
//                result = currentMemory.getDecimalAddress(spaces: 1)
//            }
            
            result = currentMemory.getDecimalAddress(spaces: 1)
            
            let auxQuad = Quadruple.init(operand: operatorVm, leftOp: operand, rightOp: "___", result: String(result))
            
            qQuad.append(auxQuad)
            
            PilaO.insert(String(result), at: 0)
            pTypes.insert(resultType, at: 0)
        }
    }


	open func enterArea_tri(_ ctx: BasicLearnParser.Area_triContext) { }

	open func exitArea_tri(_ ctx: BasicLearnParser.Area_triContext) {
        let rightOperand = PilaO.first!
        let rightOperandType = pTypes.first
        pTypes.removeFirst()
        PilaO.removeFirst()
        let leftOperand = PilaO.first!
        let leftOperandType = pTypes.first
        pTypes.removeFirst()
        PilaO.removeFirst()

        let resultType = semanticTypeCheck.checkOperation(op: "*", operand1: leftOperandType!, operand2: rightOperandType!)


        if resultType != Type.error {

            var result : Int!

            switch resultType {
            case Type.number:
                result = currentMemory.getNumberAddress(spaces: 1)

            case Type.decimal:
                result = currentMemory.getDecimalAddress(spaces: 1)

            default:
                break
            }

            let auxQuad = Quadruple.init(operand: "AREATRI", leftOp: leftOperand, rightOp: rightOperand, result: String(result))

            qQuad.append(auxQuad)


            PilaO.insert(String(result), at: 0)
            pTypes.insert(resultType, at: 0)

        } else {
            print("ERROR TYPE MISMATCH")
            // HANDLE ERROR CORRECTLY
    }
}


	open func enterSquare(_ ctx: BasicLearnParser.SquareContext) { }

	open func exitSquare(_ ctx: BasicLearnParser.SquareContext) {
        let operation = ctx.getChild(0)?.toStringTree()
        
        let operatorVm = operation!.uppercased()
        
        let rightOperand = PilaO.first!
        let rightOperandType = pTypes.first
        pTypes.removeFirst()
        PilaO.removeFirst()
        let leftOperand = PilaO.first!
        let leftOperandType = pTypes.first
        pTypes.removeFirst()
        PilaO.removeFirst()
        
        let resultType = semanticTypeCheck.checkOperation(op: "*", operand1: leftOperandType!, operand2: rightOperandType!)
      
        if resultType != Type.error {
          
            
            var result : Int!
            
            switch resultType {
            case Type.number:
                result = currentMemory.getNumberAddress(spaces: 1)
                
            case Type.decimal:
                result = currentMemory.getDecimalAddress(spaces: 1)
                
            default:
                break
            }
            
            let auxQuad = Quadruple.init(operand: operatorVm, leftOp: leftOperand, rightOp: rightOperand, result: String(result))
            
            qQuad.append(auxQuad)
            
            
            PilaO.insert(String(result), at: 0)
            pTypes.insert(resultType, at: 0)
            
        } else {
            print("ERROR TYPE MISMATCH")
            // HANDLE ERROR CORRECTLY
        }
    }


	open func enterEveryRule(_ ctx: ParserRuleContext) { }

	open func exitEveryRule(_ ctx: ParserRuleContext) { }

	open func visitTerminal(_ node: TerminalNode) { }

	open func visitErrorNode(_ node: ErrorNode) { }
}
