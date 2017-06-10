import UIKit

class MCreateSelected
{
    private(set) var items:[MCreateSelectedItem]
    private let pi2:CGFloat
    private let maxRad:CGFloat
    private let kRandomRange:UInt32 = 157
    private let kRandomRangeDivider:CGFloat = 100
    private let kSeparationRad:CGFloat = 0.349066
    private let kRotationAmount:CGFloat = 0.0174533
    
    init()
    {
        pi2 = CGFloat.pi + CGFloat.pi
        maxRad = pi2 - kSeparationRad
        items = []
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.refresh()
        }
    }
    
    //MARK: private
    
    private func randomRadians(fromRadian:CGFloat) -> CGFloat
    {
        let random:UInt32 = arc4random_uniform(kRandomRange)
        let randomFloat:CGFloat = CGFloat(random)
        var randomDivided:CGFloat = randomFloat / kRandomRangeDivider
        
        if randomDivided + fromRadian > maxRad
        {
            randomDivided = maxRad - fromRadian
        }
        
        return randomDivided
    }
    
    private func refresh()
    {
        var items:[MCreateSelectedItem] = []
        var startingRad:CGFloat = 0
        
        while startingRad < maxRad
        {
            let radians:CGFloat = randomRadians(fromRadian:startingRad)
            
            if radians > 0
            {
                let endingRad:CGFloat = startingRad + radians
                let item:MCreateSelectedItem = MCreateSelectedItem(
                    startingRad:startingRad,
                    endingRad:endingRad)
                items.append(item)
                
                startingRad = endingRad + kSeparationRad
            }
        }
        
        self.items = items
    }
    
    //MARK: public
    
    func rotate()
    {
        for item:MCreateSelectedItem in items
        {
            item.startingRad += kRotationAmount
            item.endingRad += kRotationAmount
            
            if item.startingRad > pi2
            {
                item.startingRad = item.startingRad.truncatingRemainder(dividingBy:pi2)
                item.endingRad = item.endingRad.truncatingRemainder(dividingBy:pi2)
            }
        }
    }
}
