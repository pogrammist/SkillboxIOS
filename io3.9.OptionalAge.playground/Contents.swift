import UIKit

var age = Int("25z") ?? 0

var result = age < 18 ? "Hello, young man/woman" : "Hello grown man/woman"
result += " \(age)"
