import Foundation

indirect enum Expr {
    case num(Int)
    case name(String)
    case ref(String)
    case bool(Bool)
    case add(Expr, Expr)
    case sub(Expr, Expr)
    case lt(Expr, Expr)
    case gt(Expr, Expr)
    case eq(Expr, Expr)
    case and(Expr, Expr)
    case or(Expr, Expr)
    case constructorCall(String, [Expr])
}

indirect enum Stmt {
    case varDecl(String, Expr)
    case store(Expr, Expr)
    case load(String, Expr)
    case ifStmt(Expr, [Stmt], [Stmt])
    case whileStmt(Expr, [Stmt])
}

struct Program {
    let stmts: [Stmt]
}

extension Expr: CustomStringConvertible {
    var description: String {
        switch self {
        case .num(let n): return "\(n)"
        case .name(let s): return s
        case .ref(let s): return "&\(s)"
        case .bool(let b): return "\(b)"
        case .add(let l, let r): return "(\(l) + \(r))"
        case .sub(let l, let r): return "(\(l) - \(r))"
        case .lt(let l, let r): return "(\(l) < \(r))"
        case .gt(let l, let r): return "(\(l) > \(r))"
        case .eq(let l, let r): return "(\(l) == \(r))"
        case .and(let l, let r): return "(\(l) && \(r))"
        case .or(let l, let r): return "(\(l) || \(r))"
        case .constructorCall(let cls, let args):
            let argsDesc = args.map { $0.description }.joined(separator: ", ")
            return "\(cls).init(\(argsDesc))"
        }
    }
    
    var astDescription: String {
        switch self {
        case .num(let n): return "(Num \(n))"
        case .name(let s): return "(Name \(s))"
        case .ref(let s): return "(Ref \(s))"
        case .bool(let b): return "(Bool \(b))"
        case .add(let l, let r): return "(Add \(l.astDescription), \(r.astDescription))"
        case .sub(let l, let r): return "(Sub \(l.astDescription), \(r.astDescription))"
        case .lt(let l, let r): return "(Lt \(l.astDescription), \(r.astDescription))"
        case .gt(let l, let r): return "(Gt \(l.astDescription), \(r.astDescription))"
        case .eq(let l, let r): return "(Eq \(l.astDescription), \(r.astDescription))"
        case .and(let l, let r): return "(And \(l.astDescription), \(r.astDescription))"
        case .or(let l, let r): return "(Or \(l.astDescription), \(r.astDescription))"
        case .constructorCall(let cls, let args):
            let argsDesc = args.map { $0.astDescription }.joined(separator: ", ")
            return "(ConstructorCall \(cls), [\(argsDesc)])"
        }
    }
}

extension Stmt: CustomStringConvertible {
    var description: String {
        switch self {
        case .varDecl(let name, let expr): return "var \(name) = \(expr);"
        case .store(let target, let value): return "*\(target) = \(value);"
        case .load(let name, let target): return "\(name) = *\(target);"
        case .ifStmt(let cond, let thenStmts, let elseStmts):
            let thenBody = thenStmts.map { $0.description }.joined(separator: " ")
            let elseBody = elseStmts.map { $0.description }.joined(separator: " ")
            return "if \(cond) { \(thenBody) } else { \(elseBody) }"
        case .whileStmt(let cond, let body):
            let bodyDesc = body.map { $0.description }.joined(separator: " ")
            return "while \(cond) { \(bodyDesc) }"
        }
    }
    
    var astDescription: String {
        switch self {
        case .varDecl(let name, let expr): return "(VarDeclStmt \(name), \(expr.astDescription))"
        case .store(let target, let value): return "(StoreStmt \(target.astDescription), \(value.astDescription))"
        case .load(let name, let target): return "(LoadStmt \(name), \(target.astDescription))"
        case .ifStmt(let cond, let thenStmts, let elseStmts):
            let thenDesc = thenStmts.map { $0.astDescription }.joined(separator: "; ")
            let elseDesc = elseStmts.map { $0.astDescription }.joined(separator: "; ")
            return "(IfStmt \(cond.astDescription), [\(thenDesc)], [\(elseDesc)])"
        case .whileStmt(let cond, let body):
            let bodyDesc = body.map { $0.astDescription }.joined(separator: "; ")
            return "(WhileStmt \(cond.astDescription), [\(bodyDesc)])"
        }
    }
}

extension Program: CustomStringConvertible {
    var description: String {
        stmts.map { $0.description }.joined(separator: "\n")
    }
}

// Example usage
let prog = Program(stmts: [
    .varDecl("a", .constructorCall("A", [])),
    .store(.ref("a"), .num(42)),
    .ifStmt(.eq(.name("a"), .num(1)), [.varDecl("b", .bool(true))], [.varDecl("b", .bool(false))])
])

print(prog)
print("--- AST ---")
prog.stmts.forEach { print($0.astDescription) }
