import UIKit

class MOptionReformaCrossingLane
{
    var foes:[MOptionReformaCrossingFoeItem]
    private(set) var possibleFoes:[MOptionReformaCrossingFoeItem.Type]
    private(set) var scaleHorizontal:CGFloat
    private(set) var direction:CGFloat
    private(set) var verticalPosition:CGFloat
    private(set) var sceneWidth:CGFloat
    private let deltaVertical:CGFloat
    private var collectable:Bool
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
        foes = []
        possibleFoes = []
        scaleHorizontal = 0
        direction = 0
        collectable = false
        
        let size:CGSize = MGame.sceneSize
        let sceneHeight_2:CGFloat = size.height / 2.0
        sceneWidth = size.width
        verticalPosition = sceneHeight_2 + deltaVertical
    }
    
    //MARK: public
    
    func foeInitialPoint(foe:VOptionReformaCrossingFoe) -> CGPoint
    {
        return CGPoint.zero
    }
    
    func foeEndingPoint(foe:VOptionReformaCrossingFoe) -> CGPoint
    {
        return CGPoint.zero
    }
    
    func hasFoeWaiting() -> Bool
    {
        return false
    }
    
    //MARK: final
    
    final func removeFoe(item:VOptionReformaCrossingFoe)
    {/*
        var foes:[VOptionReformaCrossingFoe] = []
        
        for foe:VOptionReformaCrossingFoe in self.foes
        {
            if foe !== item
            {
                foes.append(foe)
            }
        }
        
        self.foes = foes*/
    }
    
    final func stopFoes()
    {/*
        for foe:VOptionReformaCrossingFoe in foes
        {
            foe.totalStop()
        }
        
        foes = []*/
    }
    
    final func restart()
    {
        collectable = true
        foes = []
    }
    
    final func playerCollectAt(position:CGPoint) -> Bool
    {
        if collectable
        {
            let playerY:CGFloat = position.y
            
            if playerY > verticalPosition
            {
                collectable = false
                
                return true
            }
        }
        
        return false
    }
}
