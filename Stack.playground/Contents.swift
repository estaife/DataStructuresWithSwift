private final class Node<T> {
    var key: T?
    var next: Node?
    
    init(_ value: T? = nil) {
        key = value
    }
}

protocol StackProtocol {
    associatedtype T
    
    var  isEmpty: Bool { get }
    func push(element: T)
    func pop() -> T?
    func peek() -> T?
}

struct StackIterator<T>: IteratorProtocol {
    typealias Element = T
    
    private let stack: Stack<T>
    private var currentNode: Node<T>?
    
    init(_ stack: Stack<T>) {
        self.stack = stack
        currentNode = stack.top
    }
    
    mutating func next() -> T? {
        guard let node = currentNode else { return nil }
        let nextKey = currentNode?.key
        currentNode = node.next
        return nextKey
    }
}

final class Stack<T>: StackProtocol {
    fileprivate var top: Node<T>?
    
    var isEmpty: Bool {
        get {
            return top == nil
        }
    }
    
    func push(element: T) {
        let newNode = Node(element)
        if top == nil {
            top = newNode
        } else {
            newNode.next = top
            top = newNode
        }
    }
    
    func pop() -> T? {
        guard let top = self.top else { return nil }
        self.top = top.next
        return top.key
    }
    
    func peek() -> T? {
        guard let top = self.top else { return nil }
        return top.key
    }
}

extension Stack: Sequence {
    func makeIterator() -> StackIterator<T> {
        return StackIterator(self)
    }
}

var stack = Stack<String>()
stack.push(element: "1")
stack.push(element: "2")
stack.push(element: "3")
stack.push(element: "4")

stack.map { print($0) }
