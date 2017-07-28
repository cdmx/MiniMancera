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
        strategy = MOptionTamalesOaxaquenosPlayerStrategyDive(model:self)
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
    
    func hole()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyHole(model:self)
    }
    
    func finish()
    {
        strategy = MOptionTamalesOaxaquenosPlayerStrategyFinish(model:self)
    }
    
    func impulse()
    {
        guard
        
            let _:MOptionTamalesOaxaquenosPlayerStrategyWalking = strategy as? MOptionTamalesOaxaquenosPlayerStrategyWalking
        
        else
        {
            guard
                
                let _:MOptionTamalesOaxaquenosPlayerStrategyJump = strategy as? MOptionTamalesOaxaquenosPlayerStrategyJump
                
            else
            {
                return
            }
            
            strategyDive()
            
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
            guard
                
                let _:MOptionTamalesOaxaquenosPlayerStrategyDive = strategy as? MOptionTamalesOaxaquenosPlayerStrategyDive
                
            else
            {
                return
            }
            
            walk()
            
            return
        }
        
        walk()
    }
}
