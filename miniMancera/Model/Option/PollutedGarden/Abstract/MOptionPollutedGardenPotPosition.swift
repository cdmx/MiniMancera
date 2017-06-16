import UIKit

class MOptionPollutedGardenPotPosition
{
    private static let kPotWidth:CGFloat = 41
    private static let kCountPots:Int = 5
    
    class func positionsFor(model:MOptionPollutedGarden) -> [CGFloat]
    {
        let width:CGFloat = model.size.width
        var all:[CGFloat] = allPositions(width:width)
        var count:Int = all.count
        
        while count > kCountPots
        {
            let random:Int = randomFrom(count:count)
            all.remove(at:random)
            
            count = all.count
        }
        
        return all
    }
    
    private class func allPositions(width:CGFloat) -> [CGFloat]
    {
        var positions:[CGFloat] = []
        var currentPosition:CGFloat = kPotWidth / 2.0
        
        while currentPosition < width
        {
            positions.append(currentPosition)
            currentPosition += kPotWidth
        }
        
        return positions
    }
    
    private class func randomFrom(count:Int) -> Int
    {
        let count32:UInt32 = UInt32(count)
        let random:UInt32 = arc4random_uniform(count32)
        let randomInt:Int = Int(random)
        
        return randomInt
    }
}
