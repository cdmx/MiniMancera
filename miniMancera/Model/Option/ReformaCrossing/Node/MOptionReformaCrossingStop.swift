import Foundation

class MOptionReformaCrossingStop:MGameUpdate<MOptionReformaCrossing>
{
    weak var view:VOptionReformaCrossingStop?
    private var shouldStop:Bool
    private var unblockTimeout:TimeInterval?
    private let kBlockDuration:TimeInterval = 0.2
    
    override init()
    {
        shouldStop = false
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if shouldStop
        {
            if unblockTimeout == nil
            {
                view?.animateStop()
            }
            
            unblockTimeout = elapsedTime + kBlockDuration
            shouldStop = false
        }
        else
        {
            if let unblockTimeout:TimeInterval = self.unblockTimeout
            {
                if elapsedTime > unblockTimeout
                {
                    self.unblockTimeout = nil
                    view?.restoreStand()
                }
            }
        }
    }
    
    //MARK: public
    
    func playerStop()
    {
        shouldStop = true
    }
}
