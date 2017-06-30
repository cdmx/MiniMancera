import UIKit

class MOptionReformaCrossingLane:MGameUpdate<MOptionReformaCrossing>
{
    let positionY:CGFloat
    var foes:[MOptionReformaCrossingFoeItem]
    private(set) var possibleFoes:[MOptionReformaCrossingFoeItem.Type]
    private(set) var direction:CGFloat
    private(set) var sceneWidth:CGFloat
    private(set) var addedSpeed:CGFloat
    private let deltaVertical:CGFloat
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
        foes = []
        possibleFoes = []
        direction = 0
        addedSpeed = 0
        
        let size:CGSize = MGame.sceneSize
        let sceneHeight_2:CGFloat = size.height / 2.0
        sceneWidth = size.width
        positionY = sceneHeight_2 + deltaVertical
        
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        for foe:MOptionReformaCrossingFoeItem in foes
        {
            foe.update(
                elapsedTime:elapsedTime,
                scene:scene)
        }
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
}
