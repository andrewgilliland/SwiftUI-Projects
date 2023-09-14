import Foundation

extension Float {
    var metersToInches: Float {
        self * 39.3701 // 1 meter = 39.3701 inches
    }

    var displayImperial: String {
        let totalInches = Int((39.3701 * self).rounded())
        let feet = totalInches / 12
        let inches = totalInches % 12

        return "\(feet)'\(inches)\""
    }
}
