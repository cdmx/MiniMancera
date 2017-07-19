import Foundation

class MOptionTamalesOaxaquenosPlayer:MGameUpdate<MOptionTamalesOaxaquenos>
{
    weak var view:VOptionTamalesOaxaquenosPlayer?
    private var strategy:MGameStrategy<MOptionTamalesOaxaquenosPlayer, MOptionTamalesOaxaquenos>?
    
    override init()
    {
        super.init()
        
        stand()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionTamalesOaxaquenos>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: private
    
    private func strategyJump()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyJump(model:self)
    }
    
    private func strategyDive()
    {
        
    }
    
    //MARK: public
    
    func stand()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyStand(model:self)
    }
    
    func walk()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyWalking(model:self)
    }
    
    func impulse()
    {
        guard
        
            let _:MOptionTamalesOaxaquenosPlayerStrategyWalking = strategy as? MOptionTamalesOaxaquenosPlayerStrategyWalking
        
        else
        {
            return
        }
        
        strategyJump()
    }
    
    func landed()
    {
        guard
        
            let _:MOptionTamalesOaxaquenosPlayerStrategyJump = strategy as? MOptionTamalesOaxaquenosPlayerStrategyJump
        
        else
        {
            return
        }
        
        walk()
    }
}
