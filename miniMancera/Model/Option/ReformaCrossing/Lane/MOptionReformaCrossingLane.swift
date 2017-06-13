import UIKit

class MOptionReformaCrossingLane:MOptionReformaCrossingLaneProtocol
{
    var foes:[MOptionReformaCrossingFoe]
    private(set) var verticalPosition:CGFloat
    private(set) var sceneWidth:CGFloat
    private let deltaVertical:CGFloat
    private var addScore:Bool
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
        foes = []
        addScore = false
        verticalPosition = 0
        sceneWidth = 0
    }
    
    //MARK: public
    
    func foeInitialPoint(foe:MOptionReformaCrossingFoe) -> CGPoint
    {
        return CGPoint.zero
    }
    
    func foeEndingPoint(foe:MOptionReformaCrossingFoe) -> CGPoint
    {
        return CGPoint.zero
    }
    
    func hasFoeWaiting(sceneSize:CGSize) -> Bool
    {
        return false
    }
    
    final func removeFoe(item:MOptionReformaCrossingFoe)
    {
        var foes:[MOptionReformaCrossingFoe] = []
        
        for foe:MOptionReformaCrossingFoe in self.foes
        {
            if foe !== item
            {
                foes.append(foe)
            }
        }
        
        self.foes = foes
    }
    
    final func stopFoes()
    {
        for foe:MOptionReformaCrossingFoe in foes
        {
            foe.totalStop()
        }
        
        foes = []
    }
    
    final func configureForScene(size:CGSize)
    {
        addScore = true
        
        sceneWidth = size.width
        let sceneHeight_2:CGFloat = size.height / 2.0
        verticalPosition = sceneHeight_2 + deltaVertical
    }
    
    //MARK: lane protocol
    
    var scaleHorizontal:CGFloat
    {
        get
        {
            return 0
        }
    }
    
    var direction:CGFloat
    {
        get
        {
            return 0
        }
    }
}
