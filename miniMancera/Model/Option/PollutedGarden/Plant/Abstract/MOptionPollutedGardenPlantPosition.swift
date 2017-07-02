import UIKit

class MOptionPollutedGardenPlantPosition
{
    private let positions:[CGFloat]
    private let kCountPots:Int = 5
    private static let kPotWidth:CGFloat = 20
    
    private class func allPositions() -> [CGFloat]
    {
        let width:CGFloat = MGame.sceneSize.width
        let potWidth_2:CGFloat = kPotWidth / 2.0
        let usableWidth:CGFloat = width - kPotWidth
        var positions:[CGFloat] = []
        var currentPosition:CGFloat = potWidth_2
        
        while currentPosition < usableWidth
        {
            positions.append(currentPosition)
            currentPosition += kPotWidth
        }
        
        return positions
    }
    
    init()
    {
        positions = MOptionPollutedGardenPlantPosition.allPositions()
    }
    
    //MARK: private
    
    private func randomFrom(count:Int) -> Int
    {
        let count32:UInt32 = UInt32(count)
        let random:UInt32 = arc4random_uniform(count32)
        let randomInt:Int = Int(random)
        
        return randomInt
    }
    
    //MARK: public
    
    func randomPositions() -> [CGFloat]
    {
        var positions:[CGFloat] = self.positions
        var count:Int = positions.count
        
        while count > kCountPots
        {
            let random:Int = randomFrom(count:count)
            positions.remove(at:random)
            
            count = positions.count
        }
        
        return positions
    }
}
