import SpriteKit

class MOptionTamalesOaxaquenosStrategyBegin:MGameStrategyMain<MOptionTamalesOaxaquenos>
{
    init(model:MOptionTamalesOaxaquenos)
    {
        let updateItems:[MGameUpdate<MOptionTamalesOaxaquenos>] = [
            model.player]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
}
