import UIKit

class MOptionPollutedGardenPlantPosition
{
    private let positions:[CGFloat]
    private let kCountPots:Int = 5
    private static let kPotWidth:CGFloat = 20
    
    private class func allPositions() -> [CGFloat]
    {
        let width:CGFloat = MGame.sceneSize.width
        var positions:[CGFloat] = []
        var currentPosition:CGFloat = kPotWidth / 2.0
        
        while currentPosition < width
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
