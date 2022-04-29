enum Peg : String {
    case left, middle, right
}

func otherPeg(_ p: Peg, _ q: Peg) -> Peg {
    [.left, .middle, .right]
        .filter({ $0 != p && $0 != q })
        .first!
}

func printMove(from p : Peg, to q : Peg) {
    print("Move disk from the \(p.rawValue) peg to the \(q.rawValue) peg.")
}

func towersOfHanoi(_ n: Int) {
    // prints moves for towers of Hanoi, but with different starting and ending pegs
    func hanoiPegs(_ n: Int, from p: Peg, to q: Peg) {
        if n > 0 {
            hanoiPegs(n - 1, from: p, to: otherPeg(p, q))
            printMove(from: p, to: q)
            hanoiPegs(n - 1, from: otherPeg(p, q), to: q)
        }
    }
    hanoiPegs(n, from: .left, to: .right)
}
