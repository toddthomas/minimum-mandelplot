//
//  Stride.swift
//  mandeltweet
//
//  Created by Todd Thomas on 8/30/20.
//  Copyright © 2020 Todd Thomas. All rights reserved.
//

import Foundation

func stride<T>(_ range: ClosedRange<T>, by strideParam: T.Stride) -> StrideThrough<T> where T: Strideable {
    stride(from: range.lowerBound, through: range.upperBound, by: strideParam)
}

func stride<T>(_ range: Range<T>, by strideParam: T.Stride) -> StrideTo<T> where T: Strideable {
    stride(from: range.lowerBound, to: range.upperBound, by: strideParam)
}
