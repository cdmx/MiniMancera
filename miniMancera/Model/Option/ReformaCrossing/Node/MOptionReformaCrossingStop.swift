import SpriteKit

class MOptionReformaCrossingStop:MGameUpdateProtocol
{
    weak var view:VOptionReformaCrossingStop?
    private var shouldStop:Bool
    private var unblockTimeout:TimeInterval?
    private let kBlockDuration:TimeInterval = 0.2
    
    init()
    {
        shouldStop = false
    }
    
    //MARK: public
    
    func playerStop()
    {
        shouldStop = true
    }
    
    //MARK: game update protocol

    func update(elapsedTime:TimeInterval, scene:SKScene)
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
}
