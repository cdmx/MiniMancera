import SpriteKit

class MOptionReformaCrossingLane
{
    var foes:[MOptionReformaCrossingFoeItem]
    private(set) var possibleFoes:[MOptionReformaCrossingFoeItem.Type]
    private(set) var scaleHorizontal:CGFloat
    private(set) var direction:CGFloat
    private(set) var positionY:CGFloat
    private(set) var sceneWidth:CGFloat
    private(set) var addedSpeed:CGFloat
    private var collectable:Bool
    private let deltaVertical:CGFloat
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
        foes = []
        possibleFoes = []
        scaleHorizontal = 0
        direction = 0
        collectable = false
        addedSpeed = 0
        
        let size:CGSize = MGame.sceneSize
        let sceneHeight_2:CGFloat = size.height / 2.0
        sceneWidth = size.width
        positionY = sceneHeight_2 + deltaVertical
    }
    
    //MARK: public
    
    func foeTrip(foe:MOptionReformaCrossingFoeItem) -> MOptionReformaCrossingFoeItemTrip?
    {
        return nil
    }
    
    func hasFoeWaiting() -> Bool
    {
        return false
    }
    
    //MARK: final
    
    final func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        for foe:MOptionReformaCrossingFoeItem in foes
        {
            foe.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
    
    final func removeFoe(item:MOptionReformaCrossingFoeItem)
    {
        var foes:[MOptionReformaCrossingFoeItem] = []
        
        for foe:MOptionReformaCrossingFoeItem in self.foes
        {
            if foe !== item
            {
                foes.append(foe)
            }
        }
        
        self.foes = foes
    }
    
    final func stopFoes()
    {/*
        for foe:VOptionReformaCrossingFoe in foes
        {
            foe.totalStop()
        }
        
        foes = []*/
    }
    
    final func restart(addedSpeed:CGFloat)
    {
        self.addedSpeed = addedSpeed
        collectable = true
        foes = []
    }
    
    final func playerCollectAt(position:CGPoint) -> Bool
    {
        if collectable
        {
            let playerY:CGFloat = position.y
            
            if playerY > positionY
            {
                collectable = false
                
                return true
            }
        }
        
        return false
    }
}
