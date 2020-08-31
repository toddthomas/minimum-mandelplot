//
//  main.swift
//  minimum-mandelplot
//
//  Created by Todd Thomas on 8/31/20.
//  Copyright © 2020 Todd Thomas. All rights reserved.
//

/// This is the code discussed in my blog post at https://toddthomas.space/2020/08/30/minimum-mandelplot.html
/// about a concise Mandelbrot set plotter written in the Julia language, and my musings about what a similarly compact, yet readable
/// Swift version would be.

import Numerics

typealias Z = Complex<Double>

for i in stride(from: 1.0, through: -1.0, by: -0.05) {
	for r in stride(from: -2.0, through: 0.5, by: 0.0315) {
		sequence(first: Z(0, 0)) { z in
			z*z + Z(r, i)
		}
		.prefix(51)
		.allSatisfy { $0.length <= 2 } ?
			print("*", terminator: "")
			: print(" ", terminator: "")
	}
	print()
}

let swiftCode = """
import Numerics

typealias Z = Complex<Double>

for i in stride(from: 1.0, through: -1.0, by: -0.05) {
	for r in stride(from: -2.0, through: 0.5, by: 0.0315) {
		sequence(first: Z(0, 0)) { z in
			z*z + Z(r, i)
		}
		.prefix(51)
		.allSatisfy { $0.length <= 2 } ?
			print("*", terminator: "")
			: print(" ", terminator: "")
	}
	print()
}
"""
print("Swift Std. Lib. only: \(swiftCode.count) chars")

let juliaCode = """
function mandelbrot(a)
    z = 0
    for i=1:50
        z = z^2 + a
    end
    return z
end

for y=1.0:-0.05:-1.0
    for x=-2.0:0.0315:0.5
        abs(mandelbrot(complex(x, y))) < 2 ? print("*") : print(" ")
    end
    println()
end
"""
print("Julia: \(juliaCode.count) chars")

for i in stride(-1.0...1.0, by: 0.05) {
	for r in stride(-2.0...0.5, by: 0.0315) {
		sequence(first: Z(0, 0)) { z in
			z*z + Z(r, i)
		}
		.prefix(51)
		.allSatisfy { $0.length <= 2 } ?
			print("*", terminator: "")
			: print(" ", terminator: "")
	}
	print()
}

let shorterSwift = """
import Numerics

typealias Z = Complex<Double>

for i in stride(-1.0...1.0, by: 0.05) {
	for r in stride(-2.0...0.5, by: 0.0315) {
		sequence(first: Z(0, 0)) { z in
			z*z + Z(r, i)
		}
		.prefix(51)
		.allSatisfy { $0.length <= 2 } ?
			print("*", terminator: "")
			: print(" ", terminator: "")
	}
	print()
}
"""
print("Swift with Std. Lib. enhancements: \(shorterSwift.count) chars")

let shortestSwift = """
import Numerics

typealias Z = Complex<Double>

for i in stride(-1.0...1.0, by: 0.05) {
	for r in stride(-2.0...0.5, by: 0.0315) {
		sequence(first: Z(0, 0)) { z in
			z*z + Z(r, i)
		}
		.prefix(51)
		.allSatisfy { $0.length <= 2 } ? print("*") : print(" ")
	}
	println()
}
"""
print("Swift with different print funcs: \(shortestSwift.count) chars")

// Can't build inverted ranges!
//for i in stride(1.0...(-1.0), by: -0.05) {
//	print(i)
//}

// Testing `reversed()` on strides.
//for i in stride(-1.0...1.0, by: 0.05) {
//	print(i)
//}
//
//for i in stride(-1.0...1.0, by: 0.05).reversed() {
//	print(i)
//}
