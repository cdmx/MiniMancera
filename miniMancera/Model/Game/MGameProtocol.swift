import Foundation

protocol MGameProtocol
{
    associatedtype modelType:MGame
    
    var strategy:MGameStrategyMain<modelType>? { get }
}
