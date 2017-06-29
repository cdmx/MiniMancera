import SpriteKit

class MOptionReformaCrossingLane:MGameUpdateProtocol
{
    let positionY:CGFloat
    var foes:[MOptionReformaCrossingFoeItem]
    private(set) var possibleFoes:[MOptionReformaCrossingFoeItem.Type]
    private(set) var scaleHorizontal:CGFloat
    private(set) var direction:CGFloat
    private(set) var sceneWidth:CGFloat
    private(set) var addedSpeed:CGFloat
    private let deltaVertical:CGFloat
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
        foes = []
        possibleFoes = []
        scaleHorizontal = 0
        direction = 0
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
    
    func removeFoe(item:MOptionReformaCrossingFoeItem)
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
    
    func restart(addedSpeed:CGFloat)
    {
        self.addedSpeed = addedSpeed
        foes = []
    }
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        for foe:MOptionReformaCrossingFoeItem in foes
        {
            foe.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
    }
}
