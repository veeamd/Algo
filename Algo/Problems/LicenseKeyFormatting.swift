//
//  LicenseKeyFormatting.swift
//  Algo
//
//  Created by Wei Zhang on 7/14/22.
//

import Foundation

class LicenseKeyFormatting {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        let filtered = s.filter { $0 != "-" }.uppercased()
        guard filtered.count > 0 else { return "" }
        var firstGroupCount = filtered.count % k
        firstGroupCount = firstGroupCount == 0 ? k : firstGroupCount
        var utf8: [Int8] = []
        var i = 0
        let utf8View = filtered.utf8CString
        while i < filtered.count {
            if i == 0 {
                utf8.append(contentsOf: utf8View[i..<firstGroupCount])
                utf8.append(45)
                i += firstGroupCount
            } else {
                utf8.append(contentsOf: utf8View[i..<(i + k)])
                utf8.append(45)
                i += k
            }
        }
        utf8[utf8.count - 1] = 0
        return String(cString: utf8)
    }
}
