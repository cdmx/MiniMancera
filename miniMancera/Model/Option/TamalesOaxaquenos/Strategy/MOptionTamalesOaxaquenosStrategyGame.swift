import Foundation

class MOptionTamalesOaxaquenosStrategyGame:MGameStrategyMain<MOptionTamalesOaxaquenos>
{
    init(model:MOptionTamalesOaxaquenos)
    {
        let updateItems:[MGameUpdate<MOptionTamalesOaxaquenos>] = [
            model.camera,
            model.player]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
}
