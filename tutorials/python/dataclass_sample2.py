from typing import Tuple
from dataclasses import dataclass, asdict


@dataclass
class InventoryItem:
    """Class for keeping track of an item in inventory."""

    name: str = "item"
    quantity_on_hand: int = 0
    layer: Tuple[int, int] = (1, 0)


if __name__ == "__main__":
    i = InventoryItem()
    d = asdict(i)
